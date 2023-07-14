unit f_lap_tip_periode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  sComboBox, sLabel, Buttons, sSpeedButton, sGroupBox, ExtCtrls, sPanel;

type
  Tfrm_lap_tip_periode = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lap_tip_periode: Tfrm_lap_tip_periode;

implementation

{$R *.dfm}

end.
