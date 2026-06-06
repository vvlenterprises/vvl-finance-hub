import { Award } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { numberToWords } from '@/lib/numberToWords';

export interface NocShareData {
  customerName: string;
  mobile: string;
  loanDisplayId: string;
  loanAmount: number;
  startDate: string;
  endDate?: string;
}

function generateNocPdf(data: NocShareData) {
  const startFormatted = new Date(data.startDate).toLocaleDateString('en-IN', { day: 'numeric', month: 'long', year: 'numeric' });
  const endFormatted = data.endDate ? new Date(data.endDate).toLocaleDateString('en-IN', { day: 'numeric', month: 'long', year: 'numeric' }) : 'N/A';
  const today = new Date().toLocaleDateString('en-IN', { day: 'numeric', month: 'long', year: 'numeric' });

  const html = `<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>NOC - ${data.loanDisplayId}</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  @media print {
    body { padding: 0; background: #fff; -webkit-print-color-adjust: exact; print-color-adjust: exact; }
    .no-print { display: none !important; }
  }
  body { font-family: 'Segoe UI', Arial, sans-serif; background: #f5f7fa; padding: 20px; color: #1e293b; }
  .doc { max-width: 520px; margin: 0 auto; background: #fff; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 24px rgba(0,0,0,0.08); border: 1px solid #e2e8f0; }
  .header { background: linear-gradient(135deg, #0f766e, #059669); color: #fff; padding: 32px 24px 24px; text-align: center; }
  .header h1 { font-size: 24px; font-weight: 800; letter-spacing: 2px; }
  .header .sub { font-size: 13px; opacity: 0.9; margin-top: 4px; }
  .header .license { font-size: 10px; opacity: 0.7; margin-top: 4px; }
  .badge { display: inline-block; background: #fff; color: #047857; border-radius: 20px; padding: 6px 24px; font-size: 14px; font-weight: 800; margin-top: 18px; letter-spacing: 1.5px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
  
  .meta { display: flex; justify-content: space-between; padding: 12px 24px; background: #f8fafc; border-bottom: 1px solid #e2e8f0; font-size: 12px; color: #64748b; }
  
  .body { padding: 32px 24px; text-align: center; line-height: 1.6; }
  
  .greeting { font-size: 16px; font-weight: 700; color: #334155; margin-bottom: 24px; text-align: left; }
  
  .content { font-size: 15px; color: #475569; text-align: justify; margin-bottom: 28px; }
  .content b { color: #0f172a; }
  
  .highlight-box { background: linear-gradient(135deg, #f0fdf4, #dcfce7); border-radius: 12px; padding: 20px; margin: 16px 0; border: 1px solid #bbf7d0; display: flex; justify-content: space-around; text-align: center; align-items: center; }
  .highlight-box .item { flex: 1; }
  .highlight-box .amount { font-size: 26px; font-weight: 800; color: #15803d; }
  .highlight-box .lbl { font-size: 11px; color: #166534; margin-top: 4px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; }
  
  .footer-sig { display: flex; justify-content: space-between; align-items: flex-end; margin-top: 48px; padding-top: 24px; border-top: 1px solid #f1f5f9; text-align: left;}
  .footer-sig .left { font-size: 13px; color: #64748b; }
  .footer-sig .right { text-align: center; }
  .footer-sig .right .stamp { width: 80px; height: 80px; border: 3px solid #059669; border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #059669; font-size: 14px; font-weight: 900; transform: rotate(-15deg); margin: 0 auto 12px; opacity: 0.7;}
  .footer-sig .right .name { font-size: 14px; font-weight: 700; color: #1e293b; }
  .footer-sig .right .title { font-size: 11px; color: #64748b; }

  .footer { background: #f8fafc; padding: 16px 24px; text-align: center; border-top: 1px solid #e2e8f0; }
  .footer p { font-size: 11px; color: #94a3b8; }
  
  .print-btn { display: block; margin: 24px auto; padding: 12px 32px; background: #059669; color: #fff; border: none; border-radius: 8px; font-size: 15px; font-weight: 600; cursor: pointer; box-shadow: 0 4px 12px rgba(5,150,105,0.3); transition: background 0.2s; }
  .print-btn:hover { background: #047857; }
</style>
</head>
<body>
<div class="doc">
  <div class="header">
    <h1>VVL ENTERPRISES</h1>
    <div class="sub">Finance Management</div>
    <div class="license">License No: TN-02-0194510</div>
    <div class="badge">NO OBJECTION CERTIFICATE</div>
  </div>
  <div class="meta">
    <span>Date of Issue: <b>${today}</b></span>
    <span>Loan ID: <b>${data.loanDisplayId}</b></span>
  </div>
  <div class="body">
    <div class="greeting">To Whomsoever It May Concern,</div>
    
    <div class="content">
      This is to certify that <b>Mr/Ms. ${data.customerName}</b> had availed a financial loan of <b>₹${data.loanAmount.toLocaleString('en-IN')}</b> (Rupees ${numberToWords(data.loanAmount)} Only) from VVL Enterprises on ${startFormatted}.
      <br><br>
      We confirm that the aforementioned loan account has been <b>fully settled and closed</b> on <b>${endFormatted}</b>. 
    </div>

    <div class="highlight-box">
      <div class="item">
        <div class="amount">₹0</div>
        <div class="lbl">Outstanding Dues</div>
      </div>
      <div style="width:1px; height:40px; background:#86efac;"></div>
      <div class="item">
        <div class="amount" style="color:#0f766e;">PAID</div>
        <div class="lbl" style="color:#0f766e;">Status</div>
      </div>
    </div>

    <div class="content" style="margin-top:24px; text-align:center; font-style:italic; font-size:14px;">
      We hold no further claims or objections regarding this closed loan account.
    </div>

    <div class="footer-sig">
      <div class="left">
        <p>Place: Chennai</p>
        <p>Date: ${today}</p>
      </div>
      <div class="right">
        <div class="stamp">CLOSED</div>
        <div class="name">Authorized Signatory</div>
        <div class="title">VVL Enterprises</div>
      </div>
    </div>
  </div>
  <div class="footer">
    <p>This is a system-generated No Objection Certificate from VVL Enterprises.</p>
  </div>
</div>
<button class="print-btn no-print" onclick="window.print()">📄 Save as PDF / Print</button>
</body>
</html>`;

  const printWindow = window.open('', '_blank');
  if (printWindow) {
    printWindow.document.write(html);
    printWindow.document.close();
    setTimeout(() => printWindow.print(), 600);
  }
}

export function WhatsAppNocShareButton({ data }: { data: NocShareData }) {
  return (
    <Button
      variant="outline"
      size="sm"
      className="w-full rounded-xl h-11 font-semibold text-sm border-emerald-500 text-emerald-600 hover:bg-emerald-50"
      onClick={() => generateNocPdf(data)}
    >
      <Award className="w-4 h-4 mr-1.5" /> Share NOC
    </Button>
  );
}
