unit f_lihat_promo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, StdCtrls, sEdit, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lihat_promo = class(TForm)
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
    procedure cmb_cariClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edit_cariChange(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_hapusClick(Sender: TObject);
    procedure btn_tambahClick(Sender: TObject);
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
  frm_lihat_promo: Tfrm_lihat_promo;
  kode, nama, detail, harga, status, tanggal, oleh,jumlah,kategori,jenis,bicrew,min_orang : String;
implementation

uses f_koneksi,  f_input_promo, f_menu_utama, f_login;

{$R *.dfm}

{ Tfrm_lihat_promo }

procedure Tfrm_lihat_promo.baref;
begin
  frm_input_promo.mrefresh;
  kosong;
end;

procedure Tfrm_lihat_promo.koneksi;
begin
with frm_koneksi do
  begin
    koneksi;
      with qr_promo do
      begin
        Connection:=frm_koneksi.koneksiDB;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_promo WHERE STATUS="Aktif"';
        Active:=true;
      end;
  end;
end;

procedure Tfrm_lihat_promo.kosong;
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

procedure Tfrm_lihat_promo.mrefr_log;
begin
  with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_lihat_promo.simp_log;
begin
  frm_koneksi.putus;
  with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Hapus Promo *'+kode+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_lihat_promo.tampil;
begin
with frm_koneksi.qr_promo do
  Begin
    kode := FieldValues['KODE_PROMO'];
    bicrew := FieldValues['KECREW'];
    jenis := FieldValues['JENIS'];
    nama := FieldValues['NAMA_PROMO'];
    detail := FieldValues['DETAIL_PROMO'];
    harga := FieldValues['HARGA_PROMO'];
    bicrew := FieldValues['KECREW'];
    status := FieldValues['STATUS'];
    tanggal := FieldValues['TANGGAL'];
    kategori := FieldValues['KATEGORI'];
    jumlah := FieldValues['JUMLAH_ORANG'];
    min_orang := FieldValues['MIN_ORANG'];
    with frm_input_promo do
    begin
      lbl_promo.Caption:=kode;
      edt_namapromo.Text:=nama;
      edt_detailpromo.Text:=detail;
      cmb_kategori.Text:=kategori;
      edt_hargapr.Text:=harga;
      edt_max.Text:=jumlah;
      edt_bicrew.Text:=bicrew;
      edt_min.Text:=min_orang;
      if status = 'Aktif' then
        chk_status.Checked:=True
      else
        chk_status.Checked:=False;
      if jenis = 'Non Promo' then
        rd_nonprom.Checked:=True
      else
        rd_prom.Checked:=true;
      tgl_promo.Date:=StrToDate(tanggal);
    end;
  end;
end;

procedure Tfrm_lihat_promo.cmb_cariClick(Sender: TObject);
begin
  edit_cari.Enabled:=true;
  edit_cari.SetFocus;
  btn_batal.Enabled:=true;
end;

procedure Tfrm_lihat_promo.DBGrid1CellClick(Column: TColumn);
begin
  If frm_koneksi.qr_promo.RecordCount <> 0 then
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

procedure Tfrm_lihat_promo.edit_cariChange(Sender: TObject);
begin
with frm_koneksi.qr_promo do
  begin
    if cmb_cari.Text = 'Kode Paket' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where KODE_PROMO like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Nama Paket' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where NAMA_PROMO like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Kategori' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where KATEGORI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Detail Paket' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where DETAIL_PROMO like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Harga Paket' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where HARGA_PROMO like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Jenis' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where JENIS like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Tanggal' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where TANGGAL like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Status' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where STATUS like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Oleh' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where OLEH like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Max Orang' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where JUMLAH_ORANG like "%' +edit_cari.Text + '%"');
      Open;
    end
        else if cmb_cari.Text = 'Min Orang' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_promo where MIN_ORANG like "%' +edit_cari.Text + '%"');
      Open;
    end
  end
end;

procedure Tfrm_lihat_promo.btn_batalClick(Sender: TObject);
begin
  baref;
end;

procedure Tfrm_lihat_promo.btn_editClick(Sender: TObject);
begin
  kosong;
  close;
  kebenaran:=false;
  with frm_input_promo do
    begin
      mrefresh;
      btn_simpbar.Caption := '&Update';
      btn_simpbar.ImageIndex:= 7;
      showmodal;
  end
end;

procedure Tfrm_lihat_promo.btn_hapusClick(Sender: TObject);
begin
  if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data, dengan Kode Promo= "'+(kode)+'" ??'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
    with frm_koneksi.qr_promo do
    begin
      SQL.Clear;
      simp_log;
      SQL.Text:='DELETE FROM tbl_promo WHERE KODE_PROMO='+QuotedStr(kode);
      ExecSQL;
      frm_input_promo.mrefresh;
      MessageBox(Application.Handle, ('Berhasil menghapus data'),('Informasi'),MB_ICONINFORMATION);
      kosong;
    end
  else
    begin
      btn_edit.Enabled:=false;
      btn_hapus.Enabled:=false;
      btn_batal.Enabled:=false;
    end;
  frm_input_promo.mrefresh;
end;

procedure Tfrm_lihat_promo.btn_tambahClick(Sender: TObject);
begin
  close;
  kebenaran:=true;
  with frm_input_promo do
    begin       
      urutkanc;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      kosong;
      btn_simpbar.ImageIndex:= 6;
      showmodal;
    end;
//    kebenaran:=true;
end;

procedure Tfrm_lihat_promo.btn_tutupClick(Sender: TObject);
begin
  kosong;
  close;
end;

procedure Tfrm_lihat_promo.FormShow(Sender: TObject);
begin
  baref;
end;

end.
