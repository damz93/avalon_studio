unit f_lihat_tip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, StdCtrls, sEdit, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lihat_tip = class(TForm)
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
    procedure btn_tutupClick(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure cmb_cariClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btn_tambahClick(Sender: TObject);
    procedure edit_cariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure tampil;
    procedure baref;
    procedure mrefr_log;
    procedure simp_log;
    procedure koneksi;
     procedure kosong;
  end;

var
  frm_lihat_tip: Tfrm_lihat_tip;
  kod_tip,tgl_tran,kode_trans,rp_nomi,tgl_penar,ditrikol,diinputol:string;

implementation

uses f_koneksi, f_input_tip, f_menu_utama, f_login;

{$R *.dfm}

{ Tfrm_lihat_tip }

procedure Tfrm_lihat_tip.baref;
begin
   frm_input_tip.mrefresh;
  kosong;
end;

procedure Tfrm_lihat_tip.koneksi;
begin
   with frm_koneksi do
  begin
    koneksi;
      with qr_tip do
      begin
        Connection:=koneksiDB;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_tip_crew';
        Active:=true;
      end;
  end;
end;

procedure Tfrm_lihat_tip.kosong;
begin
    btn_edit.Enabled:=false;
  btn_hapus.Enabled:=false;
//  btn_lihat.Enabled:=false;
//  btn_cetak.Enabled:=false;
  btn_batal.Enabled:=false;
  btn_tambah.Enabled:=true;
  cmb_cari.Text:='-- Tampilkan Berdasarkan --';
  cmb_cari.ItemIndex:=-1;
  edit_cari.Clear;
  edit_cari.Enabled:=false;
end;

procedure Tfrm_lihat_tip.mrefr_log;
begin
  with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_lihat_tip.simp_log;
begin
  frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Hapus Transaksi *'+kod_tip+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_lihat_tip.tampil;
begin
   with frm_koneksi.qr_tip do
  Begin
    kod_tip := FieldValues['KODE_TIP'];
    tgl_tran := FieldValues['TGL_TRANSAKSI'];
    kode_trans := FieldValues['KODE_TRANSAKSI'];
    rp_nomi := FieldValues['RP_NOMINAL'];
    tgl_penar := FieldValues['TGL_AMBIL'];
    ditrikol := FieldValues['OLEH'];
    diinputol := FieldValues['DIINPUT'];
   
  end;
end;

procedure Tfrm_lihat_tip.btn_tutupClick(Sender: TObject);
begin
kosong;
  close;
end;

procedure Tfrm_lihat_tip.btn_batalClick(Sender: TObject);
begin
baref;
end;

procedure Tfrm_lihat_tip.cmb_cariClick(Sender: TObject);
begin
edit_cari.Enabled:=true;
  edit_cari.SetFocus;
  btn_batal.Enabled:=true;
end;

procedure Tfrm_lihat_tip.DBGrid1CellClick(Column: TColumn);
begin
If frm_koneksi.qr_tip.RecordCount <> 0 then
  begin
    btn_edit.Enabled := true;
    btn_hapus.Enabled := true;
    btn_batal.Enabled := true;
//    btn_lihat.Enabled:=true;
//    btn_cetak.Enabled:=true;
    tampil;
  end
  else
  begin
    Application.MessageBox('Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
  end;
end;

procedure Tfrm_lihat_tip.btn_tambahClick(Sender: TObject);
begin
 btn_batalClick(btn_batal);
  kebenaran:=true;

  with frm_input_tip do
    begin
      urutkanc;
      tampil_cmb;
      hitot;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      kosong;
      btn_simpbar.ImageIndex:= 6;
      showmodal;
    end;
end;

procedure Tfrm_lihat_tip.edit_cariChange(Sender: TObject);
begin
    {Kode Tip
Tgl Transaksi
Kode Transaksi
Nominal
Tgl Penarikan
Ditarik Oleh
Diinput Oleh
}

with frm_koneksi.qr_tip do
  begin
    if cmb_cari.Text = 'Kode Tip' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_tip_crew where KODE_TIP like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Tgl Transaksi' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_tip_crew where `TGL_TRANSAKSI` like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Kode Transaksi' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_tip_crew where KODE_TRANSAKSI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Nominal' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_tip_crew where RP_NOMINAL like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Tgl Penarikan' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_tip_crew where TGL_AMBIL like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Ditarik Oleh' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_tip_crew where OLEH like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Diinput Oleh' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_tip_crew where DIINPUT like "%' +edit_cari.Text + '%"');
      Open;
    end
  end
end;

procedure Tfrm_lihat_tip.FormShow(Sender: TObject);
begin
  baref;
end;

end.
