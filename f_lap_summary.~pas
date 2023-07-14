unit f_lap_summary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, grimgctrl, jpeg, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_lap_summary = class(TForm)
    qrep_summary: TQuickRep;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRImage2: TQRImage;
    QRHRule2: TQRHRule;
    lbl_rep_menampilkan: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    exp_cash: TQRExpr;
    exp_keluar: TQRExpr;
    exp_bersihbanget: TQRExpr;
    exp_crew_edc: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    exp_edc_bersih: TQRExpr;
    QRLabel5: TQRLabel;
    exp_saldo_brankas: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    exp_uang_cash: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    exp_edc_kotor: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    procedure qrep_summaryAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lap_summary: Tfrm_lap_summary;

implementation

uses f_lap_summary_berdasarkan;

{$R *.dfm}

procedure Tfrm_lap_summary.qrep_summaryAfterPreview(Sender: TObject);
begin
  frm_lap_summary_berdasarkan.kosong;
  frm_lap_summary_berdasarkan.sembunyi;
end;

end.
