unit f_lihat_log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, sSpeedButton, StdCtrls, sEdit, sComboBox, Grids,
  DBGrids, sLabel, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lihat_log = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    lbl_keperluan: TsLabel;
    DBGrid1: TDBGrid;
    cmb_cari: TsComboBox;
    edit_cari: TsEdit;
    pnl_bawah: TsPanel;
    btn_tutup: TsSpeedButton;
    btn_batal: TsSpeedButton;
    DataSource1: TDataSource;
    procedure btn_batalClick(Sender: TObject);
    procedure btn_tutupClick(Sender: TObject);
    procedure cmb_cariClick(Sender: TObject);
    procedure edit_cariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kosong;

  end;

var
  frm_lihat_log: Tfrm_lihat_log;

implementation

uses f_koneksi;

{$R *.dfm}



procedure Tfrm_lihat_log.btn_batalClick(Sender: TObject);
begin
  kosong;
end;

procedure Tfrm_lihat_log.btn_tutupClick(Sender: TObject);
begin
  kosong;
  close;
end;

procedure Tfrm_lihat_log.kosong;
begin
  btn_batal.Enabled:=false;
  cmb_cari.Text:='-- Tampilkan Berdasarkan --';
  cmb_cari.ItemIndex:=-1;
  edit_cari.Clear;
  edit_cari.Enabled:=false;
    with frm_koneksi.qr_log do
    begin
      Active := False;
      SQL.Clear;
      SQL.Text :='SELECT * FROM tbl_log ORDER BY `ID` DESC';
      Active := True;
    end;
end;

procedure Tfrm_lihat_log.cmb_cariClick(Sender: TObject);
begin
  edit_cari.Enabled:=true;
  edit_cari.SetFocus;
  btn_batal.Enabled:=true;
end;

procedure Tfrm_lihat_log.edit_cariChange(Sender: TObject);
begin
with frm_koneksi.qr_log do
  begin
    if cmb_cari.Text = 'Kode' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_log where ID like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Waktu' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_log where WAKTU like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Aktivitas' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_log where AKTIVITAS like "%' +edit_cari.Text + '%"');
      Open;
    end
    else if cmb_cari.Text = 'Oleh' then
    begin
      sql.Clear;
      sql.Add('select * from tbl_log where USER like "%' +edit_cari.Text + '%"');
      Open;
    end
  end
end;

procedure Tfrm_lihat_log.FormShow(Sender: TObject);
begin
  kosong;
end;

procedure Tfrm_lihat_log.DBGrid1CellClick(Column: TColumn);
begin
  If frm_koneksi.qr_log.RecordCount <> 0 then
  begin
    btn_batal.Enabled := true;
  end
  else
  begin
    Application.MessageBox('Tidak ada data dalam database...', 'Data Kosong',      MB_ICONWARNING);
  end;
end;

end.
