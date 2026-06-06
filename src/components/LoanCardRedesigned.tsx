import { useState } from 'react';
import { Copy, Wallet, Download, Receipt, CalendarDays, CalendarCheck, Clock, Hourglass, FileText, Lock, Edit, Percent } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { cn } from '@/lib/utils';
import { useToast } from '@/hooks/use-toast';

interface LoanCardProps {
  loan: any;
  customer: any;
  isAdmin: boolean;
  isManager: boolean;
  closingLoan: boolean;
  selectedLoanId: string | null;
  loanPayments: any[] | undefined;
  onSelectLoan: (id: string | null) => void;
  onCloseLoan: (loan: any) => void;
  canEditPayment: (p: any) => boolean;
  openEditPayment: (p: any) => void;
  renderWhatsApp: (loan: any) => React.ReactNode;
  renderCloseLoanDialog: (loan: any, outstandingAmt: number) => React.ReactNode;
}

export function LoanCardRedesigned({
  loan, customer, isAdmin, isManager, closingLoan,
  selectedLoanId, loanPayments, onSelectLoan, onCloseLoan,
  canEditPayment, openEditPayment, renderWhatsApp, renderCloseLoanDialog
}: LoanCardProps) {
  const { toast } = useToast();
  const isActive = loan.status === 'active';
  const loanAmt = Number(loan.loan_amount);
  const outstandingAmt = Number(loan.outstanding_amount);
  const paidAmt = loanAmt - outstandingAmt;
  const daily = +loan.daily_amount || 1;
  const paidDays = Math.floor(paidAmt / daily);
  const pendingDays = Math.ceil(outstandingAmt / daily);
  const totalDays = Math.ceil((new Date(loan.end_date || Date.now()).getTime() - new Date(loan.start_date).getTime()) / 86400000) + 1;

  const today = Date.now();
  const start = new Date(loan.start_date).getTime();
  const end = new Date(loan.end_date || today).getTime();
  const totalDaysCalc = Math.ceil((end - start) / 86400000) + 1;
  const actualDays = Math.min(totalDaysCalc, Math.max(0, Math.ceil((today - start) / 86400000)));
  const actualDuesAmt = (loanAmt / totalDaysCalc) * actualDays;

  const interestRate = Number(loan.interest_rate) || 0;
  const processingRate = Number(loan.processing_fee_rate) || 0;
  const otherDed = Number(loan.other_deductions) || 0;
  const interestAmt = Math.round(loanAmt * interestRate / 100);
  const processingAmt = Math.round(loanAmt * processingRate / 100);
  const totalCharges = interestAmt + processingAmt + otherDed;
  const disbursalAmt = Number(loan.disbursal_amount);

  const paidPercent = loanAmt > 0 ? Math.round((paidAmt / loanAmt) * 100) : 0;

  // Tenure progress
  const tenureElapsed = Math.min(100, Math.max(0, ((today - start) / (end - start)) * 100));

  const copyId = () => {
    navigator.clipboard.writeText(loan.loan_display_id || `Loan #${loan.loan_number}`);
    toast({ title: 'Copied!', description: 'Loan ID copied to clipboard' });
  };

  const fmt = (n: number) => n.toLocaleString('en-IN');
  const fmtDate = (d: string) => new Date(d).toLocaleDateString('en-IN', { day: '2-digit', month: 'short', year: 'numeric' });

  // SVG donut chart
  const radius = 40;
  const circ = 2 * Math.PI * radius;
  const paidArc = (paidPercent / 100) * circ;
  const pendingArc = circ - paidArc;

  return (
    <div className="rounded-2xl border border-border bg-card overflow-hidden" style={{ boxShadow: '0 2px 16px rgba(37,99,235,0.07)' }}>
      {/* Loan ID Header */}
      <div className="px-4 pt-4 pb-2">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-[11px] text-muted-foreground mb-0.5">Loan / Agreement ID</p>
            <div className="flex items-center gap-2">
              <p className="font-extrabold text-primary text-base tracking-wide">{loan.loan_display_id || `Loan #${loan.loan_number}`}</p>
              <button onClick={copyId} className="text-muted-foreground hover:text-primary transition-colors"><Copy className="w-3.5 h-3.5" /></button>
            </div>
          </div>
          <Badge variant="outline" className={cn('text-xs font-semibold px-3 py-1 rounded-full uppercase', isActive ? 'border-green-500 text-green-600 ' : 'border-gray-400 text-gray-500 bg-gray-50')}>
            <span className={cn('inline-block w-1.5 h-1.5 rounded-full mr-1.5', isActive ? 'bg-green-500' : 'bg-gray-400')} />
            {loan.status}
          </Badge>
        </div>
      </div>

      {/* Outstanding + Donut Chart Row */}
      <div className="px-4 pb-3">
        <div className="grid grid-cols-2 gap-3">
          {/* Outstanding Card */}
          <div className="rounded-xl p-3.5 text-white relative overflow-hidden bg-gradient-to-br from-primary to-primary/70">
            <p className="text-[11px] opacity-80 font-medium">Outstanding (Pending Dues)</p>
            <p className="text-2xl font-extrabold mt-1">₹{fmt(outstandingAmt)}</p>
            <div className="flex items-center gap-1.5 mt-3 bg-white/15 rounded-lg px-3 py-3">
              <Wallet className="w-3.5 h-3.5" />
              <div className="w-100">
                <p className="text-[9px] opacity-70 leading-none">Total Loan</p>
                <p className="font-bold leading-tight">₹{fmt(loanAmt)}</p>
              </div>
            </div>
          </div>

          {/* Donut Chart */}
          <div className="rounded-xl border border-border p-3 flex flex-col items-center justify-center bg-card">
            <p className="text-[11px] text-muted-foreground mb-1">Repayment Progress <span className="text-[10px]">(Days)</span></p>
            <div className="relative">
              <svg width="80" height="80" viewBox="0 0 100 100">
                <circle cx="50" cy="50" r={radius} fill="none" stroke="#e5e7eb" strokeWidth="8" />
                <circle cx="50" cy="50" r={radius} fill="none" stroke="#22c55e" strokeWidth="8"
                  strokeDasharray={`${paidArc} ${pendingArc}`} strokeDashoffset={circ * 0.25}
                  strokeLinecap="round" style={{ transition: 'stroke-dasharray 0.6s ease' }} />
                <circle cx="50" cy="50" r={radius} fill="none" stroke="#f59e0b" strokeWidth="8"
                  strokeDasharray={`${pendingArc} ${paidArc}`} strokeDashoffset={circ * 0.25 - paidArc}
                  strokeLinecap="round" style={{ transition: 'stroke-dasharray 0.6s ease' }} />
                <text x="50" y="46" textAnchor="middle" className="text-lg font-extrabold" fill="currentColor" fontSize="16" fontWeight="800">{paidPercent}%</text>
                <text x="50" y="60" textAnchor="middle" fill="#9ca3af" fontSize="9">Paid</text>
              </svg>
            </div>
            <div className="flex gap-3 mt-1.5 text-[10px]">
              <div className="flex items-center gap-1">
                <span className="w-1.5 h-1.5 rounded-full bg-green-500" />
                <span className="text-muted-foreground">Paid {paidDays}d</span>
              </div>
              <div className="flex items-center gap-1">
                <span className="w-1.5 h-1.5 rounded-full bg-amber-500" />
                <span className="text-muted-foreground">Pending {pendingDays}d</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Stats Grid - Row 1 */}
      <div className="px-4 pb-2">
        <div className="grid grid-cols-4 gap-2">
          {[
            { icon: <Wallet className="w-6 h-6" />, label: 'Gross Loan', value: `₹${fmt(loanAmt)}`, color: 'text-blue-600' },
            { icon: <Download className="w-6 h-6" />, label: 'Net Disbursal', value: `₹${fmt(disbursalAmt)}`, color: 'text-blue-600' },
            { icon: <Receipt className="w-6 h-6" />, label: 'Total Charges', value: `₹${fmt(totalCharges)}`, color: 'text-red-500' },
            { icon: <CalendarDays className="w-6 h-6" />, label: 'Due Amount', value: `₹${fmt(Number(loan.daily_amount))}`, color: 'text-green-600' },
          ].map((s, i) => (
            <div key={i} className="rounded-xl border border-border p-2.5 text-center bg-card hover:shadow-sm transition-shadow">
              <div className={cn('w-8 h-8 rounded-lg flex items-center justify-center mx-auto mb-1.5', s.color)}>{s.icon}</div>
              <p className="text-[10px] text-muted-foreground leading-tight">{s.label}</p>
              <p className="text-xs font-bold mt-1">{s.value}</p>
            </div>
          ))}
        </div>
      </div>

      {/* Stats Grid - Row 2 */}
      <div className="px-4 pb-3">
        <div className="grid grid-cols-3 gap-2">
          {[
            { icon: <CalendarCheck className="w-6 h-6" />, label: 'Due Till Today', value: `${actualDays} days`, sub: `(₹${fmt(Math.round(actualDuesAmt))})`, color: 'text-blue-500' },
            { icon: <CalendarDays className="w-6 h-6" />, label: 'Paid Dues', value: `${paidDays} days`, sub: `(₹${fmt(paidAmt)})`, color: 'text-green-600' },
            { icon: <Clock className="w-6 h-6" />, label: 'Pending Dues', value: `${pendingDays} days`, sub: `(₹${fmt(outstandingAmt)})`, color: 'text-amber-500' },
            // { icon: <Hourglass className="w-4 h-4" />, label: `Tenure (${totalDays} days)`, value: fmtDate(loan.start_date), sub: `to\n${loan.end_date ? fmtDate(loan.end_date) : 'Ongoing'}`, color: 'text-blue-600 bg-blue-50' },
          ].map((s, i) => (
            <div key={i} className="rounded-xl border border-border p-2.5 text-center bg-card hover:shadow-sm transition-shadow">
              <div className={cn('w-8 h-8 rounded-lg flex items-center justify-center mx-auto mb-1.5', s.color)}>{s.icon}</div>
              <p className="text-[10px] text-muted-foreground leading-tight">{s.label}</p>
              <p className="text-xs font-bold mt-0.5">{s.value}</p>
              {s.sub && <p className="text-[10px] text-muted-foreground whitespace-pre-line">{s.sub}</p>}
            </div>
          ))}
        </div>
      </div>

      {/* Tenure Progress Bar */}
      <div className="px-4 pb-3">
        <div className="border-t border-border pt-3">
          <div className="flex items-center justify-between text-[10px] text-muted-foreground mb-1">
            <span>Start Date<br/><span className="font-semibold text-foreground text-xs">{fmtDate(loan.start_date)}</span></span>
            <span className="text-center">Tenure Progress<br/><span className="font-bold text-primary text-xs">{totalDays} Days</span></span>
            <span className="text-right">End Date<br/><span className="font-semibold text-foreground text-xs">{loan.end_date ? fmtDate(loan.end_date) : 'Ongoing'}</span></span>
          </div>
          <div className="relative h-2 bg-blue-100 rounded-full overflow-hidden">
            <div className="absolute left-0 top-0 h-full bg-gradient-to-r from-blue-500 to-blue-600 rounded-full transition-all duration-500" style={{ width: `${tenureElapsed}%` }} />
          </div>
          <div className="flex justify-between mt-0.5">
            <span className="w-3 h-3 rounded-full border-2 border-blue-500 bg-white -mt-2.5 relative z-10" />
            <span className="w-3 h-3 rounded-full border-2 border-blue-500 bg-white -mt-2.5 relative z-10" />
          </div>
        </div>
      </div>

      {/* Charges Breakdown */}
      {totalCharges > 0 && (
        <div className="px-4 pb-3">
          <div className="rounded-xl border border-border p-3.5 bg-card">
            <div className="flex items-start gap-3">
              {/* <div className="w-10 h-10 rounded-xl bg-blue-50 flex items-center justify-center flex-shrink-0">
                <Percent className="w-5 h-5 text-blue-600" />
              </div> */}
              <div className="flex-1">
                <p className="font-semibold text-sm">{loan.include_charges_in_outstanding ? 'Charges Included in Outstanding' : 'Charges Deducted From Disbursal'}</p>
                <div className="mt-2 space-y-1">
                  {interestAmt > 0 && (
                    <div className="flex justify-between text-xs">
                      <span className="text-muted-foreground">Interest ({interestRate}%)</span>
                      <span className="font-semibold">₹{fmt(interestAmt)}</span>
                    </div>
                  )}
                  {processingAmt > 0 && (
                    <div className="flex justify-between text-xs">
                      <span className="text-muted-foreground">Processing ({processingRate}%)</span>
                      <span className="font-semibold">₹{fmt(processingAmt)}</span>
                    </div>
                  )}
                  {otherDed > 0 && (
                    <div className="flex justify-between text-xs">
                      <span className="text-muted-foreground">Other {loan.other_deduction_remarks ? `(${loan.other_deduction_remarks})` : ''}</span>
                      <span className="font-semibold">₹{fmt(otherDed)}</span>
                    </div>
                  )}
                  <div className="flex justify-between text-xs pt-1 border-t border-border mt-1">
                    <span className="font-bold">Total Charges</span>
                    <span className="font-bold text-red-500">₹{fmt(totalCharges)}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Action Buttons */}
      <div className="px-4 pb-4">
        <div className="flex flex-col gap-2">
          <Button
            className="w-full rounded-xl h-11 font-semibold text-sm"
            style={{ background: 'linear-gradient(135deg, #0ea5e9 0%, #2563eb 100%)' }}
            onClick={() => onSelectLoan(selectedLoanId === loan.id ? null : loan.id)}
          >
            <FileText className="w-4 h-4 mr-1.5" /> {selectedLoanId === loan.id ? 'Hide Ledger' : 'View Ledger'}
          </Button>
          {renderWhatsApp(loan)}
        </div>
        {renderCloseLoanDialog(loan, outstandingAmt)}
      </div>

      {/* Inline Ledger */}
      {selectedLoanId === loan.id && (
        <div className="border-t border-border px-4 py-3">
          <h4 className="text-sm font-semibold mb-2">Payment Ledger</h4>
          {!loanPayments?.length ? (
            <p className="text-xs text-muted-foreground text-center py-4">No payments for this loan</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-xs">
                <thead>
                  <tr className="border-b border-border">
                    <th className="text-left py-2 px-1 font-medium text-muted-foreground">Date</th>
                    <th className="text-right py-2 px-1 font-medium text-muted-foreground">Amt</th>
                    <th className="text-center py-2 px-1 font-medium text-muted-foreground">Mode</th>
                    <th className="text-center py-2 px-1 font-medium text-muted-foreground">Status</th>
                    <th className="text-center py-2 px-1 font-medium text-muted-foreground">Edit</th>
                  </tr>
                </thead>
                <tbody>
                  {loanPayments.map((p: any) => (
                    <tr key={p.id} className="border-b border-border last:border-0">
                      <td className="py-2 px-1">{new Date(p.date).toLocaleDateString('en-IN')}</td>
                      <td className="py-2 px-1 text-right font-medium">₹{Number(p.amount).toLocaleString('en-IN')}</td>
                      <td className="py-2 px-1 text-center capitalize">{p.mode}</td>
                      <td className="py-2 px-1 text-center">
                        <span className={cn('status-badge text-[10px]', p.status === 'paid' && 'status-paid', p.status === 'not_paid' && 'status-not-paid')}>
                          {p.status === 'paid' ? 'Paid' : 'Not Paid'}
                        </span>
                      </td>
                      <td className="py-2 px-1 text-center">
                        {canEditPayment(p) ? (
                          <Button variant="ghost" size="icon" className="h-6 w-6" onClick={() => openEditPayment(p)}>
                            <Edit className="w-3 h-3" />
                          </Button>
                        ) : <span className="text-muted-foreground">—</span>}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
