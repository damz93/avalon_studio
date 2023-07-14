unit f_lap_tip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, grimgctrl, jpeg, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_lap_tip = class(TForm)
    qrep_tip: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    PageFooterBand1: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel12: TQRLabel;
    TitleBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr5: TQRExpr;
    QRHRule1: TQRHRule;
    lbl_rep_menampilkan: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    EXP_SUM: TQRExpr;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lap_tip: Tfrm_lap_tip;

implementation

uses f_koneksi;

{$R *.dfm}

end.
