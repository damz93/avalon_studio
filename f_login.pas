unit f_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, sEdit, sComboBox, sLabel, sGroupBox,
  sSpeedButton, jpeg, ExtCtrls, sPanel, StdCtrls, Buttons;

type
  Tfrm_login = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    xbtn_login: TSpeedButton;
    xbtn_batal: TSpeedButton;
    xcmb_level: TComboBox;
    xedit_user: TEdit;
    xedit_pass: TEdit;
    sPanel1: TsPanel;
    Image1: TImage;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    cmb_level: TsComboBox;
    edit_user: TsEdit;
    edit_pass: TsEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    lbl_nama_yg_login: TsLabel;
    sPanel4: TsPanel;
    btn_login: TsSpeedButton;
    btn_batal: TsSpeedButton;
    btn_keluar: TsSpeedButton;
    procedure btn_keluarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edit_userChange(Sender: TObject);
    procedure edit_passKeyPress(Sender: TObject; var Key: Char);
    procedure btn_loginClick(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure cmb_levelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edit_passChange(Sender: TObject);
    procedure edit_userExit(Sender: TObject);
    procedure edit_userKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure awal;
    procedure simp_log;
    procedure untukadmin;
    procedure boska;
    procedure aktif;
    procedure mrefr_log;
    procedure taktif;
  end;

var
  frm_login : Tfrm_login;
    level,passnya,levelta:string;


implementation
uses f_menu_utama, f_koneksi, f_input_transaksi, f_lihat_transaksi,
  f_lihat_pengeluaran, f_input_user;

{$R *.dfm}

procedure Tfrm_login.awal;
begin
 // taktif;
  cmb_level.Text:='--- Pilih Level ---';
  edit_user.Clear;
  edit_pass.clear;
  taktif;
  cmb_level.ItemIndex:=-1;

//  cmb_level.SetFocus;
end;

procedure Tfrm_login.btn_keluarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_login.FormCreate(Sender: TObject);
begin                              
  awal;
  cmb_level.Style:=csDropDownList;
end;

procedure Tfrm_login.taktif;
begin
  edit_user.Enabled:=false;
  edit_pass.Enabled:=false;
  btn_batal.Enabled:=false;
  btn_login.Enabled:=false;
end;

procedure Tfrm_login.edit_userChange(Sender: TObject);
begin
  //btn_login.Enabled:=true;
//  btn_batal.Enabled:=true;
aktif;
end;

procedure Tfrm_login.edit_passKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    btn_loginClick(btn_login);
  end;
end;

procedure Tfrm_login.btn_loginClick(Sender: TObject);
begin
  frm_utama.Timer2.Enabled:=false;
//  if cmb_level.Text='Admin' then
  if levelta = 'Admin' then
  begin
    if (edit_user.Text='') or (edit_pass.Text='') then
    begin
//      Application.MessageBox('Isi Username maupun Password anda','Peringatan',MB_ICONWARNING);
      MessageBox(Application.Handle, PChar('Isi Username maupun Password anda'), PChar('Peringatan'), MB_ICONWARNING);
    end
    else
      begin
       with f_koneksi.frm_koneksi.qr_user do
         begin
           sql.Clear;
           SQL.Add('SELECT * FROM tbl_user where level = "Admin"');
           open;
            if Locate('username',edit_user.Text,[])then
            begin
              passnya:=FieldValues['password'];
               //TARUH DI SINI DESKRIPSI NYA
               {   tampung := '';
                s := FieldValues['password'];
                for i:=1 to Length(s)do
                begin
                  Asc := Ord(s[i])+45;
                  tampung := tampung +(char(asc));
                end;
                  passnya:=tampung;        }
              if (passnya=edit_pass.Text)then
              begin
                  with frm_utama do
                    begin
                      Timer2.Enabled:=false;
                      Enabled:=true;
                      MessageBox(Application.Handle, PChar('Selamat Datang, Admin['+edit_user.Text+']'), PChar('Informasi'),mb_iconinformation+MB_OK);
                      simp_log;
                      frm_login.Close;
                      lbl_nama.Caption:=levelta+' ['+edit_user.Text+']';
                      lbl_nama.Visible:=true;
                      menuAktif;
                    end;
               end
              else
              begin
//                 MessageBox(Application.Handle, ('Kombinasi Username dan Password tidak sesuai'),('Kesalahan'),MB_ICONERROR);
                 MessageBox(Application.Handle, PChar('Kombinasi Username dan Password tidak sesuai'), PChar('Kesalahan'), MB_ICONERROR);
                 frm_utama.Timer2.Enabled:=true;
                 btn_login.Enabled:=false;
              end;
            end
            else
            begin
//                Application.MessageBox('Username anda belum terdaftar','Kesalahan',MB_ICONERROR);
                MessageBox(Application.Handle, PChar('Username anda belum terdaftar'), PChar('Kesalahan'), MB_ICONERROR);
                frm_utama.Timer2.Enabled:=true;
                btn_login.Enabled:=false;
            end;
         end;
       end;
  end
//  else if (cmb_level.Text='Petugas') then
  else if (levelta='Owner') then
  begin
    if (edit_user.Text='') or (edit_pass.Text='') then
    begin
      MessageBox(Application.Handle, PChar('Isi Username maupun Password anda'), PChar('Peringatan'), MB_ICONWARNING);
    end
    else
       with f_koneksi.frm_koneksi.qr_user do
         begin
           sql.Clear;
           SQL.Add('SELECT * FROM tbl_user where level = "Owner"');
           open;
            if Locate('username',edit_user.Text,[])then
            begin
             passnya:=FieldValues['password'];
              if (passnya=edit_pass.Text) then
              begin
              with frm_utama do
                begin
                 Timer2.Enabled:=false;
                 Enabled:=true;
                 MessageBox(Application.Handle, PChar('Selamat Datang,Owner['+edit_user.Text+']'), PChar('Informasi'),mb_iconinformation+MB_OK);
                 simp_log;
                 frm_login.Close;
                 lbl_nama.Caption:=levelta+' ['+edit_user.Text+']';
                 lbl_nama.Visible:=true;
                 menuAktif;
//                 Mn_user.Enabled:=false;
                end
              end
              else
              begin
                 MessageBox(Application.Handle, PChar('Kombinasi Username dan Password tidak sesuai'), PChar('Kesalahan'), MB_ICONERROR);
                 frm_utama.Timer2.Enabled:=true;
                 btn_login.Enabled:=false;
              end;
            end
            else
            begin
                MessageBox(Application.Handle, PChar('Username anda belum terdaftar'), PChar('Kesalahan'), MB_ICONERROR);
                frm_utama.Timer2.Enabled:=true;
                btn_login.Enabled:=false;
            end;
         end;
  end
  else if (levelta='DAMZ') then
  begin
    if (edit_user.Text='') or (edit_pass.Text='') then
    begin
      Application.MessageBox('Isi Username maupun Password anda','Peringatan',MB_ICONWARNING);
    end
    else
       with f_koneksi.frm_koneksi.qr_user do
         begin
           sql.Clear;
           SQL.Add('SELECT * FROM tbl_user where level = "DAMZ"');
           open;
            if Locate('username',edit_user.Text,[])then
            begin
             passnya:=FieldValues['password'];
              if (passnya=edit_pass.Text) then
              begin
              with frm_utama do
                begin
                 Timer2.Enabled:=false;
                 Enabled:=true;
                 MessageBox(Application.Handle, PChar('Selamat Datang, DAMZ['+edit_user.Text+']'), PChar('Informasi'),mb_iconinformation+MB_OK);
                 simp_log;
                 frm_login.Close;
                 lbl_nama.Caption:=levelta+' ['+edit_user.Text+']';
                 lbl_nama.Visible:=true;
                 menuAktif;
//                 Mn_user.Enabled:=false;
                end
              end
              else
              begin
                 MessageBox(Application.Handle, PChar('Kombinasi Username dan Password tidak sesuai'), PChar('Kesalahan'), MB_ICONERROR);
                 frm_utama.Timer2.Enabled:=true;
                 btn_login.Enabled:=false;
              end;
            end
            else
            begin
                MessageBox(Application.Handle, PChar('Username anda belum terdaftar'), PChar('Kesalahan'), MB_ICONERROR);
                frm_utama.Timer2.Enabled:=true;
                btn_login.Enabled:=false;
            end;
         end;
  end
end;

procedure Tfrm_login.btn_batalClick(Sender: TObject);
begin
  awal;
  cmb_level.SetFocus;
end;

procedure Tfrm_login.cmb_levelClick(Sender: TObject);
begin
  aktif;
  edit_user.SetFocus;
  if cmb_level.Text='Admin' then
  begin
    levelta:='Admin';
    untukadmin;
  end
  else if cmb_level.Text='Owner' then
  begin
    levelta:='Owner';
    boska;
  end
  else if cmb_level.Text='DAMZ' then
  begin
    boska;
    levelta:='DAMZ';
  end;
  cmb_level.Style:=csDropDownList;
end;

procedure Tfrm_login.aktif;
begin
  edit_user.Enabled:=true;
  edit_pass.Enabled:=true;
  btn_batal.Enabled:=true;
  btn_login.Enabled:=true;
end;

procedure Tfrm_login.FormShow(Sender: TObject);
begin
cmb_level.SetFocus;
end;

procedure Tfrm_login.edit_passChange(Sender: TObject);
begin
aktif;
end;

procedure Tfrm_login.edit_userExit(Sender: TObject);
begin
lbl_nama_yg_login.Caption:=edit_user.Text;
end;

procedure Tfrm_login.boska;
begin
  frm_lihat_transaksi.btn_hapus.visible:=true;
  frm_utama.Mn_user.visible:=true;
  frm_lihat_pengeluaran.btn_edit.Visible:=true;
  frm_lihat_pengeluaran.btn_hapus.Visible:=true;
  frm_input_user.edit_username.Enabled:=true;
  frm_input_user.cmb_level.Enabled:=true;
end;

procedure Tfrm_login.untukadmin;
begin
//  frm_lihat_transaksi.btn_hapus.visible:=false;
  frm_utama.Mn_user.visible:=false;
  frm_lihat_pengeluaran.btn_edit.Visible:=false;
  frm_lihat_pengeluaran.btn_hapus.Visible:=false;
  frm_input_user.edit_username.Enabled:=false;
  frm_input_user.cmb_level.Enabled:=false;
end;

procedure Tfrm_login.mrefr_log;
begin
with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log';
      Active := True;
    end;
end;

procedure Tfrm_login.simp_log;
begin
frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(edit_user.Text)+','+
      QuotedStr('Login......')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_login.edit_userKeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then
  begin
    edit_pass.SetFocus;
  end;
end;

end.
