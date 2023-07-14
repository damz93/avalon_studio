unit f_lap_summary_berdasarkan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  sComboBox, sLabel, Buttons, sSpeedButton, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lap_summary_berdasarkan = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    btn_keluar: TsSpeedButton;
    btn_tampil: TsSpeedButton;
    sPanel2: TsPanel;
    sGroupBox2: TsGroupBox;
    gbox_periode: TsGroupBox;
    sLabel1: TsLabel;
    cmb_periode: TsComboBox;
    cmb_tahunan: TsComboBox;
    cmb_bulanan: TsComboBox;
    cmb_harian: TsDateEdit;
    procedure cmb_periodeClick(Sender: TObject);
    procedure cmb_tahunanClick(Sender: TObject);
    procedure cmb_bulananClick(Sender: TObject);
    procedure btn_tampilClick(Sender: TObject);
    procedure btn_keluarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kosong;
    procedure sembunyi;
  end;

var
  frm_lap_summary_berdasarkan: Tfrm_lap_summary_berdasarkan;

implementation

uses f_koneksi, f_lap_summary, f_login;

{$R *.dfm}

{ Tfrm_lap_summary_berdasarkan }

procedure Tfrm_lap_summary_berdasarkan.kosong;
begin
  cmb_periode.ItemIndex := -1;
  btn_tampil.Enabled := false;
end;

procedure Tfrm_lap_summary_berdasarkan.sembunyi;
begin
  cmb_tahunan.Visible := false;
  cmb_bulanan.Visible := false;
  cmb_harian.Visible := false;
end;

procedure Tfrm_lap_summary_berdasarkan.cmb_periodeClick(Sender: TObject);
begin
  cmb_periode.Style := csDropDownList;
  sembunyi;
  if cmb_periode.ItemIndex <> -1 then
    if cmb_periode.ItemIndex = 0 then
      cmb_tahunan.Visible := true
    else if cmb_periode.ItemIndex = 1 then
    begin
      cmb_tahunan.Visible := true;
      cmb_bulanan.Visible := true;
    end
    else if cmb_periode.ItemIndex = 2 then
    begin
      cmb_harian.Visible := true;
      cmb_harian.date := date;
    end;

  btn_tampil.Enabled := true;
end;

procedure Tfrm_lap_summary_berdasarkan.cmb_tahunanClick(Sender: TObject);
begin
  cmb_tahunan.Style := csDropDownList;
  btn_tampil.Enabled := true;
end;

procedure Tfrm_lap_summary_berdasarkan.cmb_bulananClick(Sender: TObject);
begin
  cmb_bulanan.Style := csDropDownList;
  btn_tampil.Enabled := true;
end;

procedure Tfrm_lap_summary_berdasarkan.btn_tampilClick(Sender: TObject);
begin
  with frm_koneksi.qr_transaksi do
    if cmb_periode.ItemIndex = 0 then
    begin

      if(frm_login.edit_user.Text='nanu')or(frm_login.edit_user.Text='NANU')or(frm_login.cmb_level.Text='Owner')or(frm_login.cmb_level.Text='DAMZ') then
     begin

      if (cmb_tahunan.ItemIndex <> -1) then
      begin
        SQL.Clear;
     {   SQL.Add(
          'SELECT sum (tbl_pengeluaran.NOMINAL) as pengeluaran,(SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where YEAR(TGL_TRANSAKSI)='
          +
          QuotedStr(cmb_tahunan.Text) + ') as pemasukan FROM tbl_pengeluaran where YEAR(tbl_pengeluaran.TANGGAL_TRANSAKSI)=' +
          QuotedStr(cmb_tahunan.Text));

          }
          //SELECT sum (tbl_pengeluaran.NOMINAL) as pengeluaran,(SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where TGL_TRANSAKSI=DATEVALUE('2022/01/21')and PAYMENT="CASH") as pemasukancash,(SELECT sum(TOTAL_BAYAR) FROM tbl_transaksi where TGL_TRANSAKSI=DATEVALUE('2022/01/21') and PAYMENT="EDC") as pemasukanedckotor,(SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where TGL_TRANSAKSI=DATEVALUE('2022/01/21')and PAYMENT="EDC") as pemasukanedcbersih,(SELECT sum(NOMINAL) FROM tbl_pengeluaran where TANGGAL_TRANSAKSI=DATEVALUE('2022/01/21') AND TAG='Y') as pengeluaran_edc_crew FROM tbl_pengeluaran where tbl_pengeluaran.TANGGAL_TRANSAKSI=DATEVALUE('2022/01/21') AND TAG='T'
          SQL.Add(
          'SELECT sum (tbl_pengeluaran.NOMINAL) as pengeluaran_bukan,(SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where YEAR(TGL_TRANSAKSI)='
          +
          QuotedStr(cmb_tahunan.Text) + ' and PAYMENT="CASH") as pemasukancash, (SELECT sum(TOTAL_BAYAR) FROM tbl_transaksi where YEAR(TGL_TRANSAKSI)='
          +
          QuotedStr(cmb_tahunan.Text) + ' and PAYMENT="EDC") as pemasukanedckotor, (SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where YEAR(TGL_TRANSAKSI)='
          +
          QuotedStr(cmb_tahunan.Text) + ' and PAYMENT="EDC") as pemasukanedcbersih,(SELECT sum(NOMINAL) FROM tbl_pengeluaran where YEAR(TANGGAL_TRANSAKSI)='
          +
          QuotedStr(cmb_tahunan.Text) + ' AND TAG="Y") as pengeluaran_edc_crew FROM tbl_pengeluaran where YEAR(tbl_pengeluaran.TANGGAL_TRANSAKSI)='
          +
          QuotedStr(cmb_tahunan.Text) + ' AND TAG="T"');

        Open;
        if frm_koneksi.qr_transaksi.RecordCount <> 0 then
        begin
          with frm_lap_summary do
          begin
            lbl_rep_menampilkan.Caption := 'Laporan Summary Tahun "' + cmb_tahunan.Text + '"';
            exp_cash.Expression := 'pemasukancash';
            exp_edc_kotor.Expression := 'pemasukanedckotor';
            exp_saldo_brankas.Expression:='600000000-pengeluaran_edc_crew-pengeluaran_bukan';
            exp_crew_edc.Expression:= 'pengeluaran_edc_crew';
            exp_edc_bersih.Expression := 'pemasukanedcbersih';
            exp_keluar.Expression := 'pengeluaran_bukan';
            exp_uang_cash.Expression := 'pemasukancash-pengeluaran_edc_crew-pengeluaran_bukan';
            exp_bersihbanget.Expression := 'pemasukancash+pemasukanedcbersih-pengeluaran_bukan';
            if exp_bersihbanget.Caption = 'Rp' then
              Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...',
                'Data Kosong', MB_ICONWARNING)
            else
              qrep_summary.Preview;
          end;
        end
        else
        begin
          Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...',
            'Data Kosong', MB_ICONWARNING);
          sembunyi;
          kosong;
        end;
      end
      else
      begin
        cmb_tahunan.SetFocus;
        Application.MessageBox('Maaf, Silahkan pilih Tahun terlebih dahulu', 'Kesalahan', MB_ICONINFORMATION);
      end

      end
      else
     begin
      Application.MessageBox('AKSES TIDAK DIIZINKAN.', 'Kesalahan', MB_ICONINFORMATION);
     end

    end
    else if cmb_periode.ItemIndex = 1 then
    begin
    if(frm_login.edit_user.Text='nanu')or(frm_login.edit_user.Text='NANU')or(frm_login.cmb_level.Text='Owner')or(frm_login.cmb_level.Text='DAMZ') then
     begin


      if (cmb_tahunan.ItemIndex <> -1) and (cmb_bulanan.ItemIndex <> -1) then
      begin
        SQL.Clear;
        SQL.Add(
          'SELECT sum (tbl_pengeluaran.NOMINAL) as pengeluaran_bukan,(SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where YEAR(TGL_TRANSAKSI)='
          +QuotedStr(cmb_tahunan.Text) + ' and month(TGL_TRANSAKSI)='+QuotedStr(cmb_bulanan.Text)+
          ' and PAYMENT="CASH") as pemasukancash, (SELECT sum(TOTAL_BAYAR) FROM tbl_transaksi where YEAR(TGL_TRANSAKSI)='
          +QuotedStr(cmb_tahunan.Text) + ' and month(TGL_TRANSAKSI)='
          +QuotedStr(cmb_bulanan.Text) +' and PAYMENT="EDC") as pemasukanedckotor, (SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where YEAR(TGL_TRANSAKSI)='
          +QuotedStr(cmb_tahunan.Text) + ' and month(TGL_TRANSAKSI)='
          + QuotedStr(cmb_bulanan.Text) +' and PAYMENT="EDC") as pemasukanedcbersih,(SELECT sum(NOMINAL) FROM tbl_pengeluaran where YEAR(TANGGAL_TRANSAKSI)='
          +QuotedStr(cmb_tahunan.Text) + ' and month(TANGGAL_TRANSAKSI)='
          + QuotedStr(cmb_bulanan.Text) +' AND TAG="Y") as pengeluaran_edc_crew FROM tbl_pengeluaran where YEAR(tbl_pengeluaran.TANGGAL_TRANSAKSI)='
          + QuotedStr(cmb_tahunan.Text) + ' and month(tbl_pengeluaran.TANGGAL_TRANSAKSI)=' + QuotedStr(cmb_bulanan.Text) + ' AND TAG="T"');
        Open;
        if frm_koneksi.qr_transaksi.RecordCount <> 0 then
        begin
          with frm_lap_summary do
          begin
            lbl_rep_menampilkan.Caption := 'Laporan Summary Bulan "' + cmb_bulanan.Text + '" Tahun "' + cmb_tahunan.Text + '"';
            exp_cash.Expression := 'pemasukancash';
            exp_edc_kotor.Expression := 'pemasukanedckotor';
            exp_saldo_brankas.Expression:='50000000-pengeluaran_edc_crew-pengeluaran_bukan';
            exp_crew_edc.Expression:= 'pengeluaran_edc_crew';
            exp_edc_bersih.Expression := 'pemasukanedcbersih';
            exp_uang_cash.Expression := 'pemasukancash-pengeluaran_edc_crew-pengeluaran_bukan';
            exp_keluar.Expression := 'pengeluaran_bukan';
            exp_bersihbanget.Expression := 'pemasukancash+pemasukanedcbersih-pengeluaran_bukan';
            if exp_bersihbanget.Caption = 'Rp' then
              Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...',
                'Data Kosong', MB_ICONWARNING)
            else
              qrep_summary.Preview;
          end;
        end
        else
        begin
          Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...',
            'Data Kosong', MB_ICONWARNING);
          sembunyi;
          kosong;
        end;
      end
      else
      begin
        cmb_bulanan.SetFocus;
        Application.MessageBox('Maaf, Silahkan pilih Tahun dan Bulan terlebih dahulu',
          'Kesalahan', MB_ICONINFORMATION);
      end;
      end
      else
     begin
      Application.MessageBox('AKSES TIDAK DIIZINKAN.', 'Kesalahan', MB_ICONINFORMATION);
     end


    end
    else if cmb_periode.ItemIndex = 2 then
    begin
      SQL.Clear;
      //      SQL.Add('SELECT * FROM tbl_transaksi WHERE `TGL_TRANSAKSI`='+QuotedStr(cmb_harian.Text)+' ORDER BY `TGL_TRANSAKSI` ASC');
   {   SQL.Add('SELECT sum (tbl_pengeluaran.NOMINAL) as pengeluaran,(SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where TGL_TRANSAKSI=DATEVALUE('
      + QuotedStr(FormatDateTime(ShortDateFormat, cmb_harian.Date))
      + ')) as pemasukan FROM tbl_pengeluaran where tbl_pengeluaran.TANGGAL_TRANSAKSI=' + QuotedStr(cmb_harian.Text));}
     SQL.Add('SELECT sum (tbl_pengeluaran.NOMINAL) as pengeluaran_bukan,(SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where TGL_TRANSAKSI=DATEVALUE('
      + QuotedStr(FormatDateTime(ShortDateFormat, cmb_harian.Date))
      + ')and PAYMENT="CASH") as pemasukancash,(SELECT sum(TOTAL_BAYAR) FROM tbl_transaksi where TGL_TRANSAKSI=DATEVALUE('
      + QuotedStr(FormatDateTime(ShortDateFormat, cmb_harian.Date))
      + ')and PAYMENT="EDC") as pemasukanedckotor,(SELECT sum(TOTAL_BERSIH) FROM tbl_transaksi where TGL_TRANSAKSI=DATEVALUE('
      + QuotedStr(FormatDateTime(ShortDateFormat, cmb_harian.Date))
      + ')and PAYMENT="EDC") as pemasukanedcbersih,(SELECT sum(NOMINAL) FROM tbl_pengeluaran where TANGGAL_TRANSAKSI=DATEVALUE('
      + QuotedStr(FormatDateTime(ShortDateFormat, cmb_harian.Date))
      +') AND TAG="Y") as pengeluaran_edc_crew FROM tbl_pengeluaran where tbl_pengeluaran.TANGGAL_TRANSAKSI=' + QuotedStr(cmb_harian.Text) + ' AND TAG="T"');
      Open;
      if frm_koneksi.qr_transaksi.RecordCount <> 0 then
      begin
        with frm_lap_summary do
        begin
          lbl_rep_menampilkan.Caption :=
              'Laporan Summary Tanggal "' + cmb_harian.Text+'"';
           exp_cash.Expression := 'pemasukancash';
            exp_edc_kotor.Expression := 'pemasukanedckotor';
            exp_saldo_brankas.Expression:='50000000-pengeluaran_edc_crew-pengeluaran_bukan';
            exp_crew_edc.Expression:= 'pengeluaran_edc_crew';
            exp_edc_bersih.Expression := 'pemasukanedcbersih';
            exp_keluar.Expression := 'pengeluaran_bukan';
            exp_uang_cash.Expression := 'pemasukancash-pengeluaran_edc_crew-pengeluaran_bukan';
            exp_bersihbanget.Expression := 'pemasukancash+pemasukanedcbersih-pengeluaran_bukan';
            if exp_bersihbanget.Caption = 'Rp' then
            Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...',
              'Data Kosong', MB_ICONWARNING)
          else
            qrep_summary.Preview;
        end;
      end
      else
      begin
        Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...',
          'Data Kosong', MB_ICONWARNING);
        sembunyi;
        kosong;
      end;
    end;
end;

procedure Tfrm_lap_summary_berdasarkan.btn_keluarClick(Sender: TObject);
begin
  sembunyi;
  kosong;
  Close;
end;                                                           

end.
