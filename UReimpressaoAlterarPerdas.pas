unit UReimpressaoAlterarPerdas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFrmImpressaoAlteraPerdas = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLAcumulado: TQRLabel;
    QRSysData1: TQRSysData;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  FrmImpressaoAlteraPerdas: TFrmImpressaoAlteraPerdas;

implementation
Uses Math, uMensagens, UAlterarControledePerdas;
{$R *.DFM}

procedure TFrmImpressaoAlteraPerdas.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if FrmAlterarControlePerdas<> nil then
    begin
    if (FrmAlterarControlePerdas.CDSPerdasPercentual.AsFloat >= 0) and (FrmAlterarControlePerdas.CDSPerdasPercentual.AsFloat <= 2) then
    begin
       QRDBText3.Font.Color := clBlack  ;
       QRDBText3.Color := clGreen;
    end;

    if FrmAlterarControlePerdas.CDSPerdasPercentual.AsFloat >= 2 then
    begin
       QRDBText3.Font.Color := clBlack ;
       QRDBText3.Color :=clRed;
    end;
  end ;

end;

end.
