 program Elanor;

uses
  Forms,
  Windows,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UPadrao in 'UPadrao.pas' {FrmPadrao},
  UCadProdutos in 'UCadProdutos.pas' {FrmCadProd},
  UBuscarProdutos in 'UBuscarProdutos.pas' {FrmBuscarPrd},
  uMensagens in 'uMensagens.pas' {frmMensagens},
  UEntraEstoque in 'UEntraEstoque.pas' {FrmEntEstoque},
  UCadUser in 'UCadUser.pas' {FrmCadUser},
  UBuscarUser in 'UBuscarUser.pas' {FrmBuscarUser},
  ULogin in 'ULogin.pas' {FrmLogin},
  UCadPedido in 'UCadPedido.pas' {FrmNPedido},
  UCadCli in 'UCadCli.pas' {FrmCadCli},
  UCadPrazos in 'UCadPrazos.pas' {FrmCadPrazos},
  UBuscarPrazos in 'UBuscarPrazos.pas' {FrmBuscaPrazos},
  UBuscarCliente in 'UBuscarCliente.pas' {FrmBuscarCliente},
  USelecionarProd in 'USelecionarProd.pas' {FrmSelecionarProd},
  UImpressaoPedidos in 'UImpressaoPedidos.pas' {FrmImprePedidos},
  UConsultarEstoque in 'UConsultarEstoque.pas' {FrmConsultarEstoque},
  USelecionaProdPreco in 'USelecionaProdPreco.pas' {FrmSelProdPre},
  UConsultarPedCli in 'UConsultarPedCli.pas' {FrmConsultarPedCli},
  UConsMovEntrada in 'UConsMovEntrada.pas' {FrmConsMovEntrada},
  UNumProxPed in 'UNumProxPed.pas' {FrmNumProxPed},
  UEnfestadoPRolo in 'UEnfestadoPRolo.pas' {FrmEnfestadoPRolo},
  USelecionaProdestoque in 'USelecionaProdestoque.pas' {FrmSelecionarProdEstoque},
  UConsultaPedData in 'UConsultaPedData.pas' {FrmConsultarPedData},
  UGraficoVenProd in 'UGraficoVenProd.pas' {FrmGraficoVenProd},
  UAtendeCliente1 in 'UAtendeCliente1.pas',
  UAtendeCliente in 'UAtendeCliente.pas',
  UCadCheque in 'UCadCheque.pas' {FrmCadCheque},
  UBuscarCheque in 'UBuscarCheque.pas' {FrmBuscarCheques},
  UImpressaoEtiquetas in 'UImpressaoEtiquetas.pas' {FrmImpEtiquetas},
  UQRepEtiquetas in 'UQRepEtiquetas.pas' {FrmQrepEtiquetas},
  URelatorioPedData in 'URelatorioPedData.pas' {FrmRelatorioPedData},
  URelPedidosdata in 'URelPedidosdata.pas' {FrmRelPedidos},
  UImpressaoEtiquetasNProd in 'UImpressaoEtiquetasNProd.pas' {FrmImpEtiquetasNProd},
  UImpressaoEtiquetasNProdpas in 'UImpressaoEtiquetasNProdpas.pas' {FrmQrepEtiquetasNProd},
  URelatorioPedPrazo in 'URelatorioPedPrazo.pas' {FrmConsultarPedPrazo},
  URelatorioPedidosPrazo in 'URelatorioPedidosPrazo.pas' {FrmRelPedidosPrazo},
  UCancelpedidos in 'UCancelpedidos.pas' {FrmCancelPedidos},
  URelEntradasemEStoque in 'URelEntradasemEStoque.pas' {FrmRelEntradas},
  UTabelaPrecos in 'UTabelaPrecos.pas' {FrmTabelaPrecos},
  UConsultaPedidosVista in 'UConsultaPedidosVista.pas' {FrmConsultarPedVista},
  URelatorioPedidosVista in 'URelatorioPedidosVista.pas' {FrmRelPedidosVista},
  UConcultaPedCancelado in 'UConcultaPedCancelado.pas' {FrmConsultarPedCancelado},
  UConsultarContaREC in 'UConsultarContaREC.pas' {FrmConsultarContaRec},
  UConsultarContaRecPaga in 'UConsultarContaRecPaga.pas' {FrmConsultarContaRecPaga},
  UBaixarContasPag in 'Prototipos\ContasPagar\UBaixarContasPag.pas' {FrmBaixarContasPag},
  UBuscarContas in 'Prototipos\ContasPagar\UBuscarContas.pas' {FrmBuscarContas},
  UBuscarFornecedor in 'Prototipos\ContasPagar\UBuscarFornecedor.pas' {FrmBuscarFornecedor},
  UcadContasPagar in 'Prototipos\ContasPagar\UcadContasPagar.pas' {FrmCadContasaPagar},
  UCadFornecedor in 'Prototipos\ContasPagar\UCadFornecedor.pas' {FrmCadFornec},
  URelContasEmAberto in 'Prototipos\ContasPagar\URelContasEmAberto.pas' {FrmRelContasAberto},
  URelatorioPedDataCliente in 'URelatorioPedDataCliente.pas' {FrmRelatorioPedDataCli},
  URelEstoqueAtual in 'URelEstoqueAtual.pas' {FrmRelEstoqueAtual},
  URelatorioPedOrdemCompra in 'URelatorioPedOrdemCompra.pas' {FrmConsultarPedOrdemCompra},
  URelatorioPedData_e_OC in 'URelatorioPedData_e_OC.pas' {FrmRelPedidosOC},
  UIncluir_OBS_Pedidos in 'UIncluir_OBS_Pedidos.pas' {FrmIncluirObsPedidos},
  UQuantidade in 'Prototipos\FrmQuantidade\UQuantidade.pas' {FrmQuantidade},
  UNumPed in 'Prototipos\NumPed\UNumPed.pas' {FrmNumPed},
  UConsultaPedDia in 'UConsultaPedDia.pas' {FrmConsultarPedDia},
  URelatorioPedDias in 'URelatorioPedDias.pas' {FrmRelPedidosDia},
  UGraficoDeFaturamentoDiario in 'UGraficoDeFaturamentoDiario.pas' {FrmGraficoFaturamentodia},
  UEntradaDeGastos in 'UEntradaDeGastos.pas' {FrmCadGastos},
  ULocalizarGastos in 'ULocalizarGastos.pas' {FrmBuscarGastos},
  UConsultaDespesas in 'UConsultaDespesas.pas' {FrmConsultarDespesas},
  URelatorioDespesas in 'URelatorioDespesas.pas' {FrmRelDespesas},
  UModuloSql in 'Prototipos\ModuloSQL\UModuloSql.pas' {FormConsultaSQL},
  URelFaturamentoMes in 'Prototipos\EstimativaMensal\URelFaturamentoMes.pas' {FrmRelFaturamentoMensal},
  UConsultaPedProduto in 'UConsultaPedProduto.pas' {FrmConsultarPedProduto},
  URomaneioEntrega in 'Prototipos\RomaneioEntrega\URomaneioEntrega.pas' {FrmRomaneioEntrega},
  UPrintRomaneio in 'UPrintRomaneio.pas' {FrmPrintRomaneio},
  USelecionarSkin in 'USelecionarSkin.pas' {FrmSelectSkin},
  UFrmControlePerdas in 'Prototipos\Controle de Perdas\UFrmControlePerdas.pas' {FrmControlePerdas},
  UConsultarPerdasMes in 'Prototipos\Controle de Perdas\UConsultarPerdasMes.pas' {FrmImpressaoPerdasMes: TQuickRep},
  UConsultarPerdas in 'Prototipos\Controle de Perdas\UConsultarPerdas.pas' {FrmConsultarPerdas},
  UImpressaoPerdas in 'Prototipos\Controle de Perdas\UImpressaoPerdas.pas' {FrmImpressaoPerdas: TQuickRep},
  UConsultarLancamentos in 'Prototipos\Controle de Perdas\UConsultarLancamentos.pas' {FrmConsultarLancamentos},
  UReimpressaoPerdas in 'UReimpressaoPerdas.pas' {FrmReImpressaoPerdas: TQuickRep},
  UCadastroDespesas in 'UCadastroDespesas.pas' {FrmCadDespesas},
  USelecionarDespesas in 'USelecionarDespesas.pas' {FrmSelecionaDespesas},
  URelatorioDeCustos in 'URelatorioDeCustos.pas' {FrmRelCustos},
  UBuscarLote in 'UBuscarLote.pas' {FrmBuscarLote},
  UZerarEStoqueNegativo in 'UZerarEStoqueNegativo.pas' {FrmEstoqueNegativo},
  UAlterarControledePerdas in 'UAlterarControledePerdas.pas' {FrmAlterarControlePerdas},
  UReimpressaoAlterarPerdas in 'UReimpressaoAlterarPerdas.pas' {FrmImpressaoAlteraPerdas: TQuickRep},
  UReimpressaoRomaneio in 'UReimpressaoRomaneio.pas' {FrmReimpressaoRomaneio},
  URelReimpressaoRomaneio in 'URelReimpressaoRomaneio.pas' {FrmPrintRomaneio1},
  UCadEnrolador in 'UCadEnrolador.pas' {FrmCadEnrolador},
  UBuscarEnrolador in 'UBuscarEnrolador.pas' {FrmBuscarEnrolador},
  UConfiguracoes in 'UConfiguracoes.pas' {FrmConfiguracoes},
  URelatorioEnroladores in 'Prototipos\RelatorioEnroladores\URelatorioEnroladores.pas' {FormEnroladores},
  UParametrosConfig in 'UParametrosConfig.pas',
  URelatorioPedDataClienteProduto in 'URelatorioPedDataClienteProduto.pas' {FrmRelatorioPedDataCliProd};

{$R *.res}
var
Hwnd : THandle;
StrBase: string;
begin
  Hwnd := FindWindow('TApplication', 'Sistema de Gestão Elanor');
  if Hwnd = 0 then
  begin
    Application.Initialize;
    Application.Title := 'Sistema de Gestão Elanor';
    Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Try
      FrmPrincipal.IBDMain.Close;
      FrmPrincipal.IBDMain.DatabaseName:= FrmPrincipal.BancoDados;
      FrmPrincipal.IBDMain.Open;
      If  not FrmPrincipal.IBTMain.Active Then
        FrmPrincipal.IBTMain.StartTransaction;
      FrmPrincipal.IBSQLUTIL.Close;
      FrmPrincipal.IBSQLUTIL.SQL.Clear;
      FrmPrincipal.IBSQLUTIL.SQL.Add('SELECT NOME FROM TB_BASE');
      FrmPrincipal.IBSQLUTIL.ExecQuery;
      FrmPrincipal.StatusBar1.Panels.Items[1].Text:='Base: '+FrmPrincipal.IBSQLUTIL.FieldByName('NOME').AsString;

      if (Copy(FrmPrincipal.IBDMain.DatabaseName,1,12) = 'C:\AppElanor')  Then
        FrmPrincipal.StatusBar1.Panels.Items[1].Text:=FrmPrincipal.StatusBar1.Panels.Items[1].Text + ' (LOCAL)'
      else
        FrmPrincipal.StatusBar1.Panels.Items[1].Text:=FrmPrincipal.StatusBar1.Panels.Items[1].Text + ' (REMOTO)';
    Except
      begin
        tFrmMensagens.Mensagem('Não é possível conectar ao banco de dados, '+
                               'verifique sua conexão de rede ou o arquivo Config.ini e em '+
                               'seguida tente novamente.','E',[mbOK]);
         Application.Terminate;
      end;
    End;
    Application.Run;
  end
  Else
    SetForegroundWindow(Hwnd);
end.
