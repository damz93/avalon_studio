unit f_input_tip2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, Grids, DBGrids, StdCtrls, sComboBox,
  sEdit, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_input_tip2 = class(TForm)
    sPanel1: TsPanel;
    gbox: TsGroupBox;
    sLabel1: TsLabel;
    lbl_urut: TsLabel;
    sLabel4: TsLabel;
    lbl_kodee: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    lbl_tgl: TsLabel;
    sLabel3: TsLabel;
    lbl_tgl_sekarang: TsLabel;
    lbl_totalkess: TsLabel;
    lbl_totalkes: TsLabel;
    lbl_metode: TsLabel;
    edt_nominal: TsEdit;
    cmb_kodtransk: TsComboBox;
    edt_oleh: TsEdit;
    sGroupBox1: TsGroupBox;
    btn_tambah: TsSpeedButton;
    sPanel2: TsPanel;
    sGroupBox2: TsGroupBox;
    btn_batal: TsSpeedButton;
    btn_simpbar: TsSpeedButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    sGroupBox3: TsGroupBox;
    btn_hapus: TsSpeedButton;
    procedure edt_nominalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cmb_kodtranskClick(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure btn_simpbarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function rupiah(sNilai : string): string;
    procedure total;
    procedure mrefresh;
    procedure hitot;
    procedure tampil;
    procedure kosong;
    procedure urutkanc;
    procedure perbarui;
    procedure mrefr_log;
    procedure simp_log;
    procedure tampil_cmb;
    procedure edt_log;
    procedure simpandalam;
    procedure simpanluar;
    procedure cek;
    procedure delete_temp;
  end;

var
  frm_input_tip2: Tfrm_input_tip2;
nominal_rp,metode_bayar : string;
    kebenaran:Boolean;
implementation

uses f_koneksi, f_menu_utama, f_login, f_input_pengeluaran, StrUtils;

{$R *.dfm}

{ Tfrm_input_tip2 }

procedure Tfrm_input_tip2.cek;
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

procedure Tfrm_input_tip2.delete_temp;
begin
   with frm_koneksi.qr_tip_temp do
  begin
      SQL.Clear;
      SQL.Text:='DELETE FROM tbl_tip_crew_temp';
      ExecSQL;
  end;
end;

procedure Tfrm_input_tip2.edt_log;
begin
  frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Edit Transaksi *'+lbl_kodee.Caption+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_input_tip2.hitot;
var a:Longint;
param:string;
begin
lbl_totalkes.Caption:='0';
lbl_totalkess.Caption:='Total : Rp0,00';

  If frm_koneksi.qr_tip_temp.RecordCount <> 0 then
  begin
      with frm_koneksi.qr_tip_temp do
        begin
          Active:=false;
          SQL.Clear;
          SQL.Text:='SELECT SUM(NOMINAL) as A FROM tbl_tip_crew_temp';
          Active:=true;
          a:=FieldValues['A'];

        end;
  end
  else
  begin
    a:=0
  end;
        lbl_totalkes.Caption:=IntToStr(a);
        param := AnsiReplaceStr(lbl_totalkes.Caption,'.','');
        lbl_totalkess.Caption:='Total : Rp'+rupiah(param)+',00';


end;

procedure Tfrm_input_tip2.kosong;
begin
   lbl_tgl_sekarang.Caption:=DateToStr(Date);
lbl_tgl.Caption:='-';
cmb_kodtransk.Text:='--- Pilih Kode Transaksi ---';
edt_nominal.Text:='0';
btn_tambah.Enabled:=false;
btn_hapus.Enabled:=false;
btn_simpbar.Enabled:=false;
end;

procedure Tfrm_input_tip2.mrefr_log;
begin
     with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM `tbl_log`';
      Active := True;
    end;
end;

procedure Tfrm_input_tip2.mrefresh;
begin
   with frm_koneksi.qr_tip_temp do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM `tbl_tip_crew_temp` ORDER BY `ID` DESC';
      Active := True;
    end;

    with frm_koneksi.qr_tip do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM `tbl_tip_crew` ORDER BY `ID` DESC';
      Active := True;
    end;
end;


function Tfrm_input_tip2.rupiah(sNilai: string): string;
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
procedure Tfrm_input_tip2.edt_nominalKeyPress(Sender: TObject;
  var Key: Char);
begin
if not(key in['0'..'9',#9,#8]) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure Tfrm_input_tip2.FormShow(Sender: TObject);
begin
 cek;
   tampil_cmb;
   mrefresh;
   edt_oleh.Text:=frm_login.lbl_nama_yg_login.Caption;
end;

procedure Tfrm_input_tip2.cmb_kodtranskClick(Sender: TObject);
begin
 with frm_koneksi.qr_transaksi do
        begin
          Active:=false;
          SQL.Clear;
          SQL.Text:='SELECT * FROM tbl_transaksi WHERE KODE_TRANSAKSI='+QuotedStr(cmb_kodtransk.Text);
          Active:=true;
          nominal_rp:=FieldValues['RP_CREW'];

          lbl_metode.Caption:=FieldValues['PAYMENT'];
//          lbl_metode.Caption:=metode_bayar;

          edt_nominal.Text:=FieldValues['TOTAL_CREW'];
          lbl_tgl.Caption:=FieldValues['TGL_TRANSAKSI'];
        end;
 total;
 btn_simpbar.Enabled:=true;
 btn_hapus.Enabled:=false;
 btn_tambah.Enabled:=true;
end;

procedure Tfrm_input_tip2.btn_batalClick(Sender: TObject);
begin
  kosong;
  mrefresh;
  close;
  //delete_temp;
end;

procedure Tfrm_input_tip2.btn_simpbarClick(Sender: TObject);
var ket,hrg,param,param2 : string;
    dp_,sisa_ : Real;
    total:longint;
begin
  if (btn_simpbar.Caption='&Simpan') then
  Begin
      simp_log;
      simpandalam;
      simpanluar;
      Application.MessageBox('Data Transaksi Telah Tersimpan','Informasi',MB_ICONINFORMATION);
      lbl_totalkess.Caption:='Total : Rp0,00';
      lbl_totalkes.Caption:='Total : Rp0,00';
      kosong;
      mrefresh;
      close;
  end;
end;


procedure Tfrm_input_tip2.perbarui;
begin

end;
procedure Tfrm_input_tip2.simp_log;
begin
   frm_koneksi.putus;
with frm_koneksi.qr_log do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_log([WAKTU],[USER],[AKTIVITAS]) VALUES('+
      QuotedStr(frm_utama.lbl_jam.Caption)+','+
      QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
      QuotedStr('Input TIP *'+lbl_kodee.Caption+'*')+')';
      ExecSQL;
      mrefr_log;
  end;
end;

procedure Tfrm_input_tip2.simpandalam;
begin
  with frm_koneksi.qr_transaksi do
  begin
      close;
      SQL.Clear;
      SQL.Text := ' UPDATE tbl_transaksi SET ' +
                  ' [SUDAH_CREW] = '+QuotedStr('DONE')+
                  ' WHERE [KODE_TRANSAKSI] = ' +QuotedStr(cmb_kodtransk.Text);
      ExecSQL;
  end;
   with frm_koneksi.qr_tip_temp do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_tip_crew_temp(KODE_TIP,KODE_TRANSAKSI,TGL_TRANSAKSI,NOMINAL,RP_NOMINAL) VALUES('+
      QuotedStr(lbl_kodee.Caption)+','+
      QuotedStr(cmb_kodtransk.Text)+','+
      QuotedStr(lbl_tgl.Caption)+','+
      QuotedStr(edt_nominal.Text)+','+
      QuotedStr(nominal_rp)+')';
      ExecSQL;
      mrefresh;
  end;
  tampil_cmb;
end;

procedure Tfrm_input_tip2.simpanluar;
   VAR  akhir: integer;
  kode,tagnya:String;
begin
  frm_input_pengeluaran.mrefresh;
  with frm_koneksi.qr_pengeluaran do
   begin
      if RecordCount <> 0 then
      begin
        First;
        akhir := FieldValues['URUT'];
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
  with frm_koneksi.qr_pengeluaran do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_pengeluaran(KODE_TRANSAKSI,NOMINAL,RP_NOMINAL)'+
      'SELECT KODE_TIP,NOMINAL,RP_NOMINAL FROM tbl_tip_crew_temp';
      ExecSQL;
  end;
  tagnya:='Y';
  with frm_koneksi.qr_pengeluaran do
  begin
      close;
      SQL.Clear;
      SQL.Text := ' UPDATE tbl_pengeluaran SET ' +
                  ' OLEH = '+QuotedStr(frm_login.edit_user.Text)+','+
                  ' KEPERLUAN = '+QuotedStr(edt_oleh.Text)+','+
                  ' KETERANGAN = '+QuotedStr('PENGAMBILAN JATAH CREW')+','+
                  ' TAG = '+QuotedStr(tagnya)+','+
                  ' TANGGAL_TRANSAKSI = '+QuotedStr(lbl_tgl_sekarang.Caption)+','+
                  ' KODE_TRANSAKSI= '+QuotedStr(kode)+
                  ' WHERE KODE_TRANSAKSI = ' +QuotedStr(lbl_kodee.Caption);
      ExecSQL;
  end;
  {with frm_koneksi.qr_pengeluaran do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_pengeluaran(TAG,KODE_TRANSAKSI,NOMINAL,RP_NOMINAL,TANGGAL_TRANSAKSI,KEPERLUAN,KETERANGAN,OLEH) VALUES('+
      QuotedStr('Y')+','+
      QuotedStr(kode)+','+
      QuotedStr(nominalnya)+','+
      QuotedStr(rp_nominal)+','+
      QuotedStr(lbl_tgl_sekarang.Caption)+','+
      QuotedStr(cmb_jenis_keperluan.Text)+','+
      QuotedStr(edt_keterangan.Text)+','+
      QuotedStr(cmb_diajukan.Text)+')';
      ExecSQL;

      ExecSQL;
  end;}

  //SQL.Text:='INSERT INTO tbl_pengeluaran(KODE_TRANSAKSI,NOMINAL,RP_NOMINAL,TANGGAL_TRANSAKSI,KEPERLUAN,KETERANGAN,OLEH) VALUES('+

  with frm_koneksi.qr_tip do
  begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO tbl_tip_crew(KODE_TIP,KODE_TRANSAKSI,NOMINAL,RP_NOMINAL,TGL_TRANSAKSI)'+
      'SELECT KODE_TIP,KODE_TRANSAKSI,NOMINAL,RP_NOMINAL,TGL_TRANSAKSI FROM tbl_tip_crew_temp';
      ExecSQL;
  end;
  frm_koneksi.koneksi;
  with frm_koneksi.qr_tip do
  begin
      close;
      SQL.Clear;
      SQL.Text := ' UPDATE tbl_tip_crew SET ' +
                  ' [TGL_AMBIL] = '+QuotedStr(lbl_tgl_sekarang.Caption)+','+
                  ' [DIINPUT] = '+QuotedStr(frm_login.lbl_nama_yg_login.Caption)+','+
                  ' [OLEH] = '+QuotedStr(edt_oleh.text)+
                  ' WHERE [KODE_TIP] = ' +QuotedStr(lbl_kodee.Caption);
      ExecSQL;
  end;
{
  with frm_koneksi.qr_transaksi do
  begin
      close;
      SQL.Clear;
      SQL.Text := ' UPDATE tbl_transaksi SET ' +
                  ' [SUDAH_CREW] = '+QuotedStr('DONE')+
                  ' WHERE [KODE_TRANSAKSI] = ' +QuotedStr(cmb_kodtransk.Text);
      ExecSQL;
  end;}
  delete_temp;
  mrefresh;

end;

procedure Tfrm_input_tip2.tampil;
   var kod_tran,tgl_tr,nom:string;
begin
with frm_koneksi.qr_tip_temp do
  Begin
    kod_tran := FieldValues['KODE_TRANSAKSI'];
    tgl_tr := FieldValues['TGL_TRANSAKSI'];
    nom := FieldValues['NOMINAL'];

  end;
      cmb_kodtransk.Text:=kod_tran;
      lbl_tgl.Caption:=tgl_tr;
      edt_nominal.Text:=nom;
end;

procedure Tfrm_input_tip2.tampil_cmb;
begin
  with frm_koneksi do
  begin
     qr_transaksi.Active:=false;
     qr_transaksi.SQL.Clear;
     qr_transaksi.SQL.Text:='SELECT distinct(`KODE_TRANSAKSI`),ID FROM tbl_transaksi WHERE payment="EDC" AND SUDAH_CREW="BELUM" AND TOTAL_CREW>499 ORDER BY ID DESC';
     qr_transaksi.Active:=true;
     qr_transaksi.First;
     cmb_kodtransk.Clear;
     cmb_kodtransk.Text:='- Pilih Kode Transaksi -';
          while not qr_transaksi.Eof do
            begin
              cmb_kodtransk.Items.Add(qr_transaksi.fieldbyname('KODE_TRANSAKSI').AsString);
              qr_transaksi.Next;
            end;
   end;
end;

procedure Tfrm_input_tip2.total;
          
var total:longint;
param:string;
begin
   // total:=StrToInt(lbl_hargaa.Caption)*StrToInt(edt_qty.Text);
//    lbl_totall.Caption:=IntToStr(total);
    param := AnsiReplaceStr(IntToStr(total),'.','');
//    lbl_total.Caption := 'Rp'+rupiah(param)+',00';
end;

procedure Tfrm_input_tip2.urutkanc;
  var  akhir: integer;
  kode:String;
begin

 with frm_koneksi.qr_tip do
   begin
      if RecordCount <> 0 then
      begin
        First;
        akhir := FieldValues['ID'];
        inc(akhir);
        if Length(FieldValues['ID']) = 1 then
          begin
            kode := ('TIP-000000' + IntToStr(akhir));
          end
        else if Length(FieldValues['ID']) = 2 then
          begin
            kode := ('TIP-00000' + IntToStr(akhir));
          end
        else if Length(FieldValues['ID']) = 3 then
          begin
            kode := ('TIP-0000' + IntToStr(akhir));
          end
        else if Length(FieldValues['ID']) = 4 then
          begin
            kode := ('TIP-000' + IntToStr(akhir));
          end
        else if Length(FieldValues['ID']) = 5 then
          begin
            kode := ('TIP-00' + IntToStr(akhir));
          end
        else if Length(FieldValues['ID']) = 6 then
          begin
            kode := ('TIP-0' + IntToStr(akhir));
          end
        else if Length(FieldValues['ID']) = 7 then
          begin
            kode := ('TIP-' + IntToStr(akhir));
          end
      end
      else if (RecordCount = 0) then
        begin
        kode := ('TIP-0000001');
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

end.
