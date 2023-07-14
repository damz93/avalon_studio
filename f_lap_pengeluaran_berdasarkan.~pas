unit f_lap_pengeluaran_berdasarkan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sComboBox, sLabel, sGroupBox, Buttons, sSpeedButton,
  ExtCtrls, sPanel, Mask, sMaskEdit, sCustomComboEdit, sTooledit;

type
  Tfrm_lap_pengeluaran_berdasarkan = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    btn_keluar: TsSpeedButton;
    sPanel2: TsPanel;
    rdg_berdasarkan_kl: TsRadioGroup;
    sGroupBox2: TsGroupBox;
    sGroupBox3: TsGroupBox;
    lbl_berdasark: TsLabel;
    cmb_berdasar: TsComboBox;
    tgl_awal: TsDateEdit;
    tgl_akhir: TsDateEdit;
    lbl_sampai: TsLabel;
    gbox_periode: TsGroupBox;
    cmb_periode: TsComboBox;
    sGroupBox4: TsGroupBox;
    btn_tampil: TsSpeedButton;
    cmb_tahunan: TsComboBox;
    cmb_bulanan: TsComboBox;
    cmb_harian: TsDateEdit;
    procedure btn_keluarClick(Sender: TObject);
    procedure cmb_berdasarClick(Sender: TObject);
    procedure rdg_berdasarkan_klClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_tampilClick(Sender: TObject);
    procedure cmb_periodeClick(Sender: TObject);
    procedure tgl_awalClick(Sender: TObject);
    procedure tgl_akhirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kosong;
    procedure sembunyi;
    procedure sembunyi_periode;
  end;

var
  frm_lap_pengeluaran_berdasarkan: Tfrm_lap_pengeluaran_berdasarkan;

implementation

uses f_koneksi, f_lap_pengeluaran, DateUtils, ADODB;

{$R *.dfm}

{ Tfrm_lap_pengeluaran_berdasarkan }

procedure Tfrm_lap_pengeluaran_berdasarkan.kosong;
begin
  rdg_berdasarkan_kl.ItemIndex:=-1;
  cmb_berdasar.ItemIndex := -1;
  cmb_periode.ItemIndex:=-1;
  btn_tampil.Enabled:=false;
end;

procedure Tfrm_lap_pengeluaran_berdasarkan.btn_keluarClick(
  Sender: TObject);
begin
  sembunyi;
  kosong;
  close;
end;


procedure Tfrm_lap_pengeluaran_berdasarkan.cmb_berdasarClick(
  Sender: TObject);
begin
  cmb_berdasar.Style:=csDropDownList;
  btn_tampil.Enabled:=true;
end;

procedure Tfrm_lap_pengeluaran_berdasarkan.rdg_berdasarkan_klClick(
  Sender: TObject);
  var nil1,a:integer;
begin
  sembunyi;
  sembunyi_periode;
  if rdg_berdasarkan_kl.ItemIndex=0 then
  begin
    tgl_awal.Visible:=true;
    lbl_sampai.Visible:=true;
    tgl_akhir.Visible:=true;
    tgl_awal.Date:=Date-1;
    tgl_akhir.Date:=Date;
    btn_tampil.Enabled:=true;
  end
  else if rdg_berdasarkan_kl.ItemIndex=3 then
  begin
    cmb_berdasar.Visible:=true;
    cmb_berdasar.Clear;
    btn_tampil.Enabled:=false;
    cmb_berdasar.Enabled:=true;
    cmb_berdasar.Text:='-- Kategori --';
     with frm_koneksi.qr_pengeluaran do
          begin
            sql.Clear;
            sql.Add('SELECT DISTINCT `KEPERLUAN` FROM tbl_pengeluaran ORDER BY `KEPERLUAN` ASC');
            Open;
            nil1 := RecordCount;
            First;
              for a:=1 to nil1 do
                begin
                  cmb_berdasar.Items.Add(FieldValues['KEPERLUAN']);
                  next;
                end;
          end;
  end
  else if rdg_berdasarkan_kl.ItemIndex=2 then
  begin
    cmb_berdasar.Visible:=true;
    cmb_berdasar.Clear;
    btn_tampil.Enabled:=false;
    cmb_berdasar.Enabled:=true;
    cmb_berdasar.Text:='-- Kategori --';
     with frm_koneksi.qr_pengeluaran do
          begin
            sql.Clear;
            sql.Add('SELECT DISTINCT `OLEH` FROM tbl_pengeluaran ORDER BY `OLEH` ASC');
            Open;
            nil1 := RecordCount;
            First;
              for a:=1 to nil1 do
                begin
                  cmb_berdasar.Items.Add(FieldValues['OLEH']);
                  next;
                end;
          end;
  end
  else if rdg_berdasarkan_kl.ItemIndex=1 then
  begin
    gbox_periode.Visible:=true;
    cmb_periode.Clear;
    btn_tampil.Enabled:=false;
    cmb_periode.Text:='-- Periode --';
    cmb_periode.Items.add('Tahunan');
    cmb_periode.Items.add('Bulanan');
    cmb_periode.Items.add('Harian');
  end;
end;

procedure Tfrm_lap_pengeluaran_berdasarkan.sembunyi;
begin
  cmb_berdasar.Visible:=false;
  lbl_berdasark.Visible:=false;
  lbl_sampai.Visible:=false;
  tgl_awal.Visible:=false;
  tgl_akhir.Visible:=false;
  gbox_periode.Visible:=false;
end;

procedure Tfrm_lap_pengeluaran_berdasarkan.FormShow(Sender: TObject);
begin
  sembunyi;
  kosong;
end;

procedure Tfrm_lap_pengeluaran_berdasarkan.btn_tampilClick(
  Sender: TObject);
begin
  with frm_koneksi.qr_pengeluaran do
  begin
    if (rdg_berdasarkan_kl.ItemIndex = -1) then
      begin
        Application.MessageBox('Maaf, Pilih kategori yang akan ditampilkan','Informasi',MB_ICONINFORMATION);
      end
    else if rdg_berdasarkan_kl.ItemIndex = 0 then
      begin
        if ((DaysBetween(tgl_awal.Date,tgl_akhir.Date))=0) and ((MonthsBetween(tgl_awal.Date,tgl_akhir.Date))=0)
        and ((YearsBetween(tgl_awal.Date,tgl_akhir.Date))=0) then
        begin
          frm_lap_pengeluaran.lbl_rep_menampilkan.Caption:='Laporan Pengeluaran Tgl '+tgl_awal.Text;
        end
        else
        begin
          frm_lap_pengeluaran.lbl_rep_menampilkan.Caption:='Laporan Pengeluaran dari tgl '+Datetostr(tgl_awal.Date)+' sampai tgl '+DateToStr(tgl_akhir.Date);
        end;
        SQL.Clear;
        SQL.Add('SELECT * FROM tbl_pengeluaran WHERE (`TANGGAL_TRANSAKSI`) BETWEEN DATEVALUE('+QuotedStr(FormatDateTime(ShortDateFormat, tgl_awal.date))+') AND DATEVALUE('+QuotedStr(FormatDateTime(ShortDateFormat,tgl_akhir.date))+') ORDER BY `URUT` ASC');
        Open;
        if frm_koneksi.qr_pengeluaran.RecordCount<>0 then
        begin
          frm_lap_pengeluaran.qrep_pengeluaran.Preview;
        end
        else
        begin
          Application.MessageBox('Maaf, Report tidak bisa ditampilkan, Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
          sembunyi;
          kosong;
        end
      end
    else if rdg_berdasarkan_kl.ItemIndex = 3 then
      begin
        if cmb_berdasar.ItemIndex<>-1 then
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM tbl_pengeluaran WHERE `KEPERLUAN`='+QuotedStr(cmb_berdasar.Text)+' ORDER BY `KEPERLUAN` ASC');
          Open;
          if frm_koneksi.qr_pengeluaran.RecordCount<>0 then
          begin
            frm_lap_pengeluaran.lbl_rep_menampilkan.Caption:='Laporan Pengeluaran berdasarkan Keperluan "'+cmb_berdasar.Text+'"';
            frm_lap_pengeluaran.qrep_pengeluaran.Preview;
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
          cmb_berdasar.SetFocus;
          Application.MessageBox('Maaf, Silahkan pilih kategori terlebih dahulu', 'Kesalahan', MB_ICONINFORMATION);
        end
      end
    else if rdg_berdasarkan_kl.ItemIndex = 2 then
      begin
        if cmb_berdasar.ItemIndex<>-1 then
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM tbl_pengeluaran WHERE `OLEH`='+QuotedStr(cmb_berdasar.Text)+' ORDER BY `OLEH` ASC');
          Open;
          if frm_koneksi.qr_pengeluaran.RecordCount<>0 then
          begin
            frm_lap_pengeluaran.lbl_rep_menampilkan.Caption:='Laporan Pengeluaran berdasarkan Oleh "'+cmb_berdasar.Text+'"';
            frm_lap_pengeluaran.qrep_pengeluaran.Preview;
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
          cmb_berdasar.SetFocus;
          Application.MessageBox('Maaf, Silahkan pilih kategori terlebih dahulu', 'Kesalahan', MB_ICONINFORMATION);
        end
      end
    else if rdg_berdasarkan_kl.ItemIndex = 1 then
      begin
        if cmb_periode.ItemIndex=0 then
        begin
          if (cmb_tahunan.ItemIndex<>-1) then
            begin
              SQL.Clear;
              SQL.Add('SELECT * FROM tbl_pengeluaran WHERE year(`TANGGAL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `URUT` ASC');
              Open;
              if frm_koneksi.qr_pengeluaran.RecordCount<>0 then
                begin
                  frm_lap_pengeluaran.lbl_rep_menampilkan.Caption:='Laporan Pengeluaran berdasarkan Periode Tahun "'+cmb_tahunan.Text+'"';
                  frm_lap_pengeluaran.qrep_pengeluaran.Preview;
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
              Application.MessageBox('Maaf, Silahkan pilih Tahun terlebih dahulu', 'Kesalahan', MB_ICONINFORMATION);
            end
        end
        else if cmb_periode.ItemIndex=1 then
        begin
          if (cmb_tahunan.ItemIndex<>-1) and (cmb_bulanan.ItemIndex<>-1) then
            begin
              SQL.Clear;
              SQL.Add('SELECT * FROM tbl_pengeluaran WHERE month(`TANGGAL_TRANSAKSI`)='+QuotedStr(cmb_bulanan.Text)+' and year(`TANGGAL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+'ORDER BY `URUT` ASC');
              Open;
              if frm_koneksi.qr_pengeluaran.RecordCount<>0 then
                begin
                  frm_lap_pengeluaran.lbl_rep_menampilkan.Caption:='Laporan Pengeluaran berdasarkan Periode Bulan "'+cmb_bulanan.Text+'" Tahun "'+cmb_tahunan.Text+'"';
                  frm_lap_pengeluaran.qrep_pengeluaran.Preview;
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
          SQL.Clear;
          SQL.Add('SELECT * FROM tbl_pengeluaran WHERE `TANGGAL_TRANSAKSI`='+QuotedStr(FormatDateTime(ShortDateFormat,cmb_harian.Date))+' ORDER BY `URUT` ASC');
          Open;
          if frm_koneksi.qr_pengeluaran.RecordCount<>0 then
            begin
              frm_lap_pengeluaran.lbl_rep_menampilkan.Caption:='Laporan Pengeluaran berdasarkan Periode Tanggal "'+cmb_harian.Text+'"';
              frm_lap_pengeluaran.qrep_pengeluaran.Preview;
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
             cmb_periode.SetFocus;
            Application.MessageBox('Maaf, Silahkan pilih periode terlebih dahulu', 'Kesalahan', MB_ICONINFORMATION);
          end
      end;
    end;
end;


procedure Tfrm_lap_pengeluaran_berdasarkan.cmb_periodeClick(
  Sender: TObject);
begin
  cmb_periode.Style:=csDropDownList;
  sembunyi_periode;
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

end;

procedure Tfrm_lap_pengeluaran_berdasarkan.sembunyi_periode;
begin
  cmb_tahunan.Visible:=false;
  cmb_bulanan.Visible:=false;
  cmb_harian.Visible:=false;
end;
procedure Tfrm_lap_pengeluaran_berdasarkan.tgl_awalClick(Sender: TObject);
begin
  btn_tampil.Enabled:=true;
end;

procedure Tfrm_lap_pengeluaran_berdasarkan.tgl_akhirClick(Sender: TObject);
begin
  btn_tampil.Enabled:=true;
end;

end.
