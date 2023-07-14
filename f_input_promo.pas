unit f_input_promo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sSpeedButton, StdCtrls, sEdit, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sMemo, sComboBox, sLabel, sGroupBox,
  ExtCtrls, sPanel, sCheckBox, sRadioButton;

type
  Tfrm_input_promo = class(TForm)
    sPanel1: TsPanel;
    gbox: TsGroupBox;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    lbl_urut: TsLabel;
    sLabel4: TsLabel;
    lbl_promo: TsLabel;
    sLabel5: TsLabel;
    edt_detailpromo: TsMemo;
    tgl_promo: TsDateEdit;
    edt_namapromo: TsEdit;
    sPanel2: TsPanel;
    sGroupBox2: TsGroupBox;
    btn_batal: TsSpeedButton;
    btn_simpbar: TsSpeedButton;
    chk_status: TsCheckBox;
    sLabel2: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    edt_max: TsEdit;
    sLabel9: TsLabel;
    cmb_kategori: TsComboBox;
    edt_hargapr: TsEdit;
    sGroupBox10: TsGroupBox;
    rd_nonprom: TsRadioButton;
    rd_prom: TsRadioButton;
    sLabel10: TsLabel;
    edt_bicrew: TsEdit;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    edt_min: TsEdit;
    sLabel13: TsLabel;
    procedure edt_hargaprKeyPress(Sender: TObject; var Key: Char);
    procedure edt_hargaprKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_hargaprExit(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure btn_simpbarClick(Sender: TObject);
    procedure edt_namapromoChange(Sender: TObject);
    procedure edt_maxKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edt_maxExit(Sender: TObject);
    procedure cmb_kategoriKeyPress(Sender: TObject; var Key: Char);
    procedure edt_bicrewExit(Sender: TObject);
    procedure edt_bicrewKeyPress(Sender: TObject; var Key: Char);
    procedure edt_bicrewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rd_nonpromClick(Sender: TObject);
    procedure rd_promClick(Sender: TObject);
    procedure cmb_kategoriClick(Sender: TObject);
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
  frm_input_promo: Tfrm_input_promo;
  kebenaran:Boolean;
implementation

uses f_koneksi, f_login, StrUtils, f_menu_utama, f_lihat_promo, ADODB;

{$R *.dfm}

{ Tfrm_input_promo }

procedure Tfrm_input_promo.cek;
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

procedure Tfrm_input_promo.edt_log;
begin
 frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Edit Promo *'+lbl_promo.Caption+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_input_promo.kosong;
begin
  edt_namapromo.Clear;
  rd_nonprom.Checked:=true;
  rd_prom.Checked:=false;
  edt_min.Text:='0';
  edt_bicrew.Text:='0';
  edt_hargapr.Text:='0';
  cmb_kategori.ItemIndex:=-1;
//  cmb_kategori.Text:='-- Pilih Ketegori --';
  cmb_kategori.Clear;
  with frm_koneksi.qr_kategori do
    begin
        Active:=false;
        SQL.Clear;
        SQL.Text:='SELECT * FROM tbl_kategori_paket ORDER BY NAMA_KATEGORI ASC';
        Active:=true;
        First;
          while not Eof do
            begin
              cmb_kategori.Items.Add(frm_koneksi.qr_kategori.fieldbyname('NAMA_KATEGORI').AsString);
              Next;
            end;
    end;
  edt_max.Text:='0';
  tgl_promo.Date:=Date;
  edt_detailpromo.Clear;
  chk_status.Checked:=false;
//  urutkanc;
end;

procedure Tfrm_input_promo.mrefr_log;
begin
  with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_input_promo.mrefresh;
begin
  with frm_koneksi.qr_promo do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_promo ORDER BY URUT DESC';
      Active := True;
    end;
end;

procedure Tfrm_input_promo.perbarui;
var nominalta,status,paramxx,rp_nominal,jenisss,nominalta2,paramxx2,rp_nominal2:String;
begin
frm_koneksi.putus;
nominalta:=StringReplace(edt_hargapr.Text,',','',[rfReplaceAll,rfIgnoreCase]); ;
paramxx := AnsiReplaceStr(nominalta,'.','');
rp_nominal := 'Rp'+rupiah(paramxx)+',00';


nominalta2:=StringReplace(edt_bicrew.Text,',','',[rfReplaceAll,rfIgnoreCase]); ;
paramxx2 := AnsiReplaceStr(nominalta2,'.','');
rp_nominal2 := 'Rp'+rupiah(paramxx2)+',00';

  if chk_status.Checked=true then
    status:='Aktif'
  else
    status:='Tidak Aktif';

  if rd_nonprom.Checked=true then
    jenisss:='Non Promo'
  else
    jenisss:='Promo';
  with frm_koneksi.qr_promo do
  begin
      close;
      SQL.Clear;
      SQL.Text := 'UPDATE `tbl_promo` SET ' +
                  '`TANGGAL`='+QuotedStr(DateToStr(tgl_promo.Date))+','+
                  '`NAMA_PROMO`='+QuotedStr(edt_namapromo.Text)+','+
                  '`DETAIL_PROMO`='+QuotedStr(edt_detailpromo.Text)+','+
                  '`HARGA_PROMO`='+QuotedStr(nominalta)+','+
                  '`KECREW`='+QuotedStr(nominalta2)+','+
                  '`JENIS`='+QuotedStr(jenisss)+','+
                  '`RP_HARGA`='+QuotedStr(rp_nominal)+','+
                  '`RP_CREW`='+QuotedStr(rp_nominal2)+','+
                  '`KATEGORI`='+QuotedStr(cmb_kategori.Text)+','+
                  '`JUMLAH_ORANG`='+QuotedStr(edt_max.Text)+','+
                  '`MIN_ORANG`='+QuotedStr(edt_min.Text)+','+
                  '`OLEH`='+QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
                  '`STATUS`='+QuotedStr(status)+
                  'WHERE `KODE_PROMO`=' +QuotedStr(lbl_promo.Caption);
      ExecSQL;
      mrefresh;
  end;
end;

function Tfrm_input_promo.rupiah(sNilai: string): string;
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

procedure Tfrm_input_promo.simp_log;
begin
frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Input Promo *'+lbl_promo.Caption+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_input_promo.simpanx;
var jenisss,status,nominalnya,paramxx,rp_nominal,nominalnya2,paramxx2,rp_nominal2:String;
begin
   frm_koneksi.putus;
   nominalnya:=StringReplace(edt_hargapr.Text,',','',[rfReplaceAll,rfIgnoreCase]); ;
   //nominal rp
   paramxx := AnsiReplaceStr(nominalnya,'.','');
   rp_nominal := 'Rp'+rupiah(paramxx)+',00';

   nominalnya2:=StringReplace(edt_bicrew.Text,',','',[rfReplaceAll,rfIgnoreCase]); ;
   //nominal rp
   paramxx2 := AnsiReplaceStr(nominalnya2,'.','');
   rp_nominal2 := 'Rp'+rupiah(paramxx2)+',00';

   if chk_status.Checked=true then
    status:='Aktif'
   else
    status:='Tidak Aktif';

   if rd_nonprom.Checked=true then
    jenisss:='Non Promo'
  else
    jenisss:='Promo';

with frm_koneksi.qr_promo do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_promo(MIN_ORANG,JENIS,KECREW,RP_CREW,KATEGORI,JUMLAH_ORANG,KODE_PROMO,NAMA_PROMO,DETAIL_PROMO,HARGA_PROMO,RP_HARGA,STATUS,TANGGAL,OLEH) VALUES('+
      QuotedStr(edt_min.Text)+','+
      QuotedStr(jenisss)+','+
      QuotedStr(nominalnya2)+','+
      QuotedStr(rp_nominal2)+','+
      QuotedStr(cmb_kategori.Text)+','+
      QuotedStr(edt_max.Text)+','+
      QuotedStr(lbl_promo.Caption)+','+
      QuotedStr(edt_namapromo.Text)+','+
      QuotedStr(edt_detailpromo.Text)+','+
      QuotedStr(nominalnya)+','+
      QuotedStr(rp_nominal)+','+
      QuotedStr(status)+','+
      QuotedStr(DateToStr(tgl_promo.Date))+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+')';
      ExecSQL;
      mrefresh;
  end;
end;

procedure Tfrm_input_promo.urutkanc;
var
  akhir: integer;
  kode:String;
begin
 with frm_koneksi.qr_promo do
   begin
    if RecordCount <> 0 then
      begin
        First;
        akhir := FieldValues['URUT'];
        inc(akhir);
        if Length(FieldValues['URUT']) = 1 then
          begin
            kode := ('PR-000000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 2 then
          begin
            kode := ('PR-00000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 3 then
          begin
            kode := ('PR-0000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 4 then
          begin
            kode := ('PR-000' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 5 then
          begin
            kode := ('PR-00' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 6 then
          begin
            kode := ('PR-0' + IntToStr(akhir));
          end
        else if Length(FieldValues['URUT']) = 7 then
          begin
            kode := ('PR-' + IntToStr(akhir));
          end;
      end
    else if (RecordCount = 0) then
      begin
        kode := ('PR-0000001');
//        kode := ('tes tesss');
      end;
  end;
      if kebenaran=false then
        begin

        end
      else if kebenaran=true then
        begin
          lbl_promo.Caption:=kode;
          lbl_urut.Caption:=kode;
        end;
end;

procedure Tfrm_input_promo.edt_hargaprKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in['0'..'9',#9,#8]) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_input_promo.edt_hargaprKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sRupiah: string;
  iRupiah: Currency;

begin
  //ribuan --> currency ( menyesuaikan setting windows )
  sRupiah := edt_hargapr.Text;
  sRupiah := StringReplace(sRupiah,',','',[rfReplaceAll,rfIgnoreCase]); // hilangkan char koma , pemisah //ribuan selain IDR
  sRupiah := StringReplace(sRupiah,'.','',[rfReplaceAll,rfIgnoreCase]); //remove char titik .    pemisah //ribuan IDR
 iRupiah := StrToCurrDef(sRupiah,0); // convert srupiah ke currency

  //currency --> format ribuan
  edt_hargapr.Text := FormatCurr('#,###',iRupiah);
  edt_hargapr.SelStart := length(edt_hargapr.text);
end;

procedure Tfrm_input_promo.edt_hargaprExit(Sender: TObject);
begin

  if (edt_hargapr.Text='') or(edt_hargapr.Text=' ') then
  begin
    edt_hargapr.Text:='0';
  end
end;

procedure Tfrm_input_promo.btn_batalClick(Sender: TObject);
begin
  kosong;
  mrefresh;
  close;
  with frm_lihat_promo do
    begin
      baref;
      ManualDock(frm_utama.pnl_utama);
      WindowState := wsMaximized;
      Show;
    end
end;

procedure Tfrm_input_promo.btn_simpbarClick(Sender: TObject);
begin
if (btn_simpbar.Caption='&Simpan') then
Begin
  if (cmb_kategori.Text='-- Pilih Ketegori --')or(edt_namapromo.Text='')or (edt_detailpromo.Text='') or(edt_hargapr.Text='')then
    begin
      Application.MessageBox('Field Belum Lengkap!','Peringatan',MB_ICONWARNING);
    end
  else
    begin
      simp_log;
      simpanx;
      Application.MessageBox('Data Promo Telah Tersimpan','Informasi',MB_ICONINFORMATION);
      kosong;
      cmb_kategori.SetFocus;
      btn_simpbar.Enabled:=false;
      mrefresh;
      urutkanc;
    end;
End
else
begin
  if (cmb_kategori.Text='-- Pilih Ketegori --')or(edt_namapromo.Text='')or (edt_detailpromo.Text='') or(edt_hargapr.Text='')then
    begin
      Application.MessageBox('Field Belum Lengkap!','Peringatan',MB_ICONWARNING);
    end
  else
    begin
      perbarui;
      edt_log;
      Application.MessageBox('Data Promo Telah Diperbaharui','Informasi',MB_ICONINFORMATION);
      kosong;
      btn_simpbar.Enabled:=false;
      frm_lihat_promo.kosong;
      frm_input_promo.Close;
      with frm_lihat_promo do
        begin
          ManualDock(frm_utama.pnl_utama);
          WindowState := wsMaximized;
          Show;
        end
    end;
end;
end;

procedure Tfrm_input_promo.edt_namapromoChange(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_promo.edt_maxKeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9',#9,#8]) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_input_promo.FormShow(Sender: TObject);
begin
      cek;
      cmb_kategori.SetFocus;
//      kosong;
end;

procedure Tfrm_input_promo.edt_maxExit(Sender: TObject);
begin
if (edt_max.Text='') or(edt_max.Text=' ') then
  begin
    edt_max.Text:='0';
  end
end;

procedure Tfrm_input_promo.cmb_kategoriKeyPress(Sender: TObject;
  var Key: Char);
begin
if not(key=#27) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_input_promo.edt_bicrewExit(Sender: TObject);
begin

  if (edt_bicrew.Text='') or(edt_bicrew.Text=' ') then
  begin
    edt_bicrew.Text:='0';
  end
end;

procedure Tfrm_input_promo.edt_bicrewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in['0'..'9',#9,#8]) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_input_promo.edt_bicrewKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sRupiah: string;
  iRupiah: Currency;

begin
  //ribuan --> currency ( menyesuaikan setting windows )
  sRupiah := edt_bicrew.Text;
  sRupiah := StringReplace(sRupiah,',','',[rfReplaceAll,rfIgnoreCase]); // hilangkan char koma , pemisah //ribuan selain IDR
  sRupiah := StringReplace(sRupiah,'.','',[rfReplaceAll,rfIgnoreCase]); //remove char titik .    pemisah //ribuan IDR
 iRupiah := StrToCurrDef(sRupiah,0); // convert srupiah ke currency

  //currency --> format ribuan
  edt_bicrew.Text := FormatCurr('#,###',iRupiah);
  edt_bicrew.SelStart := length(edt_bicrew.text);
end;

procedure Tfrm_input_promo.rd_nonpromClick(Sender: TObject);
begin
  if rd_prom.Checked=true then
    begin
      rd_prom.Checked:=true;
      rd_nonprom.Checked:=false;
    end;
end;

procedure Tfrm_input_promo.rd_promClick(Sender: TObject);
begin
  if rd_nonprom.Checked=true then
    begin
      rd_nonprom.Checked:=true;
      rd_prom.Checked:=false;
    end;
end;

procedure Tfrm_input_promo.cmb_kategoriClick(Sender: TObject);
begin
  edt_namapromo.SetFocus;
end;

end.

