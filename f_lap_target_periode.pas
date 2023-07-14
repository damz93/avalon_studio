unit f_lap_target_periode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  sComboBox, sLabel, Buttons, sSpeedButton, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lap_target_periode = class(TForm)
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
    procedure cmb_bulananClick(Sender: TObject);
    procedure btn_keluarClick(Sender: TObject);
    procedure btn_tampilClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kosong;
    procedure sembunyi;
    procedure tampilkanlain;
  end;

var
  frm_lap_target_periode: Tfrm_lap_target_periode;

implementation

uses f_koneksi, f_lap_pemasukan, f_lap_target;

{$R *.dfm}

{ Tfrm_lap_target_periode }

procedure Tfrm_lap_target_periode.kosong;
begin
  btn_tampil.Enabled:=false;
  cmb_periode.ItemIndex:=-1;
  cmb_bulanan.ItemIndex:=-1;
  cmb_tahunan.ItemIndex:=-1;
end;

procedure Tfrm_lap_target_periode.sembunyi;
begin
  cmb_bulanan.Visible:=false;
  cmb_harian.Visible:=false;
  cmb_tahunan.Visible:=false;
end;

procedure Tfrm_lap_target_periode.tampilkanlain;
begin

end;

procedure Tfrm_lap_target_periode.cmb_periodeClick(Sender: TObject);
begin
cmb_periode.Style:=csDropDownList;
  sembunyi;
  if cmb_periode.ItemIndex<>-1 then
    begin
      if cmb_periode.ItemIndex=0 then
        begin
          cmb_bulanan.Visible:=true;
          cmb_tahunan.Visible:=true;
        end
      else if cmb_periode.ItemIndex=1 then
        begin
          cmb_harian.Visible:=true;
          cmb_harian.date:=date;
        end
    end;

  btn_tampil.Enabled:=true;
  tampilkanlain;
end;

procedure Tfrm_lap_target_periode.cmb_bulananClick(Sender: TObject);
begin
cmb_bulanan.Style:=csDropDownList;
  btn_tampil.Enabled:=true;
end;

procedure Tfrm_lap_target_periode.btn_keluarClick(Sender: TObject);
begin
sembunyi;
  kosong;
  close;
end;

procedure Tfrm_lap_target_periode.btn_tampilClick(Sender: TObject);
begin
with frm_koneksi.qr_transaksi do
  begin
  if cmb_periode.ItemIndex = 0 then
    begin
      if (cmb_tahunan.ItemIndex <> -1) and (cmb_bulanan.ItemIndex <> -1) then
      begin
        SQL.Clear;
        SQL.Add(
          'SELECT SUM(TOTAL_BERSIH) AS SUM_TOTAL,SUM_TOTAL/30000 AS DIAMOND FROM tbl_transaksi WHERE YEAR(TGL_TRANSAKSI)='+QuotedStr(cmb_tahunan.Text) + ' and month(TGL_TRANSAKSI)='+QuotedStr(cmb_bulanan.Text));
        Open;
        if frm_koneksi.qr_transaksi.RecordCount <> 0 then
        begin
          with frm_lap_target do
          begin
            lbl_rep_menampilkan.Caption :=
              'Bulan "' + cmb_bulanan.Text + '" Tahun "' + cmb_tahunan.Text + '"';
//            exp_bersihbanget.Expression := 'SUM_TOTAL';
//            exp_diamond.Expression := 'SUM_TOTAL/30000';
            exp_diamond.Expression := 'DIAMOND';
            qrep_target.Preview;
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
  end
  else if cmb_periode.ItemIndex=1 then
    begin
        SQL.Clear;
        SQL.Add('SELECT SUM(TOTAL_BERSIH) AS SUM_TOTAL,SUM_TOTAL/30000 AS DIAMOND FROM tbl_transaksi WHERE `TGL_TRANSAKSI`=DATEVALUE('+QuotedStr(FormatDateTime(ShortDateFormat,cmb_harian.Date))+')');
        Open;
        if frm_koneksi.qr_transaksi.RecordCount <> 0 then
        begin
          with frm_lap_target do
          begin
            lbl_rep_menampilkan.Caption :='Tanggal ' + cmb_harian.Text;
//            exp_bersihbanget.Expression := 'SUM_TOTAL';
//            exp_diamond.Expression := 'SUM_TOTAL/30000';
            exp_diamond.Expression := 'DIAMOND';
            qrep_target.Preview;
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
end;

end.
