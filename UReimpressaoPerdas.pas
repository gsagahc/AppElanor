unit UReimpressaoPerdas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFrmReImpressaoPerdas = class(TQuickRep)
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
  FrmReImpressaoPerdas: TFrmReImpressaoPerdas;

implementation
Uses UConsultarLancamentos, Math, UFrmControlePerdas;
{$R *.DFM}

procedure TFrmReImpressaoPerdas.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (FrmConsultarLancamentos.IBQConsultarLancamentosTBCP_PERCENTUAL.AsFloat >= 0) and (FrmConsultarLancamentos.IBQConsultarLancamentosTBCP_PERCENTUAL.AsFloat <= 2) then
  begin
     QRDBText3.Font.Color := clBlack  ;
     QRDBText3.Color := clGreen;
  end;

  if FrmConsultarLancamentos.IBQConsultarLancamentosTBCP_PERCENTUAL.AsFloat >= 2 then
  begin
     QRDBText3.Font.Color := clBlack ;
     QRDBText3.Color :=clRed;
  end;  
end;

end.
