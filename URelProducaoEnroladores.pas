unit URelProducaoEnroladores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr,  DB, DBClient, ComCtrls,
  StdCtrls, DBCtrls, IBCustomDataSet, IBQuery, IBTable;

type
  TFrmRelProdEnroladores = class(TForm)
    QuickRepDetalhes: TQuickRep;
    QRBandTitulo: TQRBand;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabelData: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
     Total:Currency;
    { Public declarations }
  end;

var
  FrmRelProdEnroladores: TFrmRelProdEnroladores;

implementation

uses  Math, UFrmControlePerdas;


{$R *.dfm}

end.
