unit f_lihat_kategori;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, StdCtrls, sEdit, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lihat_kategori = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    DBGrid1: TDBGrid;
    cmb_cari: TsComboBox;
    edit_cari: TsEdit;
    pnl_bawah: TsPanel;
    btn_tambah: TsSpeedButton;
    btn_edit: TsSpeedButton;
    btn_hapus: TsSpeedButton;
    btn_tutup: TsSpeedButton;
    btn_batal: TsSpeedButton;
    DataSource1: TDataSource;
    procedure cmb_cariClick(Sender: TObject);
    procedure edit_cariChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btn_tambahClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_hapusClick(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure btn_tutupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kosong;
    procedure tampil;
    procedure baref;
    procedure mrefr_log;
    procedure simp_log;
    procedure koneksi;
  end;

var
  frm_lihat_kategori: Tfrm_lihat_kategori;
  var kodekat,namakat,olehkat,waktukat:string;
implementation

uses f_koneksi, f_input_kategori, f_menu_utama, f_login;

{$R *.dfm}

{ Tfrm_lihat_kategori }

procedure Tfrm_lihat_kategori.baref;
begin
  frm_input_kategori.mrefresh;
  kosong;
end;

procedure Tfrm_lihat_kategori.koneksi;
begin
with frm_koneksi do
  begin
    koneksi;
      with qr_kategori do
      begin
        Connection:=frm_koneksi.koneksiDB;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_kategori_paket';
        Active:=true;
      end;
  end;
end;

procedure Tfrm_lihat_kategori.kosong;
begin
  btn_edit.Enabled:=false;
  btn_hapus.Enabled:=false;
  btn_batal.Enabled:=false;
  btn_tambah.Enabled:=true;
  //f_input_jurusan.mrefresh;
  cmb_cari.Text:='-- Tampilkan Berdasarkan --';
  cmb_cari.ItemIndex:=-1;
  edit_cari.Clear;
  edit_cari.Enabled:=false;
end;

procedure Tfrm_lihat_kategori.mrefr_log;
begin
with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_lihat_kategori.simp_log;
begin
frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Hapus Kategori *'+kodekat+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_lihat_kategori.tampil;
begin
with frm_koneksi.qr_kategori do
  Begin
    kodekat := FieldValues['KODE_KATEGORI'];
    namakat := FieldValues['NAMA_KATEGORI'];
    olehkat := FieldValues['OLEH'];
    waktukat := FieldValues['WAKTU'];
    with frm_input_kategori do
    begin
      lbl_kodee.Caption:=kodekat;
      edt_kategori.Text:=namakat;
    end;
  end;
end;

procedure Tfrm_lihat_kategori.cmb_cariClick(Sender: TObject);
begin
  edit_cari.Enabled:=true;
  edit_cari.SetFocus;
  btn_batal.Enabled:=true;
end;

procedure Tfrm_lihat_kategori.edit_cariChange(Sender: TObject);
begin
with frm_koneksi.qr_kategori do
  begin
    if cmb_cari.Text = 'Kode' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_kategori_paket where KODE_KATEGORI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Nama' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_kategori_paket where NAMA_KATEGORI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Oleh' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_kategori_paket where OLEH like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Waktu' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_kategori_paket where WAKTU like "%' +edit_cari.Text + '%"');
      Open;
    end
  end
end;

procedure Tfrm_lihat_kategori.DBGrid1CellClick(Column: TColumn);
begin
  If frm_koneksi.qr_kategori.RecordCount <> 0 then
  begin
    btn_edit.Enabled := true;
    btn_hapus.Enabled := true;
    btn_batal.Enabled := true;
    tampil;
  end
  else
  begin
    Application.MessageBox('Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
  end;
end;

procedure Tfrm_lihat_kategori.btn_tambahClick(Sender: TObject);
begin
 close;
  kebenaran:=true;
  with frm_input_kategori do
    begin
      urutkanc;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      kosong;
      btn_simpbar.ImageIndex:= 6;
      showmodal;
    end;
end;

procedure Tfrm_lihat_kategori.btn_editClick(Sender: TObject);
begin
  kosong;
  close;
  kebenaran:=false;
  with frm_input_kategori do
    begin
    mrefresh;
    btn_simpbar.Caption := '&Update';
    btn_simpbar.ImageIndex:= 7;
    showmodal;
  end
end;

procedure Tfrm_lihat_kategori.btn_hapusClick(Sender: TObject);
begin
  if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data, dengan Kode Transaksi= "'+(kodekat)+'" ??'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
//   if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data?'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
    with frm_koneksi.qr_kategori do
    begin
      SQL.Clear;
      simp_log;
      SQL.Text:='DELETE FROM tbl_kategori_paket WHERE KODE_KATEGORI='+QuotedStr(kodekat);
      ExecSQL;
      frm_input_kategori.mrefresh;
      MessageBox(Application.Handle, ('Berhasil menghapus data'),('Informasi'),MB_ICONINFORMATION);
      kosong;
    end
  else
    begin
      btn_edit.Enabled:=false;
      btn_hapus.Enabled:=false;
      btn_batal.Enabled:=false;
    end;
  frm_input_kategori.mrefresh;

end;

procedure Tfrm_lihat_kategori.btn_batalClick(Sender: TObject);
begin
  baref;
end;

procedure Tfrm_lihat_kategori.btn_tutupClick(Sender: TObject);
begin
  kosong;
  close;
end;

procedure Tfrm_lihat_kategori.FormShow(Sender: TObject);
begin
  baref;
end;

end.
