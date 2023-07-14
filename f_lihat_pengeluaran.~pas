unit f_lihat_pengeluaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, StdCtrls, sEdit, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lihat_pengeluaran = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    lbl_keperluan: TsLabel;
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
    btn_lihat: TsSpeedButton;
    btn_cetak: TsSpeedButton;
    procedure btn_tambahClick(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_hapusClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btn_tutupClick(Sender: TObject);
    procedure edit_cariChange(Sender: TObject);
    procedure cmb_cariClick(Sender: TObject);
    procedure btn_cetakClick(Sender: TObject);
    procedure btn_lihatClick(Sender: TObject);
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
  frm_lihat_pengeluaran: Tfrm_lihat_pengeluaran;
    urut, nominal, keperluan, keterangan, tanggal : string;


implementation
      uses f_koneksi, f_input_pengeluaran, f_menu_utama, f_login,
  f_lap_transaksi, f_lap_keluar;
{$R *.dfm}

{ Tfrm_lihat_pengeluaran }

procedure Tfrm_lihat_pengeluaran.baref;
begin
  frm_input_pengeluaran.mrefresh;
  kosong;
end;

procedure Tfrm_lihat_pengeluaran.koneksi;
begin
with frm_koneksi do
  begin
    koneksi;
      with qr_pengeluaran do
      begin
        Connection:=frm_koneksi.koneksiDB;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_pengeluaran';
        Active:=true;
      end;
  end;
end;

procedure Tfrm_lihat_pengeluaran.kosong;
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

procedure Tfrm_lihat_pengeluaran.tampil;
begin
with frm_koneksi.qr_pengeluaran do
  Begin
    urut := FieldValues['KODE_TRANSAKSI'];
    nominal := FieldValues['NOMINAL'];
    tanggal := FieldValues['TANGGAL_TRANSAKSI'];
    keperluan := FieldValues['KEPERLUAN'];
    keterangan := FieldValues['KETERANGAN'];
    with frm_input_pengeluaran do
    begin
      lbl_kodee.Caption:=urut;
      edt_nominal.Text:=nominal;
//      tgl_keluar.Date:=StrToDate(tanggal);
//      tgl_keluar.Date:=tanggal;
      tex_tgl.Caption:=tanggal;
      cmb_jenis_keperluan.Text:=keperluan;
      edt_keterangan.Text:=keterangan;
    end;
  end;
end;

procedure Tfrm_lihat_pengeluaran.btn_tambahClick(Sender: TObject);
begin
  close;
  kebenaran:=true;
  with frm_input_pengeluaran do
    begin
      urutkanc;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      kosong;
      btn_simpbar.ImageIndex:= 6;
      cmb_jenis_keperluan.ItemIndex:=-1;
      showmodal;
    end;
end;

procedure Tfrm_lihat_pengeluaran.btn_batalClick(Sender: TObject);
begin
  baref;
end;

procedure Tfrm_lihat_pengeluaran.btn_editClick(Sender: TObject);
begin
  kosong;
  close;
  kebenaran:=false;
  with frm_input_pengeluaran do
    begin
    mrefresh;
    btn_simpbar.Caption := '&Update';
    btn_simpbar.ImageIndex:= 7;
    showmodal;
  end

end;

procedure Tfrm_lihat_pengeluaran.btn_hapusClick(Sender: TObject);
begin
  if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data, dengan Kode Transaksi= "'+(urut)+'" ??'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
//   if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data?'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
    with frm_koneksi.qr_pengeluaran do
    begin
      SQL.Clear;
      simp_log;
      SQL.Text:='DELETE FROM tbl_pengeluaran WHERE KODE_TRANSAKSI='+QuotedStr(urut);
      ExecSQL;
      frm_input_pengeluaran.mrefresh;
      MessageBox(Application.Handle, ('Berhasil menghapus data'),('Informasi'),MB_ICONINFORMATION);
      kosong;
    end
  else
    begin
      btn_edit.Enabled:=false;
      btn_hapus.Enabled:=false;
      btn_batal.Enabled:=false;
    end;
  frm_input_pengeluaran.mrefresh;
end;

procedure Tfrm_lihat_pengeluaran.DBGrid1CellClick(Column: TColumn);
begin
  If frm_koneksi.qr_pengeluaran.RecordCount <> 0 then
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

procedure Tfrm_lihat_pengeluaran.FormShow(Sender: TObject);
begin
  baref;
end;

procedure Tfrm_lihat_pengeluaran.btn_tutupClick(Sender: TObject);
begin
  kosong;
  close;
end;

procedure Tfrm_lihat_pengeluaran.edit_cariChange(Sender: TObject);
begin
{
Kode Transaksi
Tanggal
Diajukan Oleh
Diajukan Untuk
Rincian
Total
}
with frm_koneksi.qr_pengeluaran do
  begin
    if cmb_cari.Text = 'Kode Transaksi' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_pengeluaran where KODE_TRANSAKSI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Tanggal' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_pengeluaran where TANGGAL_TRANSAKSI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Total' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_pengeluaran where NOMINAL like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Diajukan Untuk' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_pengeluaran where KEPERLUAN like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Diajukan Oleh' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_pengeluaran where OLEH like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Rincian' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_pengeluaran where KETERANGAN like "%' +edit_cari.Text + '%"');
      Open;
    end
  end
end;

procedure Tfrm_lihat_pengeluaran.cmb_cariClick(Sender: TObject);
begin
  edit_cari.Enabled:=true;
  edit_cari.SetFocus;
  btn_batal.Enabled:=true;
end;

procedure Tfrm_lihat_pengeluaran.mrefr_log;
begin
with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_lihat_pengeluaran.simp_log;
begin
frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Hapus Pengeluaran *'+urut+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_lihat_pengeluaran.btn_cetakClick(Sender: TObject);
var kode : string;
begin
    kode:=frm_input_pengeluaran.lbl_kodee.Caption;
    with frm_koneksi.qr_pengeluaran do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_pengeluaran where KODE_TRANSAKSI='+QuotedStr(kode));
      Open;
    with frm_lap_keluar.qrep_transaksinow do
      begin
        Print;
        Preview;
      end
    end;
      baref;
end;

procedure Tfrm_lihat_pengeluaran.btn_lihatClick(Sender: TObject);
var kode : string;
begin
    kode:=frm_input_pengeluaran.lbl_kodee.Caption;
    with frm_koneksi.qr_pengeluaran do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_pengeluaran where KODE_TRANSAKSI='+QuotedStr(kode));
      Open;
    with frm_lap_keluar.qrep_transaksinow do
      begin
        Preview;
      end
    end;
      baref;
end;

end.
