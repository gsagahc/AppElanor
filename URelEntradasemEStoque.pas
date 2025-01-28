unit URelEntradasemEStoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr;

type
  TFrmRelEntradas = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLDataIni: TQRLabel;
    QRLabel11: TQRLabel;
    QRLDatafin: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabelTipo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEntradas: TFrmRelEntradas;

implementation
Uses UPrincipal, UMensagens, URelatorioPedData, Math, UConsMovEntrada;

{$R *.dfm}

procedure TFrmRelEntradas.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Trim(FrmConsMovEntrada.IBQMovEstoqueTBMOVE_TIPO.AsString) = 'E' Then
  begin
    QRLabelTipo.Caption:='ENTRADA';
    QRLabelTipo.Font.Color:=clGreen;
    QRLabel3.Font.Color:=clWhite;
  end
  else
  if Trim(FrmConsMovEntrada.IBQMovEstoqueTBMOVE_TIPO.AsString) = 'S' Then
  begin
    QRLabelTipo.Caption:='VENDA';
    QRLabelTipo.Font.Color:=clRed;
    QRLabel3.Font.Color:=clBlack
  end;
  if Trim(FrmConsMovEntrada.IBQMovEstoqueTBMOVE_TIPO.AsString) = 'A' Then
  begin
    QRLabelTipo.Caption:='AJUSTE MANUAL';
    QRLabelTipo.Font.Color:=clBlack;
    QRLabel3.Font.Color:=clWhite;
  end;
end;

end.
