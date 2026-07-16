import { useState } from 'react';
import { MainLayout } from '@/components/MainLayout';
import { CustomerCard } from '@/components/CustomerCard';
import { useCustomerDirectory } from '@/hooks/useData';
import { useAuth } from '@/contexts/AuthContext';
import { usePermissionChecker } from '@/hooks/usePermissions';
import { Search, Plus, Filter, Users, CheckCircle, UserMinus } from 'lucide-react';
import { Input } from '@/components/ui/input';
import { Link } from 'react-router-dom';
import { Skeleton } from '@/components/ui/skeleton';
import { EmptyCustomersIllustration } from '@/components/illustrations';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';

export default function CustomersPage() {
  const [search, setSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('active');
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
    }
  });

  return (
    <MainLayout title="Customers">
      <div className="px-4 py-4 space-y-4">
        {/* Summary Cards */}
        {/* <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
          <div className="summary-card summary-card-primary">
            <div className="flex items-start justify-between">
              <div className="flex-1">
                <p className="text-sm font-medium text-white/80">Active</p>
                <p className="text-2xl font-bold mt-1 text-white">{summaryCounts.active}</p>
              </div>
              <div className="w-12 h-12 rounded-xl flex items-center justify-center bg-white/20 text-white">
                <Users className="w-6 h-6" />
              </div>
            </div>
          </div>

          <div className="summary-card summary-card-success">
            <div className="flex items-start justify-between">
              <div className="flex-1">
                <p className="text-sm font-medium text-white/80">Closed</p>
                <p className="text-2xl font-bold mt-1 text-white">{summaryCounts.closed}</p>
              </div>
              <div className="w-12 h-12 rounded-xl flex items-center justify-center bg-white/20 text-white">
                <CheckCircle className="w-6 h-6" />
              </div>
            </div>
          </div>

          <div className="summary-card bg-muted/30 border border-muted">
            <div className="flex items-start justify-between">
              <div className="flex-1">
                <p className="text-sm font-medium text-muted-foreground">InActive</p>
                <p className="text-2xl font-bold mt-1 text-foreground">{summaryCounts.inactive}</p>
              </div>
              <div className="w-12 h-12 rounded-xl flex items-center justify-center bg-background text-muted-foreground border">
                <UserMinus className="w-6 h-6" />
              </div>
            </div>
          </div>
        </div> */}

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

  {/* Inactive */}
  <div 
    onClick={() => setStatusFilter('inactive')}
    className={`rounded-2xl bg-gradient-to-r from-slate-500 to-slate-700 p-4 text-white shadow-md cursor-pointer transition-all active:scale-95 hover:shadow-lg ${statusFilter === 'inactive' ? 'ring-2 ring-offset-2 ring-offset-background ring-slate-500' : ''}`}
  >
    <div className="flex items-center justify-between">
      <div>
        <p className="text-xs opacity-90">Inactive Customers</p>
        <h3 className="text-2xl font-bold mt-1">
          {summaryCounts.inactive}
        </h3>
      </div>
      <div className="w-10 h-10 rounded-xl bg-white/20 flex items-center justify-center">
        <UserMinus className="w-5 h-5" />
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
              <SelectItem value="inactive">InActive</SelectItem>
              <SelectItem value="closed">Closed</SelectItem>
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
              <CustomerCard key={customer.id} customer={customer} />
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
