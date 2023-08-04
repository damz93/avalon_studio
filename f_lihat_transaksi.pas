unit f_lihat_transaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, StdCtrls, sEdit, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lihat_transaksi = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    DBGrid1: TDBGrid;
    cmb_cari: TsComboBox;
    edit_cari: TsEdit;
    pnl_bawah: TsPanel;
    DataSource1: TDataSource;
    lbl_kodee: TsLabel;
    sPanel2: TsPanel;
    btn_batal: TsSpeedButton;
    btn_cetak: TsSpeedButton;
    btn_edit: TsSpeedButton;
    btn_hapus: TsSpeedButton;
    btn_tambah: TsSpeedButton;
    btn_tutup: TsSpeedButton;
    btn_lihat: TsSpeedButton;
    procedure btn_tutupClick(Sender: TObject);
    procedure btn_tambahClick(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edit_cariChange(Sender: TObject);
    procedure cmb_cariClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function rupiah(sNilai : string): string;
    procedure btn_cetakClick(Sender: TObject);
    procedure btn_hapusClick(Sender: TObject);
    procedure btn_lihatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kosong;
    procedure aktifb;
    procedure koneksi;
    procedure tampil;
    procedure baref;
    procedure mrefr_log;
    procedure simp_log;
  end;

var
  frm_lihat_transaksi: Tfrm_lihat_transaksi;
  kode_transaksi,customernya,paketnya:String;

implementation
                   uses f_koneksi, f_input_transaksi, f_lap_transaksi,
  StrUtils, QuickRpt, f_menu_utama, f_login, f_input_key,
  f_konfirmasi_hapus;
{$R *.dfm}

{ Tfrm_lihat_transaksi }

procedure Tfrm_lihat_transaksi.baref;
begin
  frm_input_transaksi.mrefresh;
  kosong;
end;

procedure Tfrm_lihat_transaksi.koneksi;
begin
with frm_koneksi do
  begin
    koneksi;
      with qr_transaksi do
      begin
        Connection:=frm_koneksi.koneksiDB;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_transaksi';
        Active:=true;
      end;
  end;
end;

procedure Tfrm_lihat_transaksi.kosong;
begin
  btn_edit.Enabled:=false;
  btn_cetak.Enabled:=false;
  btn_hapus.Enabled:=false;
  btn_batal.Enabled:=false;
  btn_lihat.Enabled:=false;
  btn_tambah.Enabled:=true;
  //f_input_jurusan.mrefresh;
  cmb_cari.Text:='-- Tampilkan Berdasarkan --';
  cmb_cari.ItemIndex:=-1;
  edit_cari.Clear;
  edit_cari.Enabled:=false;
end;

procedure Tfrm_lihat_transaksi.tampil;
begin
with frm_koneksi.qr_transaksi do
  Begin
    lbl_kodee.Caption:=FieldValues['KODE_TRANSAKSI'];
    kode_transaksi := FieldValues['KODE_TRANSAKSI'];
    customernya := FieldValues['NAMA_COST'];
    paketnya := FieldValues['JENIS_PAKET'];
{    tanggal := FieldValues['TANGGAL_TRANSAKSI'];
    keperluan := FieldValues['KEPERLUAN'];
    keterangan := FieldValues['KETERANGAN'];
    lbl_keperluan.Caption:=keperluan;
    with frm_input_pengeluaran do
    begin
      lbl_urut.Caption:=urut;
      lbl_kodee.Caption:=urut;
      tgl_keluar.Date:=StrToDate(tanggal);
      cmb_jenis_keperluan.Text:=keperluan;
      edt_keterangan.Text:=keterangan;
    end;
    }
  end;
end;

procedure Tfrm_lihat_transaksi.btn_tutupClick(Sender: TObject);
begin
  kosong;
  close;
end;

procedure Tfrm_lihat_transaksi.btn_tambahClick(Sender: TObject);
begin
  close;
  with frm_input_transaksi do
    begin                        
      urutkans;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      kosong;
      btn_simpbar.ImageIndex:= 6;
      showmodal;
    end;
end;

procedure Tfrm_lihat_transaksi.btn_batalClick(Sender: TObject);
begin
  baref;
end;

procedure Tfrm_lihat_transaksi.DBGrid1CellClick(Column: TColumn);
begin
  If frm_koneksi.qr_transaksi.RecordCount <> 0 then
  begin
    aktifb;
    tampil;
  end
  else
  begin
    Application.MessageBox('Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
  end;
end;

procedure Tfrm_lihat_transaksi.edit_cariChange(Sender: TObject);
begin
with frm_koneksi.qr_transaksi do
  begin
    if cmb_cari.Text = 'Kode Transaksi' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where KODE_TRANSAKSI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Nama Costumer' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where NAMA_COST like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Jumlah Orang' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where JUMLAH_ORANG like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Jenis Paket' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where JENIS_PAKET like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Detail Paket' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where DETAIL_FREE like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Jumlah Sesi' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where JUMLAH_SESI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Jenis Latar' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where JENIS_LATAR like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Detail Charge' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where DETAIL_CHARGE like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Harga Charge' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where HARGA_CHARGE like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Detail Tambahan' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where DETAIL_TAMBAHAN like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Harga Tambahan' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where HARGA_TAMBAHAN like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Tanggal Transaksi' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where TGL_TRANSAKSI like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Tanggal Pengambilan' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where TGL_PENGAMBILAN like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Total Kotor' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where TOTAL_KOTOR like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Total Ke Crew' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where TOTAL_CREW like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Total Bersih' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where TOTAL_BERSIH like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Payment' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where PAYMENT like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Oleh' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_transaksi where OLEH like "%' +edit_cari.Text + '%"');
      Open;
    end
  end
end;

procedure Tfrm_lihat_transaksi.cmb_cariClick(Sender: TObject);
begin
  aktifb;
  edit_cari.Enabled:=true;
  edit_cari.SetFocus;

end;

procedure Tfrm_lihat_transaksi.aktifb;
begin
  btn_edit.Enabled := true;
  btn_lihat.Enabled:=true;
  btn_hapus.Enabled := true;
  btn_batal.Enabled := true;
  btn_cetak.Enabled:=true;
  btn_hapus.Enabled:=true;
end;

procedure Tfrm_lihat_transaksi.FormShow(Sender: TObject);
begin
  baref;
  kosong;
end;

procedure Tfrm_lihat_transaksi.btn_cetakClick(Sender: TObject);
var kode : String;
begin 
    kode:=lbl_kodee.Caption;
    with frm_koneksi.qr_transaksi do
    begin
      SQL.Clear;
      SQL.Add('SELECT KODE_TRANSAKSI,NAMA_COST,JUMLAH_SESI,JENIS_PAKET,DETAIL_FREE,DETAIL_TAMBAHAN,DETAIL_CHARGE,TGL_PENGAMBILAN,RP_HARGA_PAKET,RP_HARGA_LAIN,RP_HARGA_CHARGE,RP_TOTAL,RP_CASHBACK,'
                        +'SUM(TOTAL_BAYAR)AS BAYAR,OLEH,TGL_TRANSAKSI FROM tbl_transaksi where KODE_TRANSAKSI='+QuotedStr(kode)+' GROUP BY KODE_TRANSAKSI,NAMA_COST,JUMLAH_SESI,JENIS_PAKET,DETAIL_FREE,DETAIL_TAMBAHAN,DETAIL_CHARGE,TGL_PENGAMBILAN,RP_HARGA_PAKET,RP_HARGA_LAIN,RP_HARGA_CHARGE,RP_TOTAL,RP_CASHBACK,OLEH,TGL_TRANSAKSI');
      Open;
    with frm_lap_transaksi.qrep_transaksinow do
      begin

       // Preview;
//         Prepare;
         // Preview;            // or Print.

         frm_lap_transaksi.QRDBText13.Caption := 'BAYAR';
        Print;
        Preview;
      end

    end;
      baref;

end;

function Tfrm_lihat_transaksi.rupiah(sNilai: string): string;
var
i, p : Longint;
sHasil, sKi : string;
begin
  p := Length(Trim(sNilai));
  while (p mod 3 <> 0) do
    begin
      sNilai := '0'+ sNilai;
      p := Length(sNilai);
    end;
  sHasil := '';
  for i := 1 to p do
    begin
      if (i mod 3 = 0) then
        begin
          sHasil := shasil + '.'+Copy(sNilai, i - 2, 3);
        end;
    end;
    p := Length(sHasil);
    sHasil := Copy(sHasil, 2, p);
    sKi := Copy(sHasil, 1, 3);
    sKi := IntToStr(StrToInt(sKi));
    sHasil := sKi + Copy(sHasil, 4, p);
    Result := sHasil;
end;
procedure Tfrm_lihat_transaksi.btn_hapusClick(Sender: TObject);
begin
  if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data, dengan Kode Transaksi= "'+(kode_transaksi)+'" ??'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
//   if  MessageBox(Application.Handle, PChar('Yakin ingin menghapus Data?'), PChar('Konfirmasi'), MB_ICONQUESTION+MB_YESNO)=6 then
  begin
  with frm_konfirm do
    begin
      edt_detail.text:=kode_transaksi+' | '+customernya+' | '+paketnya;

      edt_key.Text:='';
      showmodal;
    end;
  end
  else
    begin
      btn_edit.Enabled:=false;
      btn_hapus.Enabled:=false;
      btn_batal.Enabled:=false;
    end;
  frm_input_transaksi.mrefresh;
end;

procedure Tfrm_lihat_transaksi.btn_lihatClick(Sender: TObject);
begin

    with frm_koneksi.qr_transaksi do
    begin
      SQL.Clear;
     SQL.Add('SELECT KODE_TRANSAKSI,NAMA_COST,JUMLAH_SESI,JENIS_PAKET,DETAIL_FREE,DETAIL_TAMBAHAN,DETAIL_CHARGE,TGL_PENGAMBILAN,RP_HARGA_PAKET,RP_HARGA_LAIN,RP_HARGA_CHARGE,RP_TOTAL,RP_CASHBACK,'
                        +'SUM(TOTAL_BAYAR)AS BAYAR,OLEH,TGL_TRANSAKSI FROM tbl_transaksi where KODE_TRANSAKSI='+QuotedStr(lbl_kodee.Caption)+' GROUP BY KODE_TRANSAKSI,NAMA_COST,JUMLAH_SESI,JENIS_PAKET,DETAIL_FREE,DETAIL_TAMBAHAN,DETAIL_CHARGE,TGL_PENGAMBILAN,RP_HARGA_PAKET,RP_HARGA_LAIN,RP_HARGA_CHARGE,RP_TOTAL,RP_CASHBACK,OLEH,TGL_TRANSAKSI');
      Open;
    with frm_lap_transaksi.qrep_transaksinow do
      begin
        Preview;
      end

    end;
      baref;
end;
procedure Tfrm_lihat_transaksi.mrefr_log;
begin
with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_lihat_transaksi.simp_log;
begin
frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Hapus Transaksi dengan kode *'+kode_transaksi+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

end.
