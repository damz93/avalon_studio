unit f_lap_pemasukan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, grimgctrl, acPNG, QRCtrls, jpeg;

type
  Tfrm_lap_pemasukan = class(TForm)
    qrep_pemasukan: TQuickRep;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    QRBand3: TQRBand;
    QRExpr5: TQRExpr;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRImage2: TQRImage;
    QRHRule2: TQRHRule;
    lbl_rep_menampilkan: TQRLabel;
    QRBand5: TQRBand;
    QRExpr8: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    exp_totbayar: TQRExpr;
    QRBand6: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    exp_crew: TQRExpr;
    QRShape3: TQRShape;
    exp_bersih: TQRExpr;
    QRLabel17: TQRLabel;
    procedure qrep_pemasukanAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lap_pemasukan: Tfrm_lap_pemasukan;

implementation

uses f_koneksi, f_lap_pemasukan_berdasarkan, f_lap_pemasukan_periode;

{$R *.dfm}

procedure Tfrm_lap_pemasukan.qrep_pemasukanAfterPreview(Sender: TObject);
begin
  frm_lap_pemasukan_periode.kosong;
  frm_lap_pemasukan_periode.sembunyi;
end;

end.
