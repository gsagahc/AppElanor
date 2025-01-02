program Project1;

uses
  Forms,
  UMain in 'UMain.pas' {Form1},
  UFrmControlePerdas in 'UFrmControlePerdas.pas' {FrmControlePerdas},
  UImpressaoPerdas in 'UImpressaoPerdas.pas' {FrmImpressaoPerdas: TQuickRep},
  UConsultarPerdas in 'UConsultarPerdas.pas' {FrmConsultarPerdas},
  UConsultarPerdasMes in 'UConsultarPerdasMes.pas' {FrmImpressaoPerdasMes: TQuickRep},
  UConsultarLancamentos in 'UConsultarLancamentos.pas' {FrmConsultarLancamentos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
