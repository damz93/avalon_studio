unit f_lap_brankas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, grimgctrl, jpeg, QuickRpt, ExtCtrls;

type
  Tfrm_lap_brankas = class(TForm)
    qrep_brankas: TQuickRep;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRImage2: TQRImage;
    QRHRule2: TQRHRule;
    lbl_rep_menampilkan: TQRLabel;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    exp_keluar: TQRExpr;
    exp_crew_edc: TQRExpr;
    QRLabel2: TQRLabel;
    exp_sisa: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    procedure qrep_brankasAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lap_brankas: Tfrm_lap_brankas;

implementation

uses f_lap_brankas_periode;

{$R *.dfm}

procedure Tfrm_lap_brankas.qrep_brankasAfterPreview(Sender: TObject);
begin
 frm_lap_brankas_berdasarkan.kosong;
  frm_lap_brankas_berdasarkan.sembunyi;
end;

end.
