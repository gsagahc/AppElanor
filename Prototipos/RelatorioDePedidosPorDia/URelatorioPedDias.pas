unit URelatorioPedDias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr,  DB, DBClient, ComCtrls,
  StdCtrls, DBCtrls, IBCustomDataSet, IBQuery;

type
  TFrmRelPedidos = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabelde: TQRLabel;
    QrLabelAte: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QrLabelTotal: TQRLabel;
  private
    { Private declarations }
  public
     Total:Currency;
    { Public declarations }
  end;

var
  FrmRelPedidos: TFrmRelPedidos;

implementation

uses UMain;


{$R *.dfm}

end.
