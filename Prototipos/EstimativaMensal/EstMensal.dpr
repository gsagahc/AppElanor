program EstMensal;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  UConsultaFaturamentoMes in 'UConsultaFaturamentoMes.pas' {FrmConsultarFatMensal},
  URelFaturamentoMes in 'URelFaturamentoMes.pas' {FrmRelFaturamentoMensal},
  UGraficoEstimadoFaturamento in 'UGraficoEstimadoFaturamento.pas' {FrmGraficoEstimaFaturamento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmGraficoEstimaFaturamento, FrmGraficoEstimaFaturamento);
  Application.Run;
end.
