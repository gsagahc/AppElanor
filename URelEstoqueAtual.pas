unit URelEstoqueAtual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr, DB, DBClient,
  IBCustomDataSet, IBQuery;

type
  TFrmRelEstoqueAtual = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel7: TQRLabel;
    IBQEstoque: TIBQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    IBQEstoqueTBES_QUANTI: TIBBCDField;
    IBQEstoqueTBES_FORMATO: TIBStringField;
    IBQEstoqueTBES_TAMANHO: TIBBCDField;
    IBQEstoqueID_PRODUTO1: TIntegerField;
    IBQEstoqueTBPRD_NOME: TIBStringField;
    IBQEstoqueTBPRD_PRECOCUSTO: TIBBCDField;
    IBQEstoqueTBPRD_PRECOVENDA: TIBBCDField;
    IBQEstoqueTBPRD_TIPO: TIntegerField;
    IBQEstoqueTBPRD_DESCRICAO: TIBStringField;
    IBQEstoqueTBPRD_UNIDADE: TIBStringField;
    IBQEstoqueTBPRD_NCM: TIBStringField;
    IBQEstoqueTBPRD_CODIGO: TIBStringField;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    IBQEstoqueVALOR: TCurrencyField;
    CDSEstoque: TClientDataSet;
    CDSEstoqueCODIGO: TIntegerField;
    CDSEstoqueNOME: TStringField;
    CDSEstoqueTIPO: TStringField;
    CDSEstoqueUNDADE: TStringField;
    CDSEstoqueVALOR: TCurrencyField;
    CDSEstoquePRECO: TCurrencyField;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel9: TQRLabel;
    CDSEstoqueQUANTIDADE: TFloatField;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRLValTotal: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Total:Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEstoqueAtual: TFrmRelEstoqueAtual;

implementation
Uses UPrincipal, UMensagens, Math;

{$R *.dfm}

procedure TFrmRelEstoqueAtual.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if CDSEstoqueQUANTIDADE.AsInteger >= 0 then
    QRDBText6.Font.Color  := clGreen
  Else
    QRDBText6.Font.Color:= clRed; 

end;

end.
