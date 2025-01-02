program ContasPagar;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UCadFornecedor in 'UCadFornecedor.pas' {FrmCadFornec},
  uMensagens in 'uMensagens.pas' {frmMensagens},
  UBuscarFornecedor in 'UBuscarFornecedor.pas' {FrmBuscarFornecedor},
  UcadContasPagar in 'UcadContasPagar.pas' {FrmCadContasaPagar},
  UBuscarContas in 'UBuscarContas.pas' {FrmBuscarContas},
  UBaixarContasPag in 'UBaixarContasPag.pas' {FrmBaixarContasPag},
  URelContasEmAberto in 'URelContasEmAberto.pas' {FrmRelContasAberto},
  UContasPagasPPeriodo in 'UContasPagasPPeriodo.pas' {FrmBuscarContaPaga},
  URelContasPagas in 'URelContasPagas.pas' {FrmRelContasPagas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
