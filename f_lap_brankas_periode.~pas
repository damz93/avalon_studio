unit f_lap_brankas_periode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  sComboBox, sLabel, Buttons, sSpeedButton, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lap_brankas_berdasarkan = class(TForm)
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
    procedure btn_keluarClick(Sender: TObject);
    procedure cmb_periodeClick(Sender: TObject);
    procedure cmb_tahunanClick(Sender: TObject);
    procedure cmb_bulananClick(Sender: TObject);
    procedure btn_tampilClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kosong;
    procedure sembunyi;
  end;

var
  frm_lap_brankas_berdasarkan: Tfrm_lap_brankas_berdasarkan;

implementation

uses f_koneksi, f_lap_brankas;

{$R *.dfm}

{ Tfrm_lap_brankas_berdasarkan }

procedure Tfrm_lap_brankas_berdasarkan.kosong;
begin
cmb_periode.ItemIndex := -1;
  btn_tampil.Enabled := false;
end;

procedure Tfrm_lap_brankas_berdasarkan.sembunyi;
begin
  cmb_tahunan.Visible := false;
  cmb_bulanan.Visible := false;
  cmb_harian.Visible := false;
end;

procedure Tfrm_lap_brankas_berdasarkan.btn_keluarClick(Sender: TObject);
begin
    sembunyi;
  kosong;
  Close;
end;

procedure Tfrm_lap_brankas_berdasarkan.cmb_periodeClick(Sender: TObject);
begin
cmb_periode.Style := csDropDownList;
  sembunyi;
  if cmb_periode.ItemIndex <> -1 then
    if cmb_periode.ItemIndex = 0 then
    begin
       cmb_tahunan.Visible := true;
      cmb_bulanan.Visible := true;
    end;

  btn_tampil.Enabled := true;
end;

procedure Tfrm_lap_brankas_berdasarkan.cmb_tahunanClick(Sender: TObject);
begin
cmb_tahunan.Style := csDropDownList;
  btn_tampil.Enabled := true;
end;

procedure Tfrm_lap_brankas_berdasarkan.cmb_bulananClick(Sender: TObject);
begin
 cmb_bulanan.Style := csDropDownList;
  btn_tampil.Enabled := true;
end;

procedure Tfrm_lap_brankas_berdasarkan.btn_tampilClick(Sender: TObject);
begin
 with frm_koneksi.qr_transaksi do
    if cmb_periode.ItemIndex = 0 then
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
          with frm_lap_brankas do
          begin
            lbl_rep_menampilkan.Caption := 'Laporan Brankas Bulan "' + cmb_bulanan.Text + '" Tahun "' + cmb_tahunan.Text + '"';

          //  exp_edc_kotor.Expression := 'pemasukanedckotor';
            exp_crew_edc.Expression:= 'pengeluaran_edc_crew';
            exp_keluar.Expression := 'pengeluaran_bukan';
            exp_sisa.Expression := '50000000-pengeluaran_edc_crew-pengeluaran_bukan';
              qrep_brankas.Preview;
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
end;

end.
