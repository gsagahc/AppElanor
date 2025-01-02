unit URelatorioDeCustos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr, DB, DBClient,
  IBCustomDataSet, IBQuery;

type
  TFrmRelCustos = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel7: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRLabel8: TQRLabel;
    QRLabelPeriodo: TQRLabel;
    QRLTotal: TQRLabel;
  private
    Total:Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCustos: TFrmRelCustos;

implementation
Uses UPrincipal, UMensagens, Math, USelecionarDespesas;

{$R *.dfm}

end.
