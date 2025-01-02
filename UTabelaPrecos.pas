unit UTabelaPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr, DB, IBCustomDataSet,
  IBQuery;

type
  TFrmTabelaPrecos = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    IBQProdutos: TIBQuery;
    DsProdutos: TDataSource;
    IBQProdutosTBPRD_NOME: TIBStringField;
    IBQProdutosTBPRD_PRECOVENDA: TIBBCDField;
    IBQProdutosTBPRD_TIPO: TIntegerField;
    IBQProdutosTBPRD_CODIGO: TIBStringField;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTabelaPrecos: TFrmTabelaPrecos;

implementation
Uses UPrincipal, UMensagens, URelatorioPedData, Math;

{$R *.dfm}

end.
