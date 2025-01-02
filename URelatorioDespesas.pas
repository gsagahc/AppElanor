unit URelatorioDespesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr, DB, DBClient,
  IBCustomDataSet, IBQuery;

type
  TFrmRelDespesas = class(TForm)
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
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRLabel8: TQRLabel;
    QRLabelPeriodo: TQRLabel;
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Total:Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelDespesas: TFrmRelDespesas;

implementation
Uses UPrincipal, UMensagens, Math, UConsultaDespesas;

{$R *.dfm}

procedure TFrmRelDespesas.GroupFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  { if  (IBQContasPagTBCONT_TOTAL.AsString  <> '0')then
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
    }
end;

end.
