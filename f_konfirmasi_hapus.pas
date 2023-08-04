unit f_konfirmasi_hapus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sSpeedButton, StdCtrls, sComboBox, sEdit, sLabel,
  sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_konfirm = class(TForm)
    sPanel1: TsPanel;
    gbox: TsGroupBox;
    sLabel1: TsLabel;
    edt_key: TsEdit;
    sPanel2: TsPanel;
    sGroupBox2: TsGroupBox;
    btn_simpbar: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    sLabel2: TsLabel;
    edt_detail: TsEdit;
    procedure btn_simpbarClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure tutup;
    procedure upd_key;
  end;

var
  frm_konfirm: Tfrm_konfirm;
  kodenya: string;
implementation

uses f_koneksi, f_input_transaksi, f_lihat_transaksi, f_input_key, DB,
  f_menu_utama;


{$R *.dfm}

procedure Tfrm_konfirm.btn_simpbarClick(Sender: TObject);
begin
  with frm_koneksi.qr_key do
    begin
        sql.Clear;
        sql.Add('SELECT * FROM tbl_key WHERE STATUS="Y"');
        Open;

        if (edt_key.Text='') or (edt_key.Text=' ') then
            begin
                Application.MessageBox('Isi Kode Key terlebih dahulu','Peringatan',MB_ICONWARNING);
                edt_key.SetFocus;
            end
        else if Locate('KODE',edt_key.Text,[])then
            begin

                with frm_koneksi.qr_transaksi do
                    begin
                        SQL.Clear;
                        SQL.Text:='DELETE FROM tbl_transaksi WHERE KODE_TRANSAKSI='+QuotedStr(kode_transaksi);
                        kodenya:=kode_transaksi;

                        ExecSQL;
                        frm_input_transaksi.mrefresh;
                        MessageBox(Application.Handle, ('Berhasil menghapus data'),('Informasi'),MB_ICONINFORMATION);
                    end;
                  upd_key;
                  tutup;

            end
        else
          begin
            frm_input_transaksi.mrefresh;
            Application.MessageBox('Kode Key tidak valid, hapus dibatalkan','Peringatan',MB_ICONWARNING);
            tutup;
          end;
    end;
end;

procedure Tfrm_konfirm.sSpeedButton1Click(Sender: TObject);
begin
   tutup;
end;

procedure Tfrm_konfirm.tutup;
begin
  frm_lihat_transaksi.kosong;
  edt_key.Text:='';
  frm_konfirm.close;
end;

procedure Tfrm_konfirm.upd_key;
var tgl_upd,isi_ket:string;
begin
tgl_upd:=DateToStr(Date);
isi_ket:='sudah digunakan oleh: *'+frm_utama.lbl_nama.Caption+'* | untuk menghapus kode transaksi: *'+kodenya+'* | pada waktu: *'+frm_utama.lbl_jam.Caption+'*';
frm_koneksi.koneksi;
with frm_koneksi.qr_key do
  begin
      close;
      SQL.Clear;
      SQL.Text := ' UPDATE tbl_key SET ' +
                  '[KETERANGAN]='+QuotedStr(isi_ket)+','+
                  '[TGL_UPDATE]='+QuotedStr(tgl_upd)+','+
                  '[STATUS]= '+QuotedStr('T')+
                  ' WHERE KODE = ' +QuotedStr(edt_key.Text);
      ExecSQL;
      frm_input_key.mrefresh;
  end;
end;

end.
