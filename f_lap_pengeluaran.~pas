unit f_lap_pengeluaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, grimgctrl, acPNG, QRCtrls, QuickRpt, ExtCtrls, jpeg;

type
  Tfrm_lap_pengeluaran = class(TForm)
    qrep_pengeluaran: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel12: TQRLabel;
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRHRule1: TQRHRule;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRExpr5: TQRExpr;
    lbl_rep_menampilkan: TQRLabel;
    EXP_SUM: TQRExpr;
    QRLabel9: TQRLabel;
    procedure qrep_pengeluaranAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lap_pengeluaran: Tfrm_lap_pengeluaran;

implementation

uses f_koneksi, f_lap_pengeluaran_berdasarkan;

{$R *.dfm}

procedure Tfrm_lap_pengeluaran.qrep_pengeluaranAfterPreview(
  Sender: TObject);
begin
  frm_lap_pengeluaran_berdasarkan.kosong;
  frm_lap_pengeluaran_berdasarkan.sembunyi;
end;

end.
