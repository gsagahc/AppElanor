program Project1;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UGrafico in 'UGrafico.pas' {FrmConsultarPedCli};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
