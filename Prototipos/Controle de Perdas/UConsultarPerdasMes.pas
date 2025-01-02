unit UConsultarPerdasMes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFrmImpressaoPerdasMes = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLAcumulado: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  FrmImpressaoPerdasMes: TFrmImpressaoPerdasMes;

implementation
Uses UConsultarPerdas, Math;
{$R *.DFM}

procedure TFrmImpressaoPerdasMes.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if FrmConsultarPerdas.IBQConsultar.FieldByName('TBCP_PERCENTUAL').AsFloat <= 2 then
  begin
     QRDBText3.Font.Color := clBlack  ;
     QRDBText3.Color := clGreen;
  end;
  if FrmConsultarPerdas.IBQConsultar.FieldByName('TBCP_PERCENTUAL').AsFloat >= 2 then
  begin
     QRDBText3.Font.Color := clBlack ;
     QRDBText3.Color :=clRed;
  end;
end;

end.
