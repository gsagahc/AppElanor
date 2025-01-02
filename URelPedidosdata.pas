unit URelPedidosdata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr,  DB, DBClient, ComCtrls,
  StdCtrls, DBCtrls, IBCustomDataSet, IBQuery;

type
  TFrmRelPedidos = class(TForm)
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
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRLTotal: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
     Total:Currency;
    { Public declarations }
  end;

var
  FrmRelPedidos: TFrmRelPedidos;

implementation
Uses UPrincipal, UMensagens, URelatorioPedData, Math, URelatorioPedDataCliente;

{$R *.dfm}

procedure TFrmRelPedidos.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel8.Visible:=False;
  QRLabel8.Caption :='';
  If FrmPrincipal.IBQPedidosTBPED_CANCELADO.AsString='S' Then
  Begin
      QRLabel8.Font.Color :=clRed;
      QRLabel8.Visible:=True;
      QRLabel8.Caption :='CANCELADO';
  End;
  

end;

end.
