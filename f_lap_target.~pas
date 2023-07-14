unit f_lap_target;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, grimgctrl, jpeg, QuickRpt, ExtCtrls;

type
  Tfrm_lap_target = class(TForm)
    qrep_target: TQuickRep;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRHRule2: TQRHRule;
    lbl_rep_menampilkan: TQRLabel;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    exp_diamond: TQRExpr;
    QRLabel1: TQRLabel;
    QRImage2: TQRImage;
    procedure qrep_targetAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lap_target: Tfrm_lap_target;

implementation

uses f_lap_target_periode;

{$R *.dfm}

procedure Tfrm_lap_target.qrep_targetAfterPreview(Sender: TObject);
begin
  frm_lap_target_periode.kosong;
  frm_lap_target_periode.sembunyi;
end;

end.
