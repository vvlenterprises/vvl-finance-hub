import { useState, useEffect } from 'react';
import { MainLayout } from '@/components/MainLayout';
import { CustomerCard } from '@/components/CustomerCard';
import { useCustomerDirectory } from '@/hooks/useData';
import { useAuth } from '@/contexts/AuthContext';
import { usePermissionChecker } from '@/hooks/usePermissions';
import { Search, Plus, Filter, Users, CheckCircle, UserMinus, AlertCircle } from 'lucide-react';
import { Input } from '@/components/ui/input';
import { Link, useSearchParams } from 'react-router-dom';
import { Skeleton } from '@/components/ui/skeleton';
import { EmptyCustomersIllustration } from '@/components/illustrations';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';

export const isCustomerOverdue = (customer: any) => {
  if (customer.is_deleted === true) return false;
  
  // Pick the latest active loan (same loan that Customer Details page displays)
  const activeLoans = (customer.loans || [])
    .filter((l: any) => l.is_deleted === false && l.status === 'active')
    .sort((a: any, b: any) => {
      const timeA = new Date(a.created_at || a.start_date || 0).getTime();
      const timeB = new Date(b.created_at || b.start_date || 0).getTime();
      return timeB - timeA;
    });

  const activeLoan = activeLoans[0];
  if (!activeLoan) return false;

  const outstanding = Number(activeLoan.outstanding_amount ?? 0);
  if (outstanding <= 0) return false;

  const today = new Date();
  today.setHours(0, 0, 0, 0);

  if (activeLoan.end_date) {
    const [y, m, d] = activeLoan.end_date.split('T')[0].split('-').map(Number);
    const endDate = new Date(y, m - 1, d);
    endDate.setHours(0, 0, 0, 0);
    return today.getTime() > endDate.getTime();
  }

  if (activeLoan.start_date) {
    const [y, m, d] = activeLoan.start_date.split('T')[0].split('-').map(Number);
    const startDate = new Date(y, m - 1, d);
    startDate.setHours(0, 0, 0, 0);
    const diffDays = Math.floor((today.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));
    return diffDays > 100;
  }

  return false;
};

export default function CustomersPage() {
  const [searchParams, setSearchParams] = useSearchParams();
  const [search, setSearch] = useState('');
  
  const initialStatus = searchParams.get('status') || sessionStorage.getItem('customer_status_filter') || 'active';
  const [statusFilter, setStatusFilterState] = useState<string>(initialStatus);

  useEffect(() => {
    const urlStatus = searchParams.get('status');
    if (urlStatus && urlStatus !== statusFilter) {
      setStatusFilterState(urlStatus);
      sessionStorage.setItem('customer_status_filter', urlStatus);
    }
  }, [searchParams]);

  const setStatusFilter = (newStatus: string) => {
    setStatusFilterState(newStatus);
    sessionStorage.setItem('customer_status_filter', newStatus);
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev);
      if (newStatus === 'active') {
        next.delete('status');
      } else {
        next.set('status', newStatus);
      }
      return next;
    }, { replace: true });
  };
  const { data: customers, isLoading } = useCustomerDirectory();
  const { isAdmin, isManager } = useAuth();
  const checkPermission = usePermissionChecker();
  
  const canCreateCustomer = isAdmin || isManager || checkPermission('customer_create');

  const filteredCustomers = customers?.filter((customer) => {
    const matchesSearch =
      customer.name.toLowerCase().includes(search.toLowerCase()) ||
      customer.mobile.includes(search) ||
      customer.area.toLowerCase().includes(search.toLowerCase());

    const matchesStatus = (() => {
      if (statusFilter === 'all') return true;
      if (statusFilter === 'active') {
        return customer.is_deleted === false;
      }
      if (statusFilter === 'overdue') {
        return isCustomerOverdue(customer);
      }
      if (statusFilter === 'inactive') {
        return customer.is_deleted === true;
      }
      if (statusFilter === 'closed') {
        if (customer.is_deleted === true) return false;
        
        // Filter out deleted loans first
        const validLoans = customer.loans?.filter(l => l.is_deleted === false) || [];
        
        // Return true if they have at least one valid loan and ALL of them are closed
        return validLoans.length > 0 && validLoans.every(l => l.status === 'closed');
      }
      return true;
    })();

    return matchesSearch && matchesStatus;
  });

  const summaryCounts = {
    active: 0,
    inactive: 0,
    closed: 0,
    overdue: 0,
  };

  customers?.forEach(customer => {
    if (customer.is_deleted === true) {
      summaryCounts.inactive++;
    } else {
      summaryCounts.active++;
      const validLoans = customer.loans?.filter(l => l.is_deleted === false) || [];
      if (validLoans.length > 0 && validLoans.every(l => l.status === 'closed')) {
        summaryCounts.closed++;
      }
      if (isCustomerOverdue(customer)) {
        summaryCounts.overdue++;
      }
    }
  });

  return (
    <MainLayout title="Customers">
      <div className="px-4 py-4 space-y-4">
        {/* Summary Cards */}
        <div className="grid grid-cols-2 gap-3">
          
          <div 
            onClick={() => setStatusFilter('all')}
            className={`rounded-2xl bg-gradient-to-r from-purple-500 to-violet-600 p-4 text-white shadow-md cursor-pointer transition-all active:scale-95 hover:shadow-lg ${statusFilter === 'all' ? 'ring-2 ring-offset-2 ring-offset-background ring-purple-500' : ''}`}
          >
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs opacity-90">Total Customers</p>
                <h3 className="text-2xl font-bold mt-1">
                  {summaryCounts.active +
                   summaryCounts.closed +
                   summaryCounts.inactive}
                </h3>
              </div>
              <div className="w-10 h-10 rounded-xl bg-white/20 flex items-center justify-center">
                <Users className="w-5 h-5" />
              </div>
            </div>
          </div>

          {/* Active */}
          <div 
            onClick={() => setStatusFilter('active')}
            className={`rounded-2xl bg-gradient-to-r from-blue-500 to-blue-600 p-4 text-white shadow-md cursor-pointer transition-all active:scale-95 hover:shadow-lg ${statusFilter === 'active' ? 'ring-2 ring-offset-2 ring-offset-background ring-blue-500' : ''}`}
          >
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs opacity-90">Active Loan Holders</p>
                <h3 className="text-2xl font-bold mt-1">
                  {summaryCounts.active - summaryCounts.closed}
                </h3>
              </div>
              <div className="w-10 h-10 rounded-xl bg-white/20 flex items-center justify-center">
                <Users className="w-5 h-5" />
              </div>
            </div>
          </div>

          {/* Closed */}
          <div 
            onClick={() => setStatusFilter('closed')}
            className={`rounded-2xl bg-gradient-to-r from-green-500 to-green-600 p-4 text-white shadow-md cursor-pointer transition-all active:scale-95 hover:shadow-lg ${statusFilter === 'closed' ? 'ring-2 ring-offset-2 ring-offset-background ring-green-500' : ''}`}
          >
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs opacity-90">Closed Loan Holders</p>
                <h3 className="text-2xl font-bold mt-1">
                  {summaryCounts.closed}
                </h3>
              </div>
              <div className="w-10 h-10 rounded-xl bg-white/20 flex items-center justify-center">
                <CheckCircle className="w-5 h-5" />
              </div>
            </div>
          </div>

          {/* Overdue */}
          <div 
            onClick={() => setStatusFilter('overdue')}
            className={`rounded-2xl bg-gradient-to-r from-amber-500 to-rose-600 p-4 text-white shadow-md cursor-pointer transition-all active:scale-95 hover:shadow-lg ${statusFilter === 'overdue' ? 'ring-2 ring-offset-2 ring-offset-background ring-rose-500' : ''}`}
          >
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs opacity-90">Overdue Loan Holders</p>
                <h3 className="text-2xl font-bold mt-1">
                  {summaryCounts.overdue}
                </h3>
              </div>
              <div className="w-10 h-10 rounded-xl bg-white/20 flex items-center justify-center">
                <AlertCircle className="w-5 h-5" />
              </div>
            </div>
          </div>

        </div>

        {/* Search and Filter */}
        <div className="flex gap-3">
          <div className="relative flex-1">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
            <Input
              placeholder="Search customers..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="search-input pl-12"
            />
          </div>
          <Select value={statusFilter} onValueChange={setStatusFilter}>
            <SelectTrigger className="w-32 h-12 rounded-xl">
              <Filter className="w-4 h-4 mr-2" />
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All</SelectItem>
              <SelectItem value="active">Active</SelectItem>
              <SelectItem value="overdue">Overdue</SelectItem>
              <SelectItem value="closed">Closed</SelectItem>
              <SelectItem value="inactive">InActive</SelectItem>
            </SelectContent>
          </Select>
        </div>

        {/* Customer List */}
        <div className="space-y-3">
          {isLoading ? (
            Array.from({ length: 5 }).map((_, i) => (
              <Skeleton key={i} className="h-32 rounded-xl" />
            ))
          ) : filteredCustomers?.length === 0 ? (
            <div className="text-center py-12">
              <div className="text-primary mb-4">
                <EmptyCustomersIllustration />
              </div>
              <p className="text-lg font-medium text-foreground mb-1">No customers found</p>
              <p className="text-sm text-muted-foreground mb-4">
                {search ? 'Try a different search term' : canCreateCustomer ? 'Start by adding your first customer' : 'No customers assigned to you yet'}
              </p>
              {canCreateCustomer && (
                <Link
                  to="/customers/new"
                  className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-primary text-primary-foreground font-medium text-sm hover:bg-primary/90 transition-colors"
                >
                  <Plus className="w-4 h-4" />
                  Add Customer
                </Link>
              )}
            </div>
          ) : (
            filteredCustomers?.map((customer) => (
              <CustomerCard key={customer.id} customer={customer} currentFilter={statusFilter} />
            ))
          )}
        </div>
      </div>

      {/* Floating Action Button - Only visible to users with create permission */}
      {canCreateCustomer && (
        <Link to="/customers/new" className="fab text-white">
          <Plus className="w-6 h-6" />
        </Link>
      )}
    </MainLayout>
  );
}
