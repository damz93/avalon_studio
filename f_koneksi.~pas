unit f_koneksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, acAlphaImageList, DB, ADODB, sSkinManager;

type
  Tfrm_koneksi = class(TForm)
    skin: TsSkinManager;
    sAlphaImageList1: TsAlphaImageList;
    sAlphaImageList2: TsAlphaImageList;
    qr_pengeluaran: TADOQuery;
    qr_user: TADOQuery;
    qr_transaksi: TADOQuery;
    koneksiDB: TADOConnection;
    qr_log: TADOQuery;
    qr_promo: TADOQuery;
    qr_kategori: TADOQuery;
    qr_costmake: TADOQuery;
    qr_tip: TADOQuery;
    qr_tip_temp: TADOQuery;
    qr_key: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure koneksi;
    procedure putus;
  end;

var
  frm_koneksi: Tfrm_koneksi;

implementation

{$R *.dfm}

{ Tfrm_koneksi }

procedure Tfrm_koneksi.koneksi;
begin
  koneksiDB.Connected:=true;
end;

procedure Tfrm_koneksi.putus;
begin
  koneksiDB.Connected:=false;
end;

end.
