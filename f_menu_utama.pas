unit f_menu_utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, jpeg, StdCtrls, sLabel, sPanel, Buttons,
  sSpeedButton;

type
  Tfrm_utama = class(TForm)
    pnl_bawah: TsPanel;
    lbl_nama: TsLabel;
    menu_menu: TMainMenu;
    menu1: TMenuItem;
    LogOut1: TMenuItem;
    Keluar1: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    pnl_utama: TsPanel;
    sSpeedButton1: TsSpeedButton;
    Image1: TImage;
    DataTransaksi1: TMenuItem;
    InputTransaksi1: TMenuItem;
    Mengenai1: TMenuItem;
    Avalon1: TMenuItem;
    Aplikasi1: TMenuItem;
    LihatTransaksi1: TMenuItem;
    Mn_user: TMenuItem;
    lbl_jam: TsLabel;
    Laporan1: TMenuItem;
    LaporanPengeluaran1: TMenuItem;
    InputPengeluaran1: TMenuItem;
    LihatPengeluaran1: TMenuItem;
    LaporanPemasukan1: TMenuItem;
    LaporanSummary1: TMenuItem;
    GantiPassword1: TMenuItem;
    LihatPromo1: TMenuItem;
    InputPromo1: TMenuItem;
    LihatPromo2: TMenuItem;
    LihatLog1: TMenuItem;
    DataUser1: TMenuItem;
    DataKategori1: TMenuItem;
    Input1: TMenuItem;
    Lihat1: TMenuItem;
    DataTipCrew1: TMenuItem;
    LaporanTipCrew1: TMenuItem;
    LaporanTargetPencapaian1: TMenuItem;
    LaporanSaldoBrankas1: TMenuItem;
    DataKey1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LogOut1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure LihatPengeluaran1Click(Sender: TObject);
    procedure InputPengeluaran1Click(Sender: TObject);
    procedure Avalon1Click(Sender: TObject);
    procedure Aplikasi1Click(Sender: TObject);
    procedure LihatTransaksi1Click(Sender: TObject);
    procedure InputTransaksi1Click(Sender: TObject);
    procedure Semua2Click(Sender: TObject);
    procedure Semua1Click(Sender: TObject);
    procedure Semua3Click(Sender: TObject);
    procedure Periode1Click(Sender: TObject);
    procedure LaporanSummary1Click(Sender: TObject);
    procedure GantiPassword1Click(Sender: TObject);
    procedure InputPromo1Click(Sender: TObject);
    procedure LihatPromo2Click(Sender: TObject);
    procedure LihatLog1Click(Sender: TObject);
    procedure DataUser1Click(Sender: TObject);
    procedure DataKategori1Click(Sender: TObject);
    procedure Periode2Click(Sender: TObject);
    procedure Input1Click(Sender: TObject);
    procedure Lihat1Click(Sender: TObject);
    procedure DataTipCrew1Click(Sender: TObject);
    procedure LaporanTipCrew1Click(Sender: TObject);
    procedure LaporanPengeluaran1Click(Sender: TObject);
    procedure LaporanPemasukan1Click(Sender: TObject);
    procedure LaporanTargetPencapaian1Click(Sender: TObject);
    procedure LaporanSaldoBrankas1Click(Sender: TObject);
    procedure DataKey1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure menuAktif;
    procedure menuTAktif;
    procedure tutupk;
  end;
var
  frm_utama: Tfrm_utama;
implementation

uses f_login, f_koneksi, f_lihat_pengeluaran, f_input_pengeluaran,
  f_lihat_user, f_input_user, f_ttg_aplikasi, f_ttg_avalon,
  f_input_transaksi, f_lihat_transaksi, f_lap_pengeluaran,
  f_lap_pengeluaran_berdasarkan, DB, f_lap_pemasukan, f_lap_transaksi,
  f_lap_pemasukan_berdasarkan, f_lap_summary, f_lap_summary_berdasarkan,
  ADODB, f_lihat_promo, f_input_promo, f_lihat_log, f_lihat_kategori,
  f_lap_pemasukan_periode, f_input_costmake, f_lihat_costmake, f_input_tip,
  f_lihat_tip, f_lap_tip_berdasarkan, f_lap_target_periode,
  f_lap_brankas_periode, f_lihat_key;

{$R *.dfm}

procedure Tfrm_utama.FormCreate(Sender: TObject);
begin
   //menuTAktif;
    lbl_nama.Visible:=false;
    Timer2.Enabled :=true;
end;

procedure Tfrm_utama.Timer2Timer(Sender: TObject);
begin
  frm_utama.menuTAktif;
 frm_utama.Enabled:=false;
 frm_login.Show;
end;
procedure Tfrm_utama.Timer1Timer(Sender: TObject);
var a:String;
begin
  a := FormatDateTime('dddd, dd-mmmm-yyyy',Date)+', '+TimeToStr(Time)+'  ';
  lbl_jam.Caption:=a;
end;
procedure Tfrm_utama.menuAktif;
begin
//  Mn_lihat.Enabled:=true;
//  Mn_laporan.Enabled:=true;
  Mn_user.Enabled:=true;
end;

procedure Tfrm_utama.menuTAktif;
begin

end;

procedure Tfrm_utama.LogOut1Click(Sender: TObject);
var pesan:byte;
begin
  pesan:=Application.MessageBox('Yakin ingin Logout?','Konfirmasi',MB_YESNO+MB_ICONQUESTION);
  if pesan=6 then
  begin
    tutupk;
//    lbl_user.Caption:='Level [NAMA]';
    lbl_nama.Visible:=false;
    frm_login.awal;
    frm_login.ShowModal;
  end;
end;

procedure Tfrm_utama.tutupk;
begin
  frm_lihat_user.close;
  frm_lap_brankas_berdasarkan.Close;
  frm_lap_target_periode.close;
  frm_lihat_tip.Close;
  frm_lihat_pengeluaran.close;
  frm_lihat_transaksi.close;
  frm_lihat_promo.close;
  frm_lihat_kategori.close;
  frm_lihat_costmake.close;
  frm_lihat_log.Close;
  frm_lap_tip_berdasarkan.close;
end;

procedure Tfrm_utama.Keluar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_utama.LihatPengeluaran1Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_pengeluaran do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_utama.InputPengeluaran1Click(Sender: TObject);
begin
  tutupk;
  frm_lihat_pengeluaran.baref;
  f_input_pengeluaran.kebenaran:= true;
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

procedure Tfrm_utama.Avalon1Click(Sender: TObject);
begin
  tutupk;
  frm_ttg_avalon.showmodal;
end;

procedure Tfrm_utama.Aplikasi1Click(Sender: TObject);
begin
  tutupk;
   frm_ttg_aplikasi.showmodal;
end;

procedure Tfrm_utama.LihatTransaksi1Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_transaksi do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_utama.InputTransaksi1Click(Sender: TObject);
begin
  tutupk;
  frm_lihat_transaksi.baref;
  kebenaran:=true;
  with frm_input_transaksi do
    begin
      urutkans;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      btn_simpbar.ImageIndex:= 6;
      kosong;
      showmodal;
    end;
end;

procedure Tfrm_utama.Semua2Click(Sender: TObject);
begin
{tutupk;
  with frm_koneksi.qr_pengeluaran do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_pengeluaran ORDER BY `URUT` ASC');
      Open;
    end;
    if frm_koneksi.qr_pengeluaran.RecordCount<>0 then
    begin
      with frm_lap_pengeluaran do
        begin
          lbl_rep_menampilkan.Caption:='Menampilkan semua data Pengeluaran - Avalon Studio';
          EXP_SUM.Expression:='SUM(NOMINAL)';
          qrep_pengeluaran.Preview;
        end;
    end
    else
    begin
      Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
    end;                  }
end;

procedure Tfrm_utama.Semua1Click(Sender: TObject);
begin
  with frm_koneksi.qr_pengeluaran do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_transaksi ORDER BY `TGL_TRANSAKSI` ASC');
      Open;
    end;
      with frm_lap_pemasukan do
        begin
          lbl_rep_menampilkan.Caption:='Menampilkan semua data Pemasukan - Avalon Studio';
          exp_totbayar.Expression:='SUM(TOTAL_BAYAR)';
          exp_crew.Expression:='SUM(TOTAl_CREW)';
          exp_bersih.Expression:='SUM(TOTAl_BERSIH)';
          qrep_pemasukan.Preview;
        end;
end;

procedure Tfrm_utama.Semua3Click(Sender: TObject);
begin
tutupk;
  with frm_koneksi.qr_transaksi do
    begin
      SQL.Clear;
      SQL.Add('SELECT * FROM tbl_transaksi ORDER BY `ID` ASC');
      Open;
    end;
    if frm_koneksi.qr_transaksi.RecordCount<>0 then
    begin
      with frm_lap_pemasukan do
        begin
          lbl_rep_menampilkan.Caption:='Menampilkan semua data Pemasukan - Avalon Studio';
          exp_totbayar.Expression:='SUM(TOTAL_BAYAR)';
          exp_crew.Expression:='SUM(TOTAL_CREW)';
          exp_bersih.Expression:='SUM(TOTAL_BERSIH)';
          qrep_pemasukan.Preview;
        end;
    end
    else
    begin
      Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
    end;
end;

procedure Tfrm_utama.Periode1Click(Sender: TObject);
begin
tutupk;
  with frm_lap_pemasukan_berdasarkan do
    begin
      kosong;
      sembunyi;
      showmodal;
    end;
end;

procedure Tfrm_utama.LaporanSummary1Click(Sender: TObject);
begin
  tutupk;
  with frm_lap_summary_berdasarkan do
    begin
      kosong;
      sembunyi;
      showmodal;
    end;

{    with frm_koneksi.qr_transaksi do
  begin
      SQL.Clear;
          SQL.Add('SELECT sum(tbl_pengeluaran.NOMINAL)as b, sum(tbl_transaksi.TOTAL_BERSIH) as a FROM tbl_pengeluaran, tbl_transaksi where year(tbl_transaksi.TGL_TRANSAKSI)= and');
//          SQL.add('SELECT tbl_pengeluaran.TANGGAL_TRANSAKSI, sum(tbl_pengeluaran.NOMINAL)as b, sum(tbl_transaksi.TOTAL_BERSIH) as aa'+
//          ' FROM tbl_pengeluaran, tbl_transaksi WHERE year(tbl_transaksi.TGL_TRANSAKSI)=2019 AND year(tbl_pengeluaran.TANGGAL_TRANSAKSI)=2019');
          open;
          if frm_koneksi.qr_transaksi.RecordCount<>0 then
            begin
              frm_lap_summary.lbl_rep_menampilkan.Caption:='Laporan Summary berdasarkan Periode';
              frm_lap_summary.exp_bersih.Expression:='a';
              frm_lap_summary.exp_nom.Expression:='b';
              frm_lap_summary.exp_bersihbanget.Expression:='a-b';
              frm_lap_summary.qrep_summary.Preview;
            end
          else
            begin
              Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
            end;
  end;}
end;

procedure Tfrm_utama.GantiPassword1Click(Sender: TObject);
var username,nama_lengkap,password,phone,level:String;
begin
  with frm_koneksi.qr_user do
  Begin
    SQL.Clear;
    SQL.add('SELECT * FROM tbl_user WHERE USERNAME='+QuotedStr(frm_login.edit_user.Text));
    Open;
    username := FieldValues['USERNAME'];
    nama_lengkap := FieldValues['NAMA_LENGKAP'];
    password := FieldValues['PASSWORD'];
    phone := FieldValues['PHONE'];
    level := FieldValues['LEVEL'];
    with frm_input_user do
    begin
      edit_username.Text:=username;
      edit_namlengk.Text:=nama_lengkap;
      edit_passw.Text:=password;
      edit_phone.Text:= phone;
      cmb_level.Text:= level;
    end;
  end;

  with frm_input_user do
    begin
    mrefresh;
    btn_simpbar.Caption := '&Update';
    btn_simpbar.ImageIndex:= 7;
    showmodal;
    edit_namlengk.SetFocus;
  end
end;

procedure Tfrm_utama.InputPromo1Click(Sender: TObject);
begin
  tutupk;
  frm_lihat_promo.baref;
  f_input_promo.kebenaran:= true;
  with frm_input_promo do
    begin
      urutkanc;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      kosong;
      btn_simpbar.ImageIndex:= 6;
      showmodal;
    end;
end;

procedure Tfrm_utama.LihatPromo2Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_promo do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_utama.LihatLog1Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_log do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_utama.DataUser1Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_user do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_utama.DataKategori1Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_kategori do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_utama.Periode2Click(Sender: TObject);
begin
  tutupk;
  with frm_lap_pemasukan_periode do
    begin
      kosong;
      sembunyi;
      showmodal;
    end;
end;

procedure Tfrm_utama.Input1Click(Sender: TObject);
begin
  tutupk;
  frm_lihat_costmake.baref;
  f_input_costmake.kebenaran:= true;
  with frm_input_costmake do
    begin
      urutkanc;
      btn_simpbar.Caption:='&Simpan';
      btn_simpbar.Enabled:=true;
      kosong;
      btn_simpbar.ImageIndex:= 6;
      showmodal;
    end;
end;

procedure Tfrm_utama.Lihat1Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_costmake do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_utama.DataTipCrew1Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_tip do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_utama.LaporanTipCrew1Click(Sender: TObject);
begin
  tutupk;
  with frm_lap_tip_berdasarkan do
    begin
      kosong;
      sembunyi;
      showmodal;
    end;
end;

procedure Tfrm_utama.LaporanPengeluaran1Click(Sender: TObject);
begin
tutupk;
  with frm_lap_pengeluaran_berdasarkan do
    begin
      kosong;
      showmodal;
    end;
end;

procedure Tfrm_utama.LaporanPemasukan1Click(Sender: TObject);
begin
  tutupk;
  with frm_lap_pemasukan_periode do
    begin
      kosong;
      sembunyi;
      showmodal;
    end;
end;

procedure Tfrm_utama.LaporanTargetPencapaian1Click(Sender: TObject);
begin
  tutupk;
  with frm_lap_target_periode do
    begin
      kosong;
      sembunyi;
      showmodal;
    end;
end;

procedure Tfrm_utama.LaporanSaldoBrankas1Click(Sender: TObject);
begin
tutupk;
  with frm_lap_brankas_berdasarkan do
    begin
      kosong;
      sembunyi;
      showmodal;
    end;
end;

procedure Tfrm_utama.DataKey1Click(Sender: TObject);
begin
  tutupk;
  with frm_lihat_key do
    begin
      ManualDock(pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

end.
