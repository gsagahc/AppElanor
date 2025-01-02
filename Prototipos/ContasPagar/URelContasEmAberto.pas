unit URelContasEmAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr, DB, DBClient,
  IBCustomDataSet, IBQuery;

type
  TFrmRelContasAberto = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel7: TQRLabel;
    DsContasPagar: TDataSource;
    IBQContasPag: TIBQuery;
    IBQContasPagTBCONT_NUMNOTA: TIBStringField;
    IBQContasPagTBCONT_EMISSAO: TDateField;
    IBQContasPagFORNECEDOR: TIBStringField;
    IBQContasPagTBCONT_VALORNOTA: TIBBCDField;
    IBQContasPagTBCONT_VENCIMENTO: TDateField;
    IBQContasPagTBCONT_VALOR: TIBBCDField;
    IBQContasPagTBCONT_MES: TIBStringField;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    GroupFooterBand1: TQRBand;
    GroupHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    IBQContasPagTBCONT_TOTAL: TIBBCDField;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Total:Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelContasAberto: TFrmRelContasAberto;

implementation
Uses UPrincipal, UMensagens, Math;

{$R *.dfm}

procedure TFrmRelContasAberto.GroupFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if  (IBQContasPagTBCONT_TOTAL.AsString  <> '0')then
   begin
      QRLabel8.Caption :=' Total: ';
      QRDBText8.Font.Color := clBlack;
      GroupFooterBand1.Height:=16;
   end
   else
   begin
      GroupFooterBand1.Height:=0;
      QRLabel8.Caption :='';
      QRDBText8.Font.Color := clWhite ;
   end;

end;

procedure TFrmRelContasAberto.GroupHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  If IBQContasPagTBCONT_MES.AsString <> EmptyStr then
  Begin
       GroupHeaderBand1.Height:=16;
  End
  else
  Begin
       GroupHeaderBand1.Height:=1;
  End;
end;

end.
