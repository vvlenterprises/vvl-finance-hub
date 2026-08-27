import { Customer, CustomerWithBalance } from '@/hooks/useData';
import { cn } from '@/lib/utils';
import { MapPin, Phone, ChevronRight, User } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { isCustomerOverdue } from '@/pages/CustomersPage';

interface CustomerCardProps {
  customer: Customer | CustomerWithBalance;
  showBalance?: boolean;
  currentFilter?: string;
}

export function CustomerCard({ customer, showBalance = true }: CustomerCardProps) {
  const { user } = useAuth();
  const balance = 'balance' in customer ? customer.balance : null;
  const photoUrl = (customer as any).photo_url;
  const agentName = (customer as any).agent_name;
  const isSelf = customer.assigned_agent_id === user?.id;

  const isOverdue = 'loans' in customer ? isCustomerOverdue(customer) : false;
  const validLoans = (customer as any).loans?.filter((l: any) => l.is_deleted === false) || [];
  const isClosed = validLoans.length > 0 && validLoans.every((l: any) => l.status === 'closed');
  const isInactive = customer.is_deleted === true;

  // Determine badge label and subtle border based on category
  let badgeLabel = 'Active Loan';
  let badgeStyle = 'bg-blue-500/15 text-blue-400 border border-blue-500/30';
  let borderStyle = 'border-l-4 border-l-blue-500 border-blue-500/20';

  if (isInactive) {
    badgeLabel = 'Inactive';
    badgeStyle = 'bg-slate-500/15 text-slate-400 border border-slate-500/30';
    borderStyle = 'border-l-4 border-l-slate-500 border-slate-500/20';
  } else if (isClosed) {
    badgeLabel = 'Closed Loan';
    badgeStyle = 'bg-green-500/15 text-green-400 border border-green-500/30';
    borderStyle = 'border-l-4 border-l-green-500 border-green-500/20';
  } else if (isOverdue) {
    badgeLabel = 'Overdue Loan';
    badgeStyle = 'bg-rose-500/15 text-rose-400 border border-rose-500/30';
    borderStyle = 'border-l-4 border-l-rose-500 border-rose-500/20';
  }

  return (
    <Link to={`/customers/${customer.id}`} className="block">
      <div className={cn('customer-card transition-all', borderStyle)}>
        <div className="flex items-start justify-between gap-2">
          <div className="flex items-center gap-3 flex-1 min-w-0">
            {/* Customer Photo */}
            <div className="w-11 h-11 rounded-full overflow-hidden flex items-center justify-center bg-gradient-to-br from-primary to-primary/70 flex-shrink-0">
              {photoUrl ? (
                <img src={photoUrl} alt={customer.name} className="w-full h-full object-cover" />
              ) : (
                <span className="text-sm font-bold text-primary-foreground">
                  {customer.name.charAt(0).toUpperCase()}
                </span>
              )}
            </div>
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-2 flex-wrap">
                <h3 className="font-semibold text-foreground truncate">{customer.name}</h3>
                <span
                  className={cn(
                    'status-badge',
                    customer.status === 'active' && 'status-active',
                    customer.status === 'closed' && 'status-closed',
                    customer.status === 'defaulted' && 'status-defaulted'
                  )}
                >
                  {customer.status}
                </span>
              </div>
              <div className="flex items-center gap-4 mt-1 text-sm text-muted-foreground">
                <span className="flex items-center gap-1">
                  <MapPin className="w-3.5 h-3.5" />
                  {customer.area}
                </span>
                <span className="flex items-center gap-1">
                  <Phone className="w-3.5 h-3.5" />
                  {customer.mobile}
                </span>
              </div>
              {agentName && (
                <p className="text-xs text-muted-foreground mt-1 flex items-center gap-1">
                  <User className="w-3 h-3" />
                  Assigned for: {isSelf ? 'Self' : agentName}
                </p>
              )}
            </div>
          </div>

          <div className="flex flex-col items-end gap-2 flex-shrink-0">
            <span className={cn('px-2.5 py-0.5 text-[10px] font-semibold rounded-full tracking-wide', badgeStyle)}>
              {badgeLabel}
            </span>
            <ChevronRight className="w-4 h-4 text-muted-foreground" />
          </div>
        </div>

        {showBalance && (
          <div className="mt-3 pt-3 border-t border-border flex items-center justify-between">
            <div>
              <p className="text-xs text-muted-foreground">Loan Amount</p>
              <p className="font-semibold text-foreground">
                ₹{Number(customer.loan_amount).toLocaleString('en-IN')}
              </p>
            </div>
            {balance !== null && (
              <div className="text-right">
                <p className="text-xs text-muted-foreground">Balance</p>
                <p
                  className={cn(
                    'font-semibold',
                    balance > 0 ? 'text-warning' : 'text-success'
                  )}
                >
                  ₹{balance.toLocaleString('en-IN')}
                </p>
              </div>
            )}
          </div>
        )}
      </div>
    </Link>
  );
}
