unit f_lihat_costmake;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, StdCtrls, sEdit, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lihat_costmake = class(TForm)
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
  frm_lihat_costmake: Tfrm_lihat_costmake;
    kode, nama, harga, status, tanggal, oleh,bicrew: String;

implementation

uses f_koneksi, f_input_costmake, f_menu_utama, f_login;

{$R *.dfm}

{ Tfrm_lihat_costmake }

procedure Tfrm_lihat_costmake.baref;
begin
  frm_input_costmake.mrefresh;
  kosong;
end;

procedure Tfrm_lihat_costmake.koneksi;
begin
with frm_koneksi do
  begin
    koneksi;
      with qr_costmake do
      begin
        Connection:=frm_koneksi.koneksiDB;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_costmake WHERE STATUS="Y"';
        Active:=true;
      end;
  end;
end;

procedure Tfrm_lihat_costmake.kosong;
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

procedure Tfrm_lihat_costmake.mrefr_log;
begin
  with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_lihat_costmake.simp_log;
begin
  frm_koneksi.putus;
  with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Hapus Paket Costum | MakeUp *'+kode+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_lihat_costmake.tampil;
begin
with frm_koneksi.qr_costmake do
  Begin
    kode := FieldValues['KODE'];
    bicrew := FieldValues['KECREW'];
    nama := FieldValues['DETAIL'];
    harga := FieldValues['HARGA'];
    bicrew := FieldValues['KECREW'];
    status := FieldValues['STATUS'];
    tanggal := FieldValues['WAKTU'];
    with frm_input_costmake do
    begin
      lbl_promo.Caption:=kode;
      edt_detailpromo.Text:=nama;
      edt_hargapr.Text:=harga;
      edt_bicrew.Text:=bicrew;
      if status = 'Y' then
        chk_status.Checked:=True
      else
        chk_status.Checked:=False;
      tgl_promo.Date:=StrToDate(tanggal);
    end;
  end;
end;

procedure Tfrm_lihat_costmake.cmb_cariClick(Sender: TObject);
begin
  edit_cari.Enabled:=true;
  edit_cari.SetFocus;
  btn_batal.Enabled:=true;
end;

procedure Tfrm_lihat_costmake.edit_cariChange(Sender: TObject);
begin
{
Tanggal
Kode
Nama Paket
Harga Paket
Biaya ke Crew
Oleh
Status

}
with frm_koneksi.qr_costmake do
  begin
    if cmb_cari.Text = 'Tanggal' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_costmake where WAKTU like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Nama Paket' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_costmake where DETAIL like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Harga Paket' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_costmake where RP_HARGA like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Biaya ke Crew' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_costmake where RP_CREW like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Oleh' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_costmake where OLEH like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Status' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_costmake where STATUS like "%' +edit_cari.Text + '%"');
      Open;
    end
  end
end;

procedure Tfrm_lihat_costmake.DBGrid1CellClick(Column: TColumn);
begin
  If frm_koneksi.qr_costmake.RecordCount <> 0 then
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

procedure Tfrm_lihat_costmake.btn_tambahClick(Sender: TObject);
begin
  close;
  kebenaran:=true;
  with frm_input_costmake do
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

procedure Tfrm_lihat_costmake.btn_editClick(Sender: TObject);
begin
  kosong;
  close;
  kebenaran:=false;
  with frm_input_costmake do
    begin
      mrefresh;
      btn_simpbar.Caption := '&Update';
      btn_simpbar.ImageIndex:= 7;
      showmodal;
  end
end;

procedure Tfrm_lihat_costmake.btn_hapusClick(Sender: TObject);
begin
  if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data, dengan Kode Paket= "'+(kode)+'" ??'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
    with frm_koneksi.qr_costmake do
    begin
      SQL.Clear;
      simp_log;
      SQL.Text:='DELETE FROM tbl_costmake WHERE KODE='+QuotedStr(kode);
      ExecSQL;
      frm_input_costmake.mrefresh;
      MessageBox(Application.Handle, ('Berhasil menghapus data'),('Informasi'),MB_ICONINFORMATION);
      kosong;
    end
  else
    begin
      btn_edit.Enabled:=false;
      btn_hapus.Enabled:=false;
      btn_batal.Enabled:=false;
    end;
  frm_input_costmake.mrefresh;
end;

procedure Tfrm_lihat_costmake.btn_batalClick(Sender: TObject);
begin
  baref;
end;

procedure Tfrm_lihat_costmake.btn_tutupClick(Sender: TObject);
begin
  kosong;
  close;
end;

procedure Tfrm_lihat_costmake.FormShow(Sender: TObject);
begin
  baref;
end;

end.
