unit UCadPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DBCtrls, StdCtrls, Mask, pngextra,
  IBSQL, DB, IBQuery, IBCustomDataSet, IBTable, Provider, DBClient,
  IBUpdateSQL, UPrincipal;


type
  TFrmNPedido = class(TForm)
    PanelCliente: TPanel;
    PanelProdutos: TPanel;
    PanelBotoesProd: TPanel;
    DBGrid1: TDBGrid;
    DBEditCli: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    PNGButton5: TPNGButton;
    PNGButton4: TPNGButton;
    PNGBRemoverProd: TPNGButton;
    IBTbPedidos: TIBTable;
    IBTbItensPedido: TIBTable;
    IBQProdutos: TIBQuery;
    DsPedido: TDataSource;
    IBSQLCliente: TIBSQL;
    PNGButton1: TPNGButton;
    IBTbPedidosTBPED_DATA: TDateField;
    IBTbPedidosID_CLIENTE: TIntegerField;
    IBTbPedidosTBPED_NOME: TIBStringField;
    IBTbPedidosTBPED_ENDERECO: TIBStringField;
    IBTbPedidosTBPED_CIDADE: TIBStringField;
    IBTbPedidosTBPED_TELEFONE: TIBStringField;
    IBTbPedidosID_PRAZO: TIntegerField;
    IBTbPedidosTBPED_VALTOTAL: TIBBCDField;
    IBTbPedidosTBPED_VENC01: TDateField;
    IBTbPedidosTBPED_VENC02: TDateField;
    IBTbPedidosTBPED_VENC03: TDateField;
    IBTbPedidosID_USUARIO: TIntegerField;
    IBTbItensPedidoID_PEDIDO: TIntegerField;
    IBTbItensPedidoID_PRAZO: TIntegerField;
    IBTbItensPedidoID_CLIENTE: TIntegerField;
    IBTbItensPedidoID_USUARIO: TIntegerField;
    IBQCodPedido: TIBQuery;
    IBTbItensPedidoTBITPED_UNIDADE: TIBStringField;
    Label1: TLabel;
    IBQPrazos: TIBQuery;
    IBQPrazosID_PRAZO: TIntegerField;
    IBQPrazosTBPRZ_NOME: TIBStringField;
    IBQPrazosTBPRZ_PRAZO01: TIntegerField;
    IBQPrazosTBPRZ_PRAZO02: TIntegerField;
    IBQPrazosTBPRZ_PRAZO03: TIntegerField;
    DSPrazos: TDataSource;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    IBQProdutosID_PRODUTO: TIntegerField;
    IBQProdutosTBPRD_NOME: TIBStringField;
    IBQProdutosTBPRD_TIPO: TIntegerField;
    IBQProdutosTBPRD_DESCRICAO: TIBStringField;
    IBQProdutosTBPRD_UNIDADE: TIBStringField;
    IBQProdutosTBPRD_NCM: TIBStringField;
    IBQProdutosTBPRD_CODIGO: TIBStringField;
    DsProdutos: TDataSource;
    IBTbItensPedidoID_PRODUTO: TIntegerField;
    IBTbItensPedidoNOME: TStringField;
    PNGBNovoProd: TPNGButton;
    CDSItensPedido: TClientDataSet;
    DsItensPedido: TDataSource;
    CDSItensPedidoID_PRODUTO: TIntegerField;
    CDSItensPedidoTBITPED_VALUNI: TCurrencyField;
    CDSItensPedidoTBITPED_VALTOT: TCurrencyField;
    CDSItensPedidoID_PEDIDO: TIntegerField;
    CDSItensPedidoTBITPED_UNIDADE: TStringField;
    CDSItensPedidoNOME_PRODUTO: TStringField;
    IBSQLUTIL: TIBSQL;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    IBTbPedidosTBPED_BAIRRO: TIBStringField;
    IBTbPedidosTBPED_CNPJ: TIBStringField;
    IBTbPedidosTBPED_NUMPED: TIBStringField;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    IBTbPedidosTBPED_ESTADO: TIBStringField;
    IBTbItensPedidoTBITPED_TIPO: TIBStringField;
    CDSItensPedidoFORMATO: TStringField;
    IBQProdutosTBPRD_PRECOCUSTO: TIBBCDField;
    IBQProdutosTBPRD_PRECOVENDA: TIBBCDField;
    IBTbItensPedidoTBITPED_VALUNI: TIBBCDField;
    IBTbItensPedidoTBITPED_VALTOT: TIBBCDField;
    DBLookupListBox1: TDBLookupListBox;
    IBTbPedidosTBPED_CEP: TIBStringField;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    CDSItensPedidoTAMANHO: TStringField;
    IBTbItensPedidoTBITPED_TAMANHO: TIBBCDField;
    CDSItensPedidoTBITPED_QUANT: TBCDField;
    IBTbItensPedidoTBITPED_QUANT: TIBBCDField;
    Panel1: TPanel;
    Label9: TLabel;
    EdtValorTotal: TEdit;
    PNGBAtualizar: TPNGButton;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    CDSItensPedidoID_ESTOQUE: TIntegerField;
    RadioGroupBoleto: TRadioGroup;
    IBTbPedidosTBPED_BOLETO: TIBStringField;
    IBTbPedidosOBS: TIBStringField;
    IBQUtil: TIBQuery;
    procedure PNGButton4Click(Sender: TObject);
    procedure IBTbPedidosAfterInsert(DataSet: TDataSet);
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGBNovoProdClick(Sender: TObject);
    Function AtualizaEstoque(pEstoque:TObject ; Quantidade:Real; Operacao:String):Boolean;
    procedure FormShow(Sender: TObject);
    Function NumPed:String;
    procedure PNGBRemoverProdClick(Sender: TObject);
    procedure DBEditCliExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1Exit(Sender: TObject);
    procedure CDSItensPedidoTBITPED_VALUNIChange(Sender: TField);
    procedure CalculaPrazos();
    procedure CDSItensPedidoTBITPED_QUANTChange(Sender: TField);
    procedure GerarContaRec(idpedido:Integer;ValorTotal, Valor:Currency; Vencimento:TDate);
    procedure atualizarTotal;
    procedure CDSItensPedidoAfterEdit(DataSet: TDataSet);
    procedure PNGBAtualizarClick(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LimparDBEdits;
  private
    { Private declarations }
    QuantItens:Integer;
    IdPedido:Integer;
    IsNumber :Boolean;
    Estoque:TEstoque;
  public
     StrFormato:String;
     StrTamanho:String;
    { Public declarations }
  end;

var
  FrmNPedido: TFrmNPedido;

implementation
Uses uMensagens, USelecionarProd, UBuscarCliente, Math,
  UBuscarProdutos, UImpressaoPedidos, UQuantidade;


{$R *.dfm}

procedure TFrmNPedido.PNGButton4Click(Sender: TObject);
begin
  IBTbPedidos.Cancel;
  IBTbItensPedido.Cancel;
  CDSItensPedido.EmptyDataSet;
  If FrmPrincipal.IBTMain.InTransaction  Then
    FrmPrincipal.IBTMain.Rollback;
  Close;
end;

procedure TFrmNPedido.IBTbPedidosAfterInsert(DataSet: TDataSet);
begin
  IBQCodPedido.Open;
  IdPedido := IBQCodPedido.FieldByName('ID_PEDIDO').AsInteger+1;
  IBQCodPedido.Close;
end;

procedure TFrmNPedido.PNGButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmBuscarCliente, FrmBuscarCliente);
  FrmBuscarCliente.ShowModal;
  If  FrmBuscarCliente.Cliente <>Nil  then
  Begin
     FrmPrincipal.IdCliente             := FrmBuscarCliente.Cliente.IdCliente;
     IBTbPedidosID_CLIENTE.AsInteger    := FrmBuscarCliente.Cliente.IdCliente;
     IBTbPedidosTBPED_NOME.AsString     := FrmBuscarCliente.Cliente.NomeCliente;
     IBTbPedidosTBPED_ENDERECO.AsString := FrmBuscarCliente.Cliente.Endereco ;
     IBTbPedidosTBPED_BAIRRO.AsString   := FrmBuscarCliente.Cliente.Bairro ;
     IBTbPedidosTBPED_CIDADE.AsString   := FrmBuscarCliente.Cliente.Cidade ;
     IBTbPedidosID_PRAZO.AsInteger      := FrmBuscarCliente.Cliente.Id_Prazo ;
     IBTbPedidosTBPED_CEP.AsString      := FrmBuscarCliente.Cliente.Cep;
     IBTbPedidosTBPED_ESTADO.AsString   := FrmBuscarCliente.Cliente.Estado ;

     If FrmBuscarCliente.Cliente.Boleto='S' then
       RadioGroupBoleto.ItemIndex :=0
     else
       RadioGroupBoleto.ItemIndex :=1;

  End;
  FrmBuscarCliente.Free;
  CalculaPrazos;
end;

procedure TFrmNPedido.PNGButton5Click(Sender: TObject);
var ValTotal:Currency;
    NumParcelas:Integer;
begin
  if (tFrmMensagens.Mensagem('Deseja confirmar este pedido? Favor verificar os '+
                              ' dados inseridos','Q',[mbSim, mbNao])) then
  Begin
    try
      NumParcelas :=0;
      If (DBEditCli.Text=EmptyStr) Or (DBLookupComboBox1.Text=EmptyStr) Or
         (CDSItensPedido.IsEmpty ) Then
        tFrmMensagens.Mensagem('Pedido incompleto, favor verificar.' ,'E',[mbOK])
      Else
      Begin
        If  not IBTbItensPedido.Active then
            IBTbItensPedido.Open;
       //Atualizae itens Pedido
        ValTotal :=0;
        CDSItensPedido.First;
        While Not CDSItensPedido.Eof do
        Begin
          IBTbItensPedido.Append;
          IBTbItensPedidoID_PEDIDO.AsInteger:=IdPedido;
          IBTbItensPedidoTBITPED_UNIDADE.AsString:=CDSItensPedidoTBITPED_UNIDADE.AsString;
          IBTbItensPedidoTBITPED_TAMANHO.AsString:=CDSItensPedidoTAMANHO.AsString;
          IBTbItensPedidoID_PRODUTO.AsInteger:=CDSItensPedidoID_PRODUTO.AsInteger;
          IBTbItensPedidoTBITPED_QUANT.Value :=CDSItensPedidoTBITPED_QUANT.Value ;
          IBTbItensPedidoTBITPED_VALUNI.AsCurrency:=CDSItensPedidoTBITPED_VALUNI.AsCurrency;
          IBTbItensPedidoTBITPED_VALTOT.AsCurrency:=CDSItensPedidoTBITPED_VALTOT.AsCurrency;
          IBTbItensPedidoTBITPED_TIPO.AsString    :=CDSItensPedidoFORMATO.AsString;
          ValTotal:=ValTotal+CDSItensPedidoTBITPED_VALTOT.AsCurrency;
          IBTbItensPedido.Post;

          FrmPrincipal.atualizaMovimentacao(CDSItensPedidoID_PRODUTO.AsInteger,IdPedido,CDSItensPedidoTBITPED_QUANT.Value,0,'S',CDSItensPedidoFORMATO.AsString);
          CDSItensPedido.Next;
        End;

        //Não gerar contarec se for boleto.
        If RadioGroupBoleto.ItemIndex = 1 Then
        Begin
          IBTbPedidosTBPED_BOLETO.AsString:='N';
          if IBTbPedidosTBPED_VENC01.AsDateTime <> 0 then
             NumParcelas:=NumParcelas+1;
          if IBTbPedidosTBPED_VENC02.AsDateTime <> 0 then
              NumParcelas:=NumParcelas+1;
          if IBTbPedidosTBPED_VENC03.AsDateTime <> 0 then
             NumParcelas:=NumParcelas+1;

          if IBTbPedidosTBPED_VENC01.AsDateTime <> 0 then
            GerarContaRec(idpedido, ValTotal, (ValTotal/NumParcelas) , IBTbPedidosTBPED_VENC01.AsDateTime );
          if IBTbPedidosTBPED_VENC02.AsDateTime <> 0 then
            GerarContaRec(idpedido, ValTotal, (ValTotal/NumParcelas) , IBTbPedidosTBPED_VENC02.AsDateTime);
          if IBTbPedidosTBPED_VENC03.AsDateTime <> 0 then
            GerarContaRec(idpedido, ValTotal, (ValTotal/NumParcelas) , IBTbPedidosTBPED_VENC03.AsDateTime);
        end
        else
          IBTbPedidosTBPED_BOLETO.AsString:='S';


        IBTbPedidosTBPED_VALTOTAL.AsCurrency:=ValTotal;
        IBTbPedidosID_USUARIO.AsInteger:=FrmPrincipal.IdUsuario;
        IBTbPedidosTBPED_NUMPED.AsString:=NumPed;
        IBTbPedidosTBPED_DATA.AsString :=FormatDateTime('DD/MM/YYYY',Now());
        IBTbPedidos.Post;

        CDSItensPedido.EmptyDataSet;
        FrmPrincipal.IBTMain.Commit;
        Application.CreateForm(TFrmImprePedidos, FrmImprePedidos);
        FrmImprePedidos.IBQImpressaoPed.ParamByName('pIDPedido').AsInteger:=IdPedido;
        FrmImprePedidos.IBQImpressaoPed.Open;
        FrmImprePedidos.MontarCDs;
        FrmImprePedidos.QuickRepEmpresa.Preview; //Empresa
        Close;
      End;
    Except
      on E: EDatabaseError do
      begin
        FrmPrincipal.IBTMain.Rollback;
        tFrmMensagens.Mensagem('Erro ao salvar pedido.' ,'E',[mbOK])
      End;
    end;

  End;

end;

procedure TFrmNPedido.PNGBNovoProdClick(Sender: TObject);
var StrUnidade, StrQuant:String;
    Quantidade:Real;
    IsNumber:Boolean;
Begin
  if QuantItens < 7 Then
  Begin
    IsNumber :=False;
    FrmPrincipal.IdProduto  :=0;
    Application.CreateForm(TFrmSelecionarProd, FrmSelecionarProd);
    FrmSelecionarProd.Caption := 'Localizar produto';
    FrmSelecionarProd.ShowModal;
    Estoque:=TEstoque.Create;
    Estoque.Id_produto := FrmSelecionarProd.IBQProdutos.FieldByName('ID_PRODUTO').AsInteger;
    Estoque.Id_estoque := FrmSelecionarProd.IBQProdutos.FieldByName('ID_ESTOQUE').AsInteger;
    Estoque.Nome       := FrmSelecionarProd.IBQProdutos.FieldByName('TBPRD_NOME').AsString;
    Estoque.Tamanho    := FrmSelecionarProd.IBQProdutos.FieldByName('TBES_TAMANHO').AsString;
    Estoque.Formato    := FrmSelecionarProd.IBQProdutos.FieldByName('TBES_FORMATO').AsString;
    Estoque.Quantidade := FrmSelecionarProd.IBQProdutos.FieldByName('TBES_QUANTI').AsFloat;
    Estoque.Unidade    := FrmSelecionarProd.IBQProdutos.FieldByName('TBPRD_UNIDADE').AsString; 
    If  Estoque.Id_produto <>0 then
    begin
      IBQProdutos.Close;
      IBQProdutos.ParamByName('pIDPRODUTO').AsInteger:=FrmPrincipal.IdProduto;
      IBQProdutos.Open;
      try
      Begin
        Application.CreateForm(TFrmQuantidade, FrmQuantidade);
        FrmQuantidade.ShowModal;
        Quantidade := StrToFloat(FrmQuantidade.NumEdtQuant.Text);
        FreeAndNil(FrmQuantidade);
        If Quantidade > 0 Then
        Begin
          IsNumber :=True;

          If AtualizaEstoque(Estoque, Quantidade, 'D') Then
          Begin
            QuantItens:=QuantItens+1;
            CDSItensPedido.Append;
            CDSItensPedidoTBITPED_QUANT.Value  := Quantidade;
            CDSItensPedidoID_PEDIDO.AsInteger  :=IdPedido;
            CDSItensPedidoNOME_PRODUTO.AsString:= IBQProdutos.FieldbyName('TBPRD_NOME').AsString;
            CDSItensPedidoFORMATO.AsString     := Trim(Estoque.Formato);
            CDSItensPedidoID_PRODUTO.AsInteger := FrmPrincipal.IdProduto;
            CDSItensPedidoID_ESTOQUE.AsInteger := Estoque.Id_estoque;
            If Estoque.Tamanho <> EmptyStr Then
            Begin
              CDSItensPedidoTAMANHO.AsString :=Estoque.Tamanho;
              CDSItensPedidoTBITPED_UNIDADE.AsString:='UN';
            End
            Else
              CDSItensPedidoTBITPED_UNIDADE.AsString:=IBQProdutos.FieldbyName('TBPRD_UNIDADE').AsString;
           

            //Verificar se tem preço especial
            IBSQLUTIL.Close;
            IBSQLUTIL.SQL.Clear;
            IBSQLUTIL.SQL.Add('SELECT * FROM TB_PRECOSCLI '+
                               'WHERE ID_CLIENTE=:pIdCliente '+
                               'AND ID_PRODUTO=:IdPoduto');
            IBSQLUTIL.ParamByName('pIdCliente').AsInteger:=FrmPrincipal.IdCliente;
            IBSQLUTIL.ParamByName('IdPoduto').AsInteger:=FrmPrincipal.IdProduto;
            IBSQLUTIL.ExecQuery;
            If Not IBSQLUTIL.Eof Then
              CDSItensPedidoTBITPED_VALUNI.AsCurrency :=IBSQLUTIL.FieldByName('TBPRECLI_PRECO').AsCurrency
            Else
              CDSItensPedidoTBITPED_VALUNI.AsCurrency      :=  IBQProdutos.FieldbyName('TBPRD_PRECOVENDA').AsCurrency   ;
            CDSItensPedidoTBITPED_VALTOT.AsCurrency      :=  CDSItensPedidoTBITPED_VALUNI.AsCurrency * Quantidade;
          End;
        End;  
      End;
      except
         Begin
          (tFrmMensagens.Mensagem('Favor digitar apenas números','I',[mbOK]));
         End;
      end;

    End;    
    FrmSelecionarProd.Free;
    Estoque.Free; 
  end
  Else
     (tFrmMensagens.Mensagem('Quantidade máxima de itens por pedido não pode ser superior a 7 (sete)','E',[mbOK]));

  atualizarTotal;
  PNGBRemoverProd.Enabled :=True;
  PNGBAtualizar.Enabled   := True;

end;



Function TFrmNPedido.AtualizaEstoque(pEstoque:TObject; Quantidade:Real; Operacao:String):Boolean;
var lEstoque: TEstoque;
    sMensagem:string;
begin
  Result:=False;
  lEstoque:= TEstoque.Create;
  lEstoque:=(pEstoque as TEstoque)  ;
  If Operacao ='D' Then
  Begin

    If Quantidade <= Estoque.Quantidade    Then
    Begin
      IBSQLUTIL.Close;
      IBSQLUTIL.SQL.Clear;
      IBSQLUTIL.Sql.Add('UPDATE TB_ESTOQUE ' +
                        ' SET ' +
                        ' TBES_QUANTI =TBES_QUANTI - :pQuantidade ' +
                        'WHERE ID_PRODUTO=:pIdProduto ' +
                        ' AND ID_ESTOQUE= :pIdEstoque ');
      IBSQLUTIL.ParamByName('pIdProduto').AsInteger := lEstoque.Id_produto  ;
      IBSQLUTIL.ParamByName('pIdEstoque').AsInteger :=lEstoque.Id_estoque ;
      IBSQLUTIL.ParamByName('pQuantidade').Value := Quantidade;
      IBSQLUTIL.ExecQuery;
      Result:=True;
    End
    Else
    Begin
    If Quantidade > Estoque.Quantidade  Then
       // Se produto for elástico então Result True
       IBQUtil.Close;
       IBQUtil.SQL.Clear;
       IBQUtil.Sql.Add('SELECT TBPRD_NOME '+
                      ' FROM TB_PRODUTOS '+
                      ' WHERE ID_PRODUTO='+IntToStr(Estoque.Id_produto));
       IBQUtil.Open;
     //  if (Copy(IBQUtil.FieldByName('TBPRD_NOME').AsString,1 ,2)='EL') or
   //       (Copy(IBQUtil.FieldByName('TBPRD_NOME').AsString,1 ,5)='PERSO') then
    //   begin
     sMensagem:= 'A quantidade informada é maior do que o estoque '+
                 'atual deste produto, o estoque ficará negativo.' +
                 'Deseja continuar?' ;
     if  tFrmMensagens.Mensagem(sMensagem,'Q',[mbSIM, mbNAO]) Then
     Begin
       IBSQLUTIL.Close;
       IBSQLUTIL.SQL.Clear;
       IBSQLUTIL.Sql.Add('UPDATE TB_ESTOQUE ' +
                        ' SET ' +
                        ' TBES_QUANTI =TBES_QUANTI - :pQuantidade ' +
                        ' WHERE ID_PRODUTO=:pIdProduto ' +
                        ' AND ID_ESTOQUE= :pIdEstoque ');
       IBSQLUTIL.ParamByName('pIdProduto').AsInteger := lEstoque.Id_produto  ;
       IBSQLUTIL.ParamByName('pIdEstoque').AsInteger :=lEstoque.Id_estoque ;
       IBSQLUTIL.ParamByName('pQuantidade').Value := Quantidade;
       IBSQLUTIL.ExecQuery;
       Result:=True;
     end;
   //    end ;
     //  else
     //      tFrmMensagens.Mensagem('A quantidade informada é maior do que o estoque '+
     //                             'atual deste produto, favor lançar estoque antes.' ,'E',[mbOK]);


    end;
  End;
  If Operacao ='S' Then
  Begin
    IBSQLUTIL.Close;
    IBSQLUTIL.SQL.Clear;
    IBSQLUTIL.Sql.Add('UPDATE TB_ESTOQUE ' +
                      ' SET ' +
                      ' TBES_QUANTI = TBES_QUANTI + :pQuantidade ' +
                      'WHERE ID_ESTOQUE=:pIdEstoque ' );
    IBSQLUTIL.ParamByName('pIdEstoque').AsInteger :=lEstoque.Id_estoque;
    IBSQLUTIL.ParamByName('pQuantidade').Value := lEstoque.Quantidade ;
    IBSQLUTIL.ExecQuery;
    Result:=True;
  End;


end;

procedure TFrmNPedido.FormShow(Sender: TObject);
begin
   QuantItens :=0;
   IBQPrazos.Open;
   IBSQLUTIL.Close;
   IBSQLUTIL.SQL.Clear;
   IBSQLUTIL.SQL.Add('SELECT MAX(ID_PEDIDO) FROM TB_PEDIDOS');
   IBSQLUTIL.ExecQuery;
   IdPedido:= IBSQLUTIL.FieldByName('MAX').AsInteger+1;
   DSPrazos.DataSet.First;
end;

function TFrmNPedido.NumPed: String;
Var StrNumPed:String;
    Tamanho:Integer;
    NumPed:Integer;
Const ZEROS ='00000';
begin
//
  IBSQLUTIL.Close;
  IBSQLUTIL.Sql.Clear;
  IBSQLUTIL.Sql.Add('SELECT NUMPED FROM TB_NUMPED');
  IBSQLUTIL.ExecQuery;
  NumPed:=  IBSQLUTIL.FieldByName('NUMPED').AsInteger;
  StrNumPed := IBSQLUTIL.FieldByName('NUMPED').AsString;
  Tamanho:= Length (StrNumPed);
  StrNumPed:= 'DO' +Copy (ZEROS, Tamanho, Length(ZEROS))+StrNumPed;
  IBSQLUTIL.Close;
  IBSQLUTIL.Sql.Clear;
  IBSQLUTIL.Sql.Add('UPDATE TB_NUMPED '+
                    ' SET NUMPED='+IntTosTr(NumPed+1) +
                    ' WHERE NUMPED=:pNumero');
  IBSQLUTIL.ParamByName('pNumero').AsString:=IntToStr(NumPed);
  IBSQLUTIL.ExecQuery;
  Result:=StrNumPed;

end;

procedure TFrmNPedido.PNGBRemoverProdClick(Sender: TObject);
var lEstoque: TEstoque;
begin
  If Not CDSItensPedido.IsEmpty Then
  Begin

    if (tFrmMensagens.Mensagem('Deleja deletar este produto?','Q',[mbSim, mbNao])) then
    Begin
      Try

        lEstoque := TEstoque.Create;
        lEstoque.Id_estoque:=CDSItensPedidoID_ESTOQUE.AsInteger;
        lEstoque.Quantidade:=CDSItensPedidoTBITPED_QUANT.Value;

        AtualizaEstoque(lEstoque ,lEstoque.Quantidade ,'S');
        CDSItensPedido.Delete;
        QuantItens:=QuantItens-1;


       atualizarTotal;
      finally
        lEstoque.Free;
        if QuantItens <= 0 then
        begin
           PNGBRemoverProd.Enabled := False;
           PNGBAtualizar.Enabled   := False;
        end;
       End;
    End;
  End;
end;

procedure TFrmNPedido.DBEditCliExit(Sender: TObject);
begin
  If DBEditCli.Text <> EmptyStr then
  Begin
    IBSQLCliente.Close;
    IBSQLCliente.SQL.Clear;
    IBSQLCliente.SQL.add('SELECT * FROM TB_CLIENTES '+
                         ' WHERE TBCLI_NOME LIKE '''+DBEditCli.Text+'%''');
    IBSQLCliente.ExecQuery ;
    If Not IBSQLCliente.Eof Then
    Begin
       FrmPrincipal.IdCliente := IBSQLCliente.FieldByName('ID_CLIENTE').AsInteger;
       IBTbPedidosTBPED_NOME.AsString     := IBSQLCliente.FieldByName('TBCLI_NOME').AsString ;
       IBTbPedidosTBPED_ENDERECO.AsString := IBSQLCliente.FieldByName('TBCLI_ENDERECO').AsString;
       IBTbPedidosTBPED_BAIRRO.AsString   := IBSQLCliente.FieldByName('TBCLI_BAIRRO').AsString;
       IBTbPedidosTBPED_CIDADE.AsString   := IBSQLCliente.FieldByName('TBCLI_CIDADE').AsString;
       IBTbPedidosID_PRAZO.AsInteger      := IBSQLCliente.FieldByName('ID_PRAZO').AsInteger ;
       IBTbPedidosTBPED_CEP.AsString      := IBSQLCliente.FieldByName('CEP').AsString;
       IBTbPedidosTBPED_ESTADO.AsString   := IBSQLCliente.FieldByName('TBCLI_ESTADO').AsString;

       If IBSQLCliente.FieldByName('TBCLI_BOLETO').AsString='S' then
         RadioGroupBoleto.ItemIndex :=0
       else
         RadioGroupBoleto.ItemIndex :=1;

       CalculaPrazos;
    End
    Else
    Begin
      IBTbPedidosID_CLIENTE.AsInteger := 0 ;
      IBTbPedidosTBPED_ENDERECO.AsString :='' ;
      IBTbPedidosTBPED_CIDADE.AsString :=''  ;
      IBTbPedidosTBPED_ESTADO.AsString:='';
      IBTbPedidosTBPED_VENC01.AsString:='';
      IBTbPedidosTBPED_VENC02.AsString:='';
      IBTbPedidosTBPED_VENC03.AsString:='';
    End;

    if (Pos(' ',DBEditCli.Text) =0) Or (Pos(' ', DBEditCli.Text) = Length(DBEditCli.Text))   then
    begin
      tFrmMensagens.Mensagem('Preencher com ao menos nome e sobrenome','E',[mbOK]);
      TDBEdit(Sender).SetFocus;
    end;
  end
  else
    LimparDBEdits; 
end;

procedure TFrmNPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if (ActiveControl is TDBGrid) then
      with TDBGrid(ActiveControl) do
        if selectedindex < (fieldcount -1) then
          selectedindex := selectedindex +1
        else
          selectedindex := 0;
end;

procedure TFrmNPedido.DBEdit1Exit(Sender: TObject);
var Endereco:TEndereco;
begin
  if DBEdit1.Text <> EmptyStr Then
  Begin
    Endereco:=TEndereco.Create;
    Endereco:=FrmPrincipal.RetornaEndereco(DBEdit1.Text);
    If Endereco.Rua <>EmptyStr  Then
      IBTbPedidosTBPED_ENDERECO.AsString := AnsiUpperCase(Endereco.Rua);
    If Endereco.Bairro  <>EmptyStr  Then
       IBTbPedidosTBPED_BAIRRO.AsString  :=AnsiUpperCase(Endereco.Bairro);
    If Endereco.Cidade  <>EmptyStr  Then
      IBTbPedidosTBPED_CIDADE.AsString   :=AnsiUpperCase( Endereco.Cidade) ;
    If Endereco.Estado  <>EmptyStr  Then
      IBTbPedidosTBPED_ESTADO.AsString   :=AnsiUpperCase( Endereco.Estado) ;
   End;

end;

procedure TFrmNPedido.CDSItensPedidoTBITPED_VALUNIChange(Sender: TField);
begin
  CDSItensPedidoTBITPED_VALTOT.AsCurrency :=CDSItensPedidoTBITPED_VALUNI.AsCurrency*CDSItensPedidoTBITPED_QUANT.Value ;
  
end;

procedure TFrmNPedido.CalculaPrazos;
begin
   DBEdit5.Clear;
   DBEdit6.Clear;
   DBEdit7.Clear;
// Calculo de prazos
   IBSQLCliente.Close;
   IBSQLCliente.SQL.Clear;
   IBSQLCliente.SQL.add('SELECT * FROM TB_PRAZOS'+
                        ' WHERE  ID_PRAZO=:pIDPRAZO');
   IBSQLCliente.ParamByName('pIDPRAZO').AsInteger:=  IBTbPedidosID_PRAZO.AsInteger;
   IBSQLCliente.ExecQuery ;
   If  IBSQLCliente.FieldByName('TBPRZ_PRAZO01').AsInteger  <> 0 Then
     Begin
       IBTbPedidosTBPED_VENC01.AsString:= FormatDateTime('dd/mm/yyyy', now()+IBSQLCliente.FieldByName('TBPRZ_PRAZO01').AsInteger);
     end;
    If  IBSQLCliente.FieldByName('TBPRZ_PRAZO02').AsInteger  <> 0 Then
     Begin
       IBTbPedidosTBPED_VENC02.AsString:= FormatDateTime('dd/mm/yyyy', now()+IBSQLCliente.FieldByName('TBPRZ_PRAZO02').AsInteger);
     end;
    If  IBSQLCliente.FieldByName('TBPRZ_PRAZO03').AsInteger  <> 0 Then
     Begin
       IBTbPedidosTBPED_VENC03.AsString:= FormatDateTime('dd/mm/yyyy', now()+IBSQLCliente.FieldByName('TBPRZ_PRAZO03').AsInteger);
     end;
end;

procedure TFrmNPedido.CDSItensPedidoTBITPED_QUANTChange(Sender: TField);
begin

   CDSItensPedidoTBITPED_VALTOT.AsCurrency :=CDSItensPedidoTBITPED_VALUNI.AsCurrency*CDSItensPedidoTBITPED_QUANT.Value ;
end;

procedure TFrmNPedido.GerarContaRec(idpedido: Integer; ValorTotal,
  Valor: Currency; Vencimento: TDate);
begin
  IBSQLUTIL.Close;
  IBSQLUTIL.SQL.Clear;
  IBSQLUTIL.SQL.Add('INSERT INTO TB_CONTAREC '+
                               ' (ID_PEDIDO, '+
                               ' TBCONTAREC_VALORTOTAL, '+
                               ' TBCONTAREC_VALOR, '+
                               ' TBCONTAREC_VENCIMENTO) '+

                   ' VALUES    (:pID_PEDIDO, '+
                           '    :pVALORTOTAL, '+
                           '   :pVALOR, '+
                           '   :pVENCIMENTO) ');
  IBSQLUTIL.ParamByName('pID_PEDIDO').AsInteger  :=  idpedido;
  IBSQLUTIL.ParamByName('pVALORTOTAL').AsCurrency:=  ValorTotal;
  IBSQLUTIL.ParamByName('pVALOR').AsCurrency     :=  Valor;
  IBSQLUTIL.ParamByName('pVENCIMENTO').AsDate    :=  Vencimento;
  IBSQLUTIL.ExecQuery;
end;

procedure TFrmNPedido.atualizarTotal;
Var ValTotal: Currency;
    StrTotal:String;
  
begin
  ValTotal:=0;

  CDSItensPedido.DisableControls;
  CDSItensPedido.First;
  while not CDSItensPedido.Eof do
  begin
    ValTotal:=ValTotal + CDSItensPedidoTBITPED_VALTOT.AsCurrency;
    CDSItensPedido.Next;
  end;
  CDSItensPedido.Last;
  CDSItensPedido.EnableControls;

  EdtValorTotal.Text :='R$ ' + FormatFloat('#,,0.00',ValTotal);


end;

procedure TFrmNPedido.CDSItensPedidoAfterEdit(DataSet: TDataSet);
begin
  AtualizarTotal;
end;

procedure TFrmNPedido.PNGBAtualizarClick(Sender: TObject);
begin
  AtualizarTotal;
end;



procedure TFrmNPedido.DBLookupComboBox1Exit(Sender: TObject);
begin
   If  DBLookupComboBox1.Text <> 'À VISTA' Then
    CalculaPrazos;
end;

procedure TFrmNPedido.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  DBEdit5.Clear;
  DBEdit6.Clear;
  DBEdit7.Clear;
  if DBLookupComboBox1.KeyValue<> Null Then
  begin
    IBTbPedidosID_PRAZO.AsInteger := DBLookupComboBox1.KeyValue;
    If  DBLookupComboBox1.Text <> 'À VISTA' Then
      CalculaPrazos;
  end;    
end;

procedure TFrmNPedido.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
   113: PNGButton1Click(Self);  //Localizar  Cliente   F2
   114: PNGButton4Click(Self);  //Cancelar ou Voltar   F3
   115: PNGBNovoProdClick(Self); //Adicionar produto   F4
   116: if PNGBRemoverProd.Enabled then  //Remover produto  F5
           PNGBRemoverProdClick(Self);
   117: PNGButton5Click(Self);    //Salvar    F6
   118: PNGBAtualizarClick(Self); // Atualizar valores F7 
 end;
end;

procedure TFrmNPedido.LimparDBEdits;
Var CompNo: Integer;
begin
  for CompNo:=0 to FrmNPedido.ComponentCount-1 do
  begin
    if FrmNPedido.Components[CompNo] is TDBEdit then
       (FrmNPedido.Components[CompNo] as TDBEdit).Clear;
     DBEditCli.DataSource.DataSet.ClearFields;       
  end;

end;

End.
