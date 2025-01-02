program Project1;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UEntradaDeGastos in 'UEntradaDeGastos.pas' {FrmCadGastos},
  ULocalizarGastos in 'ULocalizarGastos.pas' {FrmBuscarGastos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmBuscarGastos, FrmBuscarGastos);
  Application.Run;
end.
