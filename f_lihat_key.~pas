unit f_lihat_key;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, StdCtrls, sEdit, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lihat_key = class(TForm)
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
    procedure edit_cariChange(Sender: TObject);
    procedure cmb_cariClick(Sender: TObject);
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
    procedure mrefr_log;
    procedure simp_log;
    procedure baref;
    procedure koneksi;
  end;

var
  frm_lihat_key: Tfrm_lihat_key;
    kode_key,status,tgl_buat,tgl_upd:string;

implementation

uses f_koneksi, f_input_key, f_menu_utama, f_login;

{$R *.dfm}

{ Tfrm_lihat_key }

procedure Tfrm_lihat_key.baref;
begin
   frm_input_key.mrefresh;
  kosong;
end;

procedure Tfrm_lihat_key.koneksi;
begin
   with frm_koneksi do
  begin
    koneksi;
      with qr_key do
      begin
        Connection:=koneksiDB;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_key';
        Active:=true;
      end;
  end;
end;

procedure Tfrm_lihat_key.kosong;
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

procedure Tfrm_lihat_key.mrefr_log;
begin
  with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_lihat_key.simp_log;
begin
   frm_koneksi.putus;
  with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Hapus Key *'+kode_key+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_lihat_key.tampil;
begin
    with frm_koneksi.qr_key do
  Begin
    kode_key := FieldValues['KODE'];
    tgl_buat := FieldValues['TGL_BUAT'];
    tgl_upd:= FieldValues['TGL_UPDATE'];
    status:= FieldValues['STATUS'];
    with frm_input_key do
    begin
      if status = 'Y' then
        chk_status.Checked:=True
      else
        chk_status.Checked:=False;
        edt_key.Text:=kode_key;
      tgl_buatz.Date:=StrToDate(tgl_buat);
    end;
  end;
end;

procedure Tfrm_lihat_key.edit_cariChange(Sender: TObject);
begin
{

Kode
Tgl Buat
Tgl Update
Status
}
with frm_koneksi.qr_key do
  begin
    if cmb_cari.Text = 'Kode' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_key where KODE like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Tgl Buat' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_key where TGL_BUAT like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Tgl Update' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_key where TGL_UPDATE like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Status' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_key where STATUS like "%' +edit_cari.Text + '%"');
      Open;
    end
    
  end
end;

procedure Tfrm_lihat_key.cmb_cariClick(Sender: TObject);
begin
edit_cari.Enabled:=true;
  edit_cari.SetFocus;
  btn_batal.Enabled:=true;
end;

procedure Tfrm_lihat_key.DBGrid1CellClick(Column: TColumn);
begin
If frm_koneksi.qr_key.RecordCount <> 0 then
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

procedure Tfrm_lihat_key.btn_tambahClick(Sender: TObject);
begin
close;
  kebenaran:=true;
  with frm_input_key do
    begin       
      urutkanc;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      kosong;
      btn_simpbar.ImageIndex:= 6;
      showmodal;
    end;
end;

procedure Tfrm_lihat_key.btn_editClick(Sender: TObject);
begin
  kosong;
  close;
  kebenaran:=false;
  with frm_input_key do
    begin
      edt_key.Enabled:=true;
      mrefresh;
      btn_simpbar.Caption := '&Update';
      btn_simpbar.ImageIndex:= 7;
      showmodal;
  end
end;

procedure Tfrm_lihat_key.btn_hapusClick(Sender: TObject);
begin
 if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data, dengan Kode = "'+(kode_key)+'" ??'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
    with frm_koneksi.qr_key do
    begin
      SQL.Clear;
      simp_log;
      SQL.Text:='DELETE FROM tbl_key WHERE KODE='+QuotedStr(kode_key);
      ExecSQL;
      frm_input_key.mrefresh;
      MessageBox(Application.Handle, ('Berhasil menghapus data'),('Informasi'),MB_ICONINFORMATION);
      kosong;
    end
  else
    begin
      btn_edit.Enabled:=false;
      btn_hapus.Enabled:=false;
      btn_batal.Enabled:=false;
    end;
  frm_input_key.mrefresh;
end;

procedure Tfrm_lihat_key.btn_batalClick(Sender: TObject);
begin
baref;
end;

procedure Tfrm_lihat_key.btn_tutupClick(Sender: TObject);
begin
kosong;
  close;
end;

procedure Tfrm_lihat_key.FormShow(Sender: TObject);
begin
  baref;
end;

end.
