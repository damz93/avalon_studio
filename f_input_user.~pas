unit f_input_user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sSpeedButton, StdCtrls, sComboBox, sEdit, sLabel,
  sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_input_user = class(TForm)
    sPanel1: TsPanel;
    gbox: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    edit_username: TsEdit;
    edit_namlengk: TsEdit;
    edit_passw: TsEdit;
    cmb_level: TsComboBox;
    sPanel2: TsPanel;
    sGroupBox2: TsGroupBox;
    btn_batal: TsSpeedButton;
    btn_simpbar: TsSpeedButton;
    edit_phone: TsEdit;
    sLabel5: TsLabel;
    procedure btn_batalClick(Sender: TObject);
    procedure edit_phoneKeyPress(Sender: TObject; var Key: Char);
    procedure edit_usernameExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_simpbarClick(Sender: TObject);
    procedure edit_namlengkChange(Sender: TObject);
    procedure edit_passwChange(Sender: TObject);
    procedure edit_phoneChange(Sender: TObject);
    procedure cmb_levelClick(Sender: TObject);
    procedure edit_usernameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure mrefresh;
    procedure kosong;
    procedure perbarui;
    procedure simpanx;
    procedure simp_log;
    procedure edt_log;
    procedure mrefr_log;
    procedure cek;
  end;

var
  frm_input_user: Tfrm_input_user;
  kebenaran:Boolean;
implementation
 uses f_koneksi, f_lihat_user, ADODB, DB, f_menu_utama, f_login;

{$R *.dfm}

procedure Tfrm_input_user.btn_batalClick(Sender: TObject);
begin
  kosong;
  frm_lihat_user.baref;
//  f_input_jadwal.mrefrkel;
  mrefresh;
  close;
end;

procedure Tfrm_input_user.cek;
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

procedure Tfrm_input_user.kosong;
begin
  mrefresh;
  edit_username.Clear;
  edit_namlengk.Clear;
  edit_passw.Clear;
  edit_phone.Clear;
  cmb_level.Text:='-- Pilih Level --';
  cmb_level.ItemIndex:=-1;
end;

procedure Tfrm_input_user.mrefresh;
begin
  with frm_koneksi.qr_user do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_user WHERE MUNCUL=TRUE';
      Active := True;
    end;
end;

procedure Tfrm_input_user.perbarui;
begin
frm_koneksi.koneksi;
with frm_koneksi.qr_user do
  begin
      close;
      SQL.Clear;
      SQL.Text := ' UPDATE tbl_user SET ' +
                  ' [NAMA_LENGKAP] = '+QuotedStr(edit_namlengk.Text)+','+
                  ' [PASSWORD] = '+QuotedStr(edit_passw.Text)+','+
                  ' [PHONE] = '+QuotedStr(edit_phone.Text)+','+
                  ' [LEVEL] = '+QuotedStr(cmb_level.Text)+
                  ' WHERE [USERNAME] = ' +QuotedStr(edit_username.Text);
      ExecSQL;
      frm_input_user.mrefresh;
  end;
end;

procedure Tfrm_input_user.edit_phoneKeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9',#9,#8]) then
  begin
  Key:=#0;
  Beep;
  end;
end;

procedure Tfrm_input_user.simpanx;
begin
frm_koneksi.putus;
with frm_koneksi.qr_user do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_user([USERNAME],[NAMA_LENGKAP],[PASSWORD],[PHONE],[MUNCUL],[LEVEL]) VALUES('+
      QuotedStr(edit_username.Text)+','+
      QuotedStr(edit_namlengk.Text)+','+
      QuotedStr(edit_passw.Text)+','+
      QuotedStr(edit_phone.Text)+','+
      'true,'+
      QuotedStr(cmb_level.Text)+')';
      ExecSQL;
      mrefresh;
  end;
end;

procedure Tfrm_input_user.edit_usernameExit(Sender: TObject);
begin
if kebenaran=True then
 begin
  with frm_koneksi.qr_user do
  begin
    sql.Clear;
    sql.Add('SELECT * FROM tbl_user WHERE MUNCUL=TRUE');
    OPEN;
    if Locate('USERNAME',edit_username.Text,[])then
    begin
      Application.MessageBox('Username sudah ada','Peringatan',MB_ICONWARNING);
      edit_username.SetFocus;
    end
    else if (edit_username.Text='') or (edit_username.Text=' ') then
    begin
      Application.MessageBox('Isi Username terlebih dahulu','Peringatan',MB_ICONWARNING);
      edit_username.SetFocus;
    end
    else
    begin
      btn_simpbar.Enabled:=true;
      mrefresh;
    end;
  end;
 end
end;

procedure Tfrm_input_user.FormShow(Sender: TObject);
begin
  cek;
end;

procedure Tfrm_input_user.btn_simpbarClick(Sender: TObject);
begin
if (btn_simpbar.Caption='&Simpan') then
Begin
  if (edit_username.Text='')or (edit_namlengk.Text='')or (edit_passw.Text='')or (edit_passw.Text='')or
  (edit_phone.Text='')or (cmb_level.Text='-- Pilih Level --') then
    begin
      Application.MessageBox('Field Belum Lengkap!','Peringatan',MB_ICONWARNING);
    end
  else
    begin
      simpanx;
      simp_log;
      Application.MessageBox('Data User telah tersimpan','Informasi',MB_ICONINFORMATION);
      kosong;
      edit_username.SetFocus;
      btn_simpbar.Enabled:=false;
    end;
End
else
begin
  if (edit_namlengk.Text='')or (edit_passw.Text='')or (edit_passw.Text='')or
  (edit_phone.Text='')or (cmb_level.Text='-- Pilih Level --') then
  begin
      Application.MessageBox('Field Belum Lengkap!','Peringatan',MB_ICONWARNING);
    end
  else
    begin
      frm_input_user.perbarui;
      edt_log;
      Application.MessageBox('Data User telah diperbarui','Informasi',MB_ICONINFORMATION);
      kosong;
      btn_simpbar.Enabled:=false;
      frm_lihat_user.kosong;
      frm_input_user.Close;
    end;
end;
end;

procedure Tfrm_input_user.edit_namlengkChange(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_user.edit_passwChange(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_user.edit_phoneChange(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_user.cmb_levelClick(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_user.edit_usernameChange(Sender: TObject);
begin
  btn_simpbar.Enabled:=true;
end;

procedure Tfrm_input_user.mrefr_log;
begin
with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_input_user.simp_log;
begin
frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Input Username *'+edit_username.Text+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_input_user.edt_log;
begin
    frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Edit Username *'+edit_username.Text+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

end.
