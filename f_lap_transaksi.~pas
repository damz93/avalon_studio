unit f_lap_transaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, acPNG, QRCtrls, QRMBCtrls, jpeg;

type
  Tfrm_lap_transaksi = class(TForm)
    qrep_transaksinow: TQuickRep;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRImage1: TQRImage;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRDBText14: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText16: TQRDBText;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    db_harga_paket: TQRDBText;
    procedure qrep_transaksinowAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lap_transaksi: Tfrm_lap_transaksi;

implementation

uses f_koneksi, f_lihat_transaksi, f_menu_utama;

{$R *.dfm}

procedure Tfrm_lap_transaksi.qrep_transaksinowAfterPreview(
  Sender: TObject);
begin
//  frm_lihat_transaksi.baref;
  frm_lihat_transaksi.FormShow(frm_lihat_transaksi);
end;

end.
