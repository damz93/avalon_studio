unit f_lap_pemasukan_berdasarkan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  sComboBox, sLabel, sGroupBox, Buttons, sSpeedButton, ExtCtrls, sPanel,
  sCheckBox;

type
  Tfrm_lap_pemasukan_berdasarkan = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    btn_keluar: TsSpeedButton;
    sPanel2: TsPanel;
    sGroupBox2: TsGroupBox;
    gbox_periode: TsGroupBox;
    cmb_periode: TsComboBox;
    cmb_tahunan: TsComboBox;
    cmb_bulanan: TsComboBox;
    cmb_harian: TsDateEdit;
    btn_tampil: TsSpeedButton;
    sLabel1: TsLabel;
    cmb_jenis: TsComboBox;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    ck_pr: TsCheckBox;
    ck_np: TsCheckBox;
    procedure cmb_periodeClick(Sender: TObject);
    procedure cmb_tahunanClick(Sender: TObject);
    procedure cmb_bulananClick(Sender: TObject);
    procedure btn_tampilClick(Sender: TObject);
    procedure btn_keluarClick(Sender: TObject);
    procedure cmb_jenisKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kosong;
    procedure sembunyi;

    procedure tampilkanlain;
  end;

var
  frm_lap_pemasukan_berdasarkan: Tfrm_lap_pemasukan_berdasarkan;

implementation

uses f_koneksi, f_lap_pemasukan;

{$R *.dfm}

{ Tfrm_lap_pemasukan_berdasarkan }

procedure Tfrm_lap_pemasukan_berdasarkan.kosong;
begin
  cmb_jenis.Clear;
  btn_tampil.Enabled:=false;
  cmb_jenis.ItemIndex:=-1;
  sembunyi;
  
  ck_pr.Checked:=true;
  ck_np.Checked:=false;
  cmb_periode.ItemIndex:=-1;
  cmb_periode.ItemIndex:=-1;
  cmb_tahunan.ItemIndex:=-1;
  cmb_bulanan.ItemIndex:=-1;
  with frm_koneksi.qr_kategori do
    begin
        Active:=false;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_kategori_paket';
        Active:=true;
        First;
          while not Eof do
            begin
              cmb_jenis.Items.Add(frm_koneksi.qr_kategori.fieldbyname('NAMA_KATEGORI').AsString);
              Next;
            end;
    end;
end;

procedure Tfrm_lap_pemasukan_berdasarkan.sembunyi;
begin
  cmb_tahunan.Visible:=false;
  cmb_bulanan.Visible:=false;
  cmb_harian.Visible:=false;
  sLabel3.Visible:=false;
  sLabel2.Visible:=false;
  cmb_jenis.Visible:=false;
  ck_pr.Visible:=false;
  ck_np.Visible:=false;
end;

procedure Tfrm_lap_pemasukan_berdasarkan.cmb_periodeClick(Sender: TObject);
begin
  cmb_periode.Style:=csDropDownList;
  sembunyi;
  if cmb_periode.ItemIndex<>-1 then
    begin
      if cmb_periode.ItemIndex=0 then
        begin
          cmb_tahunan.Visible:=true;
        end
      else if cmb_periode.ItemIndex=1 then
        begin
          cmb_tahunan.Visible:=true;
          cmb_bulanan.Visible:=true;
        end
      else if cmb_periode.ItemIndex=2 then
        begin
          cmb_harian.Visible:=true;
          cmb_harian.date:=date;
        end
    end;

  btn_tampil.Enabled:=true;
  tampilkanlain;
end;

procedure Tfrm_lap_pemasukan_berdasarkan.cmb_tahunanClick(Sender: TObject);
begin
  cmb_tahunan.Style:=csDropDownList;
  btn_tampil.Enabled:=true;
end;

procedure Tfrm_lap_pemasukan_berdasarkan.cmb_bulananClick(Sender: TObject);
begin
  cmb_bulanan.Style:=csDropDownList;
  btn_tampil.Enabled:=true;
end;

procedure Tfrm_lap_pemasukan_berdasarkan.btn_tampilClick(Sender: TObject);
var a:string;
  hasil1,hasil2:string;
begin
  if ck_pr.Checked=true then
    begin
      hasil1:='Promo cek';
    end
  else
    begin
      hasil1:='Promo uncek';
    end;
  if ck_np.Checked=true then
    begin
      hasil2:='NonPromo cek';
    end
  else
    begin
      hasil2:='NonPromo uncek';
    end;
with frm_koneksi.qr_transaksi do
  begin
  if cmb_periode.ItemIndex=0 then
    begin
      if (cmb_tahunan.ItemIndex<>-1) and(cmb_jenis.ItemIndex<>-1) and ((ck_pr.Checked<>false)or(ck_np.Checked<>false)) then
        begin
//          MessageBox(Application.Handle, PChar('Periode: '+cmb_periode.Text+', Tahun: '+cmb_tahunan.Text+', Bulan: '+cmb_bulanan.Text+', Hari: '+cmb_harian.Text+', Kategori: '+cmb_jenis.text+' '+hasil1+' '+hasil2 ), PChar('Informasi'),mb_iconinformation+MB_OK);
          SQL.Clear;
          //SQL.Add('SELECT * FROM tbl_transaksi WHERE year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `ID` ASC');
          if (ck_np.Checked=true) and (ck_pr.Checked=false) then
            begin
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS`="Non Promo") AND year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `ID` ASC');
            end
          else if (ck_pr.Checked=true) and (ck_np.Checked=false) then
            begin
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS`="Promo") AND year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `ID` ASC');
            end
          else if (ck_pr.Checked=true) and (ck_np.Checked=true) then
            begin
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS` IN("Non Promo","Promo")) AND year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `ID` ASC');
            end;
          Open;
          if frm_koneksi.qr_transaksi.RecordCount<>0 then
            begin
              frm_lap_pemasukan.lbl_rep_menampilkan.Caption:='Laporan Pemasukan berdasarkan Periode Tahun "'+cmb_tahunan.Text+'" | Kategori '+cmb_jenis.Text;
              frm_lap_pemasukan.qrep_pemasukan.Preview;
            end
          else
            begin
              Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
              sembunyi;
              kosong;
            end;
        end
      else
        begin
          cmb_tahunan.SetFocus;
          Application.MessageBox('Maaf, Silahkan pilih detail terlebih dahulu', 'Kesalahan', MB_ICONINFORMATION);
        end
    end
  else if cmb_periode.ItemIndex=1 then
    begin
      if (cmb_tahunan.ItemIndex<>-1) and (cmb_bulanan.ItemIndex<>-1) and(cmb_jenis.ItemIndex<>-1) and ((ck_pr.Checked<>false)or(ck_np.Checked<>false)) then
        begin
          SQL.Clear;
          if (ck_np.Checked=true) and (ck_pr.Checked=false) then
            begin
            // SQL.Add('SELECT * FROM tbl_transaksi WHERE month(`TGL_TRANSAKSI`)='+QuotedStr(cmb_bulanan.Text)+' and year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+'ORDER BY `ID` ASC');
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS`="Non Promo") AND MONTH(`TGL_TRANSAKSI`)='+QuotedStr(cmb_bulanan.Text)+'AND year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `ID` ASC');
            end
          else if (ck_pr.Checked=true) and (ck_np.Checked=false) then
            begin
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS`="Promo") AND MONTH(`TGL_TRANSAKSI`)='+QuotedStr(cmb_bulanan.Text)+'AND year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `ID` ASC');
            end
          else if (ck_pr.Checked=true) and (ck_np.Checked=true) then
            begin
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS` IN("Non Promo","Promo")) AND MONTH(`TGL_TRANSAKSI`)='+QuotedStr(cmb_bulanan.Text)+'AND year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `ID` ASC');
            end;
          Open;
          if frm_koneksi.qr_transaksi.RecordCount<>0 then
            begin
              frm_lap_pemasukan.lbl_rep_menampilkan.Caption:='Laporan Pemasukan berdasarkan Periode Bulan "'+cmb_bulanan.Text+'" Tahun "'+cmb_tahunan.Text+'" | Kategori '+cmb_jenis.Text;
              frm_lap_pemasukan.qrep_pemasukan.Preview;
            end
          else
            begin
              Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
              sembunyi;
              kosong;
            end;
        end
      else
        begin
          cmb_bulanan.SetFocus;
          Application.MessageBox('Maaf, Silahkan pilih Tahun dan Bulan terlebih dahulu', 'Kesalahan', MB_ICONINFORMATION);
        end
    end
  else if cmb_periode.ItemIndex=2 then
    begin
    if (cmb_jenis.ItemIndex<>-1) and ((ck_pr.Checked<>false)or(ck_np.Checked<>false)) then
      begin
        SQL.Clear;
//        SQL.Add('SELECT * FROM tbl_transaksi WHERE `TGL_TRANSAKSI`=DATEVALUE('+QuotedStr(FormatDateTime(ShortDateFormat,cmb_harian.Date))+') ORDER BY `ID` ASC');

        if (ck_np.Checked=true) and (ck_pr.Checked=false) then
            begin
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS`="Non Promo") AND `TGL_TRANSAKSI`=DATEVALUE('+QuotedStr(FormatDateTime(ShortDateFormat,cmb_harian.Date))+') ORDER BY `ID` ASC');
            end
          else if (ck_pr.Checked=true) and (ck_np.Checked=false) then
            begin
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS`="Promo") AND `TGL_TRANSAKSI`=DATEVALUE('+QuotedStr(FormatDateTime(ShortDateFormat,cmb_harian.Date))+') ORDER BY `ID` ASC');
            end
          else if (ck_pr.Checked=true) and (ck_np.Checked=true) then
            begin
             SQL.Add('SELECT * from `tbl_transaksi` WHERE `JENIS_PAKET` in(SELECT `NAMA_PROMO` FROM `tbl_promo` WHERE `KATEGORI`="'+cmb_jenis.Text+'" AND `JENIS` IN("Non Promo","Promo")) AND `TGL_TRANSAKSI`=DATEVALUE('+QuotedStr(FormatDateTime(ShortDateFormat,cmb_harian.Date))+') ORDER BY `ID` ASC');
            end;

        Open;
        if frm_koneksi.qr_transaksi.RecordCount<>0 then
          begin
            frm_lap_pemasukan.lbl_rep_menampilkan.Caption:='Laporan Pemasukan berdasarkan Periode Tanggal "'+cmb_harian.Text+'" | Kategori '+cmb_jenis.Text;
            frm_lap_pemasukan.qrep_pemasukan.Preview;
          end
        else
          begin
            Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
            sembunyi;
            kosong;
          end;
      end;
    end;
  end;
end;

procedure Tfrm_lap_pemasukan_berdasarkan.btn_keluarClick(Sender: TObject);
begin
  sembunyi;
  kosong;
  close;
end;

procedure Tfrm_lap_pemasukan_berdasarkan.cmb_jenisKeyPress(Sender: TObject;
  var Key: Char);
begin
if not(key=#27) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_lap_pemasukan_berdasarkan.tampilkanlain;
begin
  sLabel3.Visible:=true;
  sLabel2.Visible:=true;
  cmb_jenis.Visible:=true;
  ck_pr.Visible:=true;
  ck_np.Visible:=true;
end;

end.
