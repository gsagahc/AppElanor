program Project1;

uses
  Forms,
  UMain in 'UMain.pas' {FrmPrincipal},
  URelatorioPedDias in 'URelatorioPedDias.pas' {FrmRelPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
