unit UImpressaoPerdas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFrmImpressaoPerdas = class(TQuickRep)
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
  FrmImpressaoPerdas: TFrmImpressaoPerdas;

implementation
Uses UFrmControlePerdas, Math, uMensagens, UAlterarControledePerdas;
{$R *.DFM}

procedure TFrmImpressaoPerdas.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if FrmControlePerdas<> nil then
    begin
    if (FrmControlePerdas.CDSPerdasPercentual.AsFloat >= 0) and (FrmControlePerdas.CDSPerdasPercentual.AsFloat <= 2) then
    begin
       QRDBText3.Font.Color := clBlack  ;
       QRDBText3.Color := clGreen;
    end;

    if FrmControlePerdas.CDSPerdasPercentual.AsFloat >= 2 then
    begin
       QRDBText3.Font.Color := clBlack ;
       QRDBText3.Color :=clRed;
    end;
  end
  else
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
  end;
end;

end.
