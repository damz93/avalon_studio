unit f_input_pengeluaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sSpeedButton, sGroupBox, StdCtrls, sComboBox, sMemo,
  sEdit, sLabel, ExtCtrls, sPanel, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit;

type
  Tfrm_input_pengeluaran = class(TForm)
    sPanel1: TsPanel;
    gbox: TsGroupBox;
    sLabel2: TsLabel;
    sPanel2: TsPanel;
    sGroupBox2: TsGroupBox;
    btn_batal: TsSpeedButton;
    btn_simpbar: TsSpeedButton;
    cmb_jenis_keperluan: TsComboBox;
    sLabel1: TsLabel;
    edt_keterangan: TsMemo;
    sLabel3: TsLabel;
    tgl_keluar: TsDateEdit;
    lbl_urut: TsLabel;
    sLabel4: TsLabel;
    lbl_kodee: TsLabel;
    sLabel5: TsLabel;
    edt_nominal: TsEdit;
    cmb_diajukan: TsComboBox;
    sLabel6: TsLabel;
    tex_tgl: TsLabel;
    procedure btn_batalClick(Sender: TObject);
    procedure btn_simpbarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tgl_keluarChange(Sender: TObject);
    procedure tgl_keluarClick(Sender: TObject);
    procedure cmb_jenis_keperluanChange(Sender: TObject);
    procedure edt_keteranganChange(Sender: TObject);
    procedure edt_nominalKeyPress(Sender: TObject; var Key: Char);
    procedure edt_nominalExit(Sender: TObject);
    procedure edt_nominalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_jenis_keperluanClick(Sender: TObject);
    procedure cmb_jenis_keperluanKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_diajukanKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_diajukanChange(Sender: TObject);
    procedure cmb_diajukanClick(Sender: TObject);
    procedure edt_nominalChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure mrefresh;
    procedure kosong;
    procedure urutkanc;
    procedure perbarui;
    procedure mrefr_log;
    procedure simp_log;
    procedure edt_log;
    procedure simpanx;
    procedure cek;
    function rupiah(sNilai : string): string;
  end;

var
  frm_input_pengeluaran: Tfrm_input_pengeluaran;
  kebenaran:Boolean;

implementation
uses f_koneksi,f_lihat_pengeluaran, f_login, ADODB, DB, f_menu_utama,
  StrUtils, f_lap_pengeluaran, f_lap_keluar;
{$R *.dfm}

{ Tfrm_input_pengeluaran }

procedure Tfrm_input_pengeluaran.mrefresh;
begin
  with frm_koneksi.qr_pengeluaran do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_pengeluaran ORDER BY URUT DESC';
      Active := True;
    end;
end;

procedure Tfrm_input_pengeluaran.btn_batalClick(Sender: TObject);
begin
  kosong;
  mrefresh;
  close;
  with frm_lihat_pengeluaran do
    begin
      baref;
      ManualDock(frm_utama.pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_input_pengeluaran.kosong;
begin
//  urutkanc;
  edt_keterangan.Clear;
  edt_nominal.Text:='0';
  tgl_keluar.Date:=Date;
  tex_tgl.Caption:=DateToStr(Date);
  cmb_diajukan.Text:='-- Diajukan Oleh --';
  cmb_diajukan.ItemIndex:=-1;
  cmb_jenis_keperluan.Text:='-- Diajukan Untuk --';
  cmb_jenis_keperluan.ItemIndex:=-1;
end;

procedure Tfrm_input_pengeluaran.btn_simpbarClick(Sender: TObject);
var kode : string;
begin
kode:=lbl_kodee.Caption;
if (btn_simpbar.Caption='&Simpan') then
Begin
  if (cmb_diajukan.ItemIndex=-1) or(edt_nominal.Text='0')or (edt_keterangan.Text='') or(cmb_jenis_keperluan.ItemIndex=-1)or(cmb_jenis_keperluan.ItemIndex=-1)then
    begin
      Application.MessageBox('Field Belum Lengkap!','Peringatan',MB_ICONWARNING);
    end
  else
    begin
      simp_log;
      simpanx;
      Application.MessageBox('Data Pengeluaran Telah Tersimpan','Informasi',MB_ICONINFORMATION);

      with frm_koneksi.qr_pengeluaran do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM tbl_pengeluaran where KODE_TRANSAKSI='+QuotedStr(kode));
          Open;
      with frm_lap_keluar.qrep_transaksinow do
        begin
//          Print;
          Preview;
        end
      end;
      kosong;
      cmb_diajukan.SetFocus;
      btn_simpbar.Enabled:=false;
     // mrefresh;
     urutkanc;

    end;
End
else
begin
  if (tgl_keluar.Text='  /  /    ') or (edt_keterangan.Text='') or(cmb_jenis_keperluan.Text='-- Pilih Keperluan --')then
    begin
      Application.MessageBox('Field Belum Lengkap!','Peringatan',MB_ICONWARNING);
    end
  else
    begin
      perbarui;
      edt_log;
      Application.MessageBox('Data Pengeluaran Telah Diperbaharui','Informasi',MB_ICONINFORMATION);
      kosong;
      btn_simpbar.Enabled:=false;
      frm_lihat_pengeluaran.kosong;
      frm_input_pengeluaran.Close;
      with frm_lihat_pengeluaran do
        begin
          ManualDock(frm_utama.pnl_utama);
          WindowState := wsMaximized;
          Show;
        end
    end;
end;
end;

procedure Tfrm_input_pengeluaran.simpanx;
var nominalnya:String;
paramxx,rp_nominal:String;
begin
   frm_koneksi.putus;
   nominalnya:=StringReplace(edt_nominal.Text,',','',[rfReplaceAll,rfIgnoreCase]); ;
   //nominal rp
   paramxx := AnsiReplaceStr(nominalnya,'.','');
   rp_nominal := 'Rp'+rupiah(paramxx)+',00';
with frm_koneksi.qr_pengeluaran do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_pengeluaran(KODE_TRANSAKSI,TAG,NOMINAL,RP_NOMINAL,TANGGAL_TRANSAKSI,KEPERLUAN,KETERANGAN,OLEH) VALUES('+
      QuotedStr(lbl_kodee.Caption)+','+
      QuotedStr('T')+','+
      QuotedStr(nominalnya)+','+
      QuotedStr(rp_nominal)+','+
//      QuotedStr(DateToStr(tgl_keluar.Date))+','+
      QuotedStr(tex_tgl.Caption)+','+
      QuotedStr(cmb_jenis_keperluan.Text)+','+
      QuotedStr(edt_keterangan.Text)+','+
//     QuotedStr(frm_login.lbl_nama_yg_login.Caption)+')';
      QuotedStr(cmb_diajukan.Text)+')';
      ExecSQL;
//      mrefresh;
  end;
end;

procedure Tfrm_input_pengeluaran.cek;
begin
  if btn_simpbar.Caption='&Simpan' then
  begin
    kebenaran:=true;
    btn_simpbar.Enabled:=false;
  end
  else
  begin
    kebenaran:=false;
  end;
end;

procedure Tfrm_input_pengeluaran.perbarui;
var nominalta:String;
begin
frm_koneksi.putus;
nominalta:=StringReplace(edt_nominal.Text,',','',[rfReplaceAll,rfIgnoreCase]); ;
with frm_koneksi.qr_pengeluaran do
  begin
      close;
      SQL.Clear;
      SQL.Text := ' UPDATE tbl_pengeluaran SET ' +
                  ' TANGGAL_TRANSAKSI = '+QuotedStr(DateToStr(tgl_keluar.Date))+','+
                  ' KEPERLUAN = '+QuotedStr(cmb_jenis_keperluan.Text)+','+
                  ' NOMINAL = '+QuotedStr(nominalta)+','+
//                  ' OLEH = '+QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
                  ' OLEH = '+QuotedStr(cmb_diajukan.Text)+','+
                  ' KETERANGAN = '+QuotedStr(edt_keterangan.Text)+
                  ' WHERE KODE_TRANSAKSI = ' +QuotedStr(lbl_kodee.Caption);
      ExecSQL;
      mrefresh;
  end;
end;


procedure Tfrm_input_pengeluaran.FormShow(Sender: TObject);
begin
  cek;
//  kosong;
end;

procedure Tfrm_input_pengeluaran.tgl_keluarChange(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_pengeluaran.tgl_keluarClick(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_pengeluaran.cmb_jenis_keperluanChange(
  Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_pengeluaran.edt_keteranganChange(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_pengeluaran.urutkanc;
var
  akhir: integer;
  kode:String;
begin

 with frm_koneksi.qr_pengeluaran do
   begin
      if RecordCount <> 0 then
      begin
        First;
        akhir := FieldValues['URUT'];
    //    akhir := akhir + 1;
        inc(akhir);
        if Length(FieldValues['URUT']) = 1 then
          begin
            kode := ('OUT-0000000000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 2 then
          begin
            kode := ('OUT-000000000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 3 then
          begin
            kode := ('OUT-00000000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 4 then
          begin
            kode := ('OUT-0000000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 5 then
          begin
            kode := ('OUT-000000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 6 then
          begin
            kode := ('OUT-00000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 7 then
          begin
            kode := ('OUT-0000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 8 then
          begin
            kode := ('OUT-000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 9 then
          begin
            kode := ('OUT-00' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 10 then
          begin
            kode := ('OUT-0' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 11 then
          begin
            kode := ('OUT-' + IntToStr(akhir));
          end;
      end
      else if (RecordCount = 0) then
        begin
        kode := ('OUT-0000001');
//        kode := ('tes tesss');
      end;
  end;
      if kebenaran=false then
        begin

        end
      else if kebenaran=true then
        begin
          lbl_kodee.Caption:=kode;
          lbl_urut.Caption:=kode;
        end;
end;
procedure Tfrm_input_pengeluaran.edt_nominalKeyPress(Sender: TObject;
  var Key: Char);
begin
if not(key in['0'..'9',#9,#8]) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_input_pengeluaran.edt_nominalExit(Sender: TObject);
begin
  if (edt_nominal.Text='') or(edt_nominal.Text=' ') then
  begin
    edt_nominal.Text:='1';
  end
end;

procedure Tfrm_input_pengeluaran.edt_nominalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sRupiah: string;
  iRupiah: Currency;

begin
  //ribuan --> currency ( menyesuaikan setting windows )
  sRupiah := edt_nominal.Text;
  sRupiah := StringReplace(sRupiah,',','',[rfReplaceAll,rfIgnoreCase]); // hilangkan char koma , pemisah //ribuan selain IDR
  sRupiah := StringReplace(sRupiah,'.','',[rfReplaceAll,rfIgnoreCase]); //remove char titik .    pemisah //ribuan IDR
 iRupiah := StrToCurrDef(sRupiah,0); // convert srupiah ke currency

  //currency --> format ribuan
  edt_nominal.Text := FormatCurr('#,###',iRupiah);
  edt_nominal.SelStart := length(edt_nominal.text);
end;

procedure Tfrm_input_pengeluaran.cmb_jenis_keperluanClick(Sender: TObject);
begin
  cmb_jenis_keperluan.Style:=csDropDownList;
end;

function Tfrm_input_pengeluaran.rupiah(sNilai: string): string;
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

procedure Tfrm_input_pengeluaran.mrefr_log;
begin
with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_input_pengeluaran.simp_log;
begin
frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Input Pengeluaran *'+lbl_kodee.Caption+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_input_pengeluaran.edt_log;
begin
 frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Edit Pengeluaran *'+lbl_kodee.Caption+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_input_pengeluaran.cmb_jenis_keperluanKeyPress(
  Sender: TObject; var Key: Char);
begin
if not(key=#27) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_input_pengeluaran.cmb_diajukanKeyPress(Sender: TObject;
  var Key: Char);
begin
if not(key=#27) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_input_pengeluaran.cmb_diajukanChange(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_pengeluaran.cmb_diajukanClick(Sender: TObject);
begin
  cmb_diajukan.Style:=csDropDownList;
end;

procedure Tfrm_input_pengeluaran.edt_nominalChange(Sender: TObject);
begin
  if (edt_nominal.Text='') or(edt_nominal.Text=' ') then
    begin
      edt_nominal.Text:='0';
    end;
end;

end.
