unit UPrintRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, jpeg;

type
  TFrmPrintRomaneio = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel5: TQRLabel;
    QRImage2: TQRImage;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrintRomaneio: TFrmPrintRomaneio;

implementation
Uses URomaneioEntrega;

{$R *.dfm}

end.
