program Project1;

uses
  Forms,
  UPedido in 'UPedido.pas' {FrmImprePedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Impressão manual de pedidos';
  Application.CreateForm(TFrmImprePedidos, FrmImprePedidos);
  Application.Run;
end.
