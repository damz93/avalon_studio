unit f_lap_pemasukan_periode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  sComboBox, sLabel, Buttons, sSpeedButton, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lap_pemasukan_periode = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    btn_keluar: TsSpeedButton;
    btn_tampil: TsSpeedButton;
    sPanel2: TsPanel;
    sGroupBox2: TsGroupBox;
    gbox_periode: TsGroupBox;
    sLabel1: TsLabel;
    cmb_periode: TsComboBox;
    cmb_bulanan: TsComboBox;
    cmb_harian: TsDateEdit;
    cmb_tahunan: TsComboBox;
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
  frm_lap_pemasukan_periode: Tfrm_lap_pemasukan_periode;

implementation

uses f_koneksi, f_lap_pemasukan, f_login;

{$R *.dfm}

{ Tfrm_lap_pemasukan_berdasarkan }

procedure Tfrm_lap_pemasukan_periode.kosong;
begin
  btn_tampil.Enabled:=false;
  cmb_periode.ItemIndex:=-1;
  cmb_tahunan.ItemIndex:=-1;
  cmb_bulanan.ItemIndex:=-1;
end;

procedure Tfrm_lap_pemasukan_periode.sembunyi;
begin
  cmb_tahunan.Visible:=false;
  cmb_bulanan.Visible:=false;
  cmb_harian.Visible:=false;
end;

procedure Tfrm_lap_pemasukan_periode.cmb_periodeClick(Sender: TObject);
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

procedure Tfrm_lap_pemasukan_periode.cmb_tahunanClick(Sender: TObject);
begin
  cmb_tahunan.Style:=csDropDownList;
  btn_tampil.Enabled:=true;
end;

procedure Tfrm_lap_pemasukan_periode.cmb_bulananClick(Sender: TObject);
begin
  cmb_bulanan.Style:=csDropDownList;
  btn_tampil.Enabled:=true;
end;

procedure Tfrm_lap_pemasukan_periode.btn_tampilClick(Sender: TObject);
begin
with frm_koneksi.qr_transaksi do
  begin
  if cmb_periode.ItemIndex=0 then
    begin

     if(frm_login.edit_user.Text='nanu')or(frm_login.edit_user.Text='NANU')or(frm_login.cmb_level.Text='Owner')or(frm_login.cmb_level.Text='DAMZ') then
     begin
      if (cmb_tahunan.ItemIndex<>-1) then
        begin
//          MessageBox(Application.Handle, PChar('Periode: '+cmb_periode.Text+', Tahun: '+cmb_tahunan.Text+', Bulan: '+cmb_bulanan.Text+', Hari: '+cmb_harian.Text+', Kategori: '+cmb_jenis.text+' '+hasil1+' '+hasil2 ), PChar('Informasi'),mb_iconinformation+MB_OK);
          SQL.Clear;
          SQL.Add('SELECT * FROM tbl_transaksi WHERE year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+' ORDER BY `ID` ASC');
          Open;
          if frm_koneksi.qr_transaksi.RecordCount<>0 then
            begin
              frm_lap_pemasukan.lbl_rep_menampilkan.Caption:='Laporan Pemasukan berdasarkan Periode Tahun "'+cmb_tahunan.Text+'"';
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
     else
     begin
      Application.MessageBox('AKSES TIDAK DIIZINKAN.', 'Kesalahan', MB_ICONINFORMATION);
     end


    end
  else if cmb_periode.ItemIndex=1 then
    begin
     if(frm_login.edit_user.Text='nanu')or(frm_login.edit_user.Text='NANU')or(frm_login.cmb_level.Text='Owner')or(frm_login.cmb_level.Text='DAMZ') then
     begin
      if (cmb_tahunan.ItemIndex<>-1) and (cmb_bulanan.ItemIndex<>-1) then
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM tbl_transaksi WHERE month(`TGL_TRANSAKSI`)='+QuotedStr(cmb_bulanan.Text)+' and year(`TGL_TRANSAKSI`)='+QuotedStr(cmb_tahunan.Text)+'ORDER BY `ID` ASC');
          Open;
          if frm_koneksi.qr_transaksi.RecordCount<>0 then
            begin
              frm_lap_pemasukan.lbl_rep_menampilkan.Caption:='Laporan Pemasukan berdasarkan Periode Bulan "'+cmb_bulanan.Text+'" Tahun "'+cmb_tahunan.Text+'"';
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
     else
     begin
      Application.MessageBox('AKSES TIDAK DIIZINKAN.', 'Kesalahan', MB_ICONINFORMATION);
     end
    end
  else if cmb_periode.ItemIndex=2 then
    begin
        SQL.Clear;
        SQL.Add('SELECT * FROM tbl_transaksi WHERE `TGL_TRANSAKSI`=DATEVALUE('+QuotedStr(FormatDateTime(ShortDateFormat,cmb_harian.Date))+') ORDER BY `ID` ASC');
        Open;
        if frm_koneksi.qr_transaksi.RecordCount<>0 then
          begin
            frm_lap_pemasukan.lbl_rep_menampilkan.Caption:='Laporan Pemasukan berdasarkan Periode Tanggal "'+cmb_harian.Text+'"';
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

procedure Tfrm_lap_pemasukan_periode.btn_keluarClick(Sender: TObject);
begin
  sembunyi;
  kosong;
  close;
end;

procedure Tfrm_lap_pemasukan_periode.cmb_jenisKeyPress(Sender: TObject;
  var Key: Char);
begin
if not(key=#27) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_lap_pemasukan_periode.tampilkanlain;
begin

end;

end.
