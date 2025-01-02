unit UCadCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, DBClient, Provider;

type
  TFrmCadCli = class(TForm)
    PnlBottom: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton7: TPNGButton;
    IBUSQLClientes: TIBUpdateSQL;
    IBQClientes: TIBQuery;
    IBTbClientes: TIBTable;
    IBSQLClientes: TIBSQL;
    DSClientes: TDataSource;
    PNGButton1: TPNGButton;
    IBTbClientesTBCLI_NOME: TIBStringField;
    IBTbClientesTBCLI_ENDERECO: TIBStringField;
    IBTbClientesTBCLI_COMPLEMENTO: TIBStringField;
    IBTbClientesTBCLI_TELEFONE: TIBStringField;
    IBTbClientesTBCLI_BAIRRO: TIBStringField;
    IBTbClientesTBCLI_CIDADE: TIBStringField;
    IBTbClientesID_PRAZO: TIntegerField;
    IBQPrazos: TIBQuery;
    DSPrazos: TDataSource;
    IBTbClientesID_CLIENTE: TIntegerField;
    IBQPrazosID_PRAZO: TIntegerField;
    IBQPrazosTBPRZ_NOME: TIBStringField;
    IBTbClientesTBCLI_ESTADO: TIBStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBLookupListBox1: TDBLookupListBox;
    DBEdit8: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    IBQProdutos: TIBQuery;
    IBQProdutosID_PRODUTO: TIntegerField;
    IBQProdutosTBPRD_NOME: TIBStringField;
    PanelBotoesProd: TPanel;
    PNGButton8: TPNGButton;
    PNGButton9: TPNGButton;
    DSProdutos: TDataSource;
    CDSPrecos: TClientDataSet;
    DSPrecos: TDataSource;
    CDSPrecosNOME: TStringField;
    CDSPrecosID_CLIENTE: TIntegerField;
    CDSPrecosPRECO: TCurrencyField;
    IBSQLPrecos: TIBSQL;
    CDSPrecosID_PRODUTO: TIntegerField;
    CDSPrecosID_PRECO: TIntegerField;
    IBTbPrecos: TIBTable;
    IBTbPrecosID_PRECOSCLI: TIntegerField;
    IBTbPrecosID_CLIENTE: TIntegerField;
    IBTbPrecosID_PRODUTO: TIntegerField;
    IBTbPrecosTBPRECLI_PRECO: TIBBCDField;
    IBTbClientesCEP: TIBStringField;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    IBTbClientesTBCLI_CNPJ: TIBStringField;
    DBRadioGroup1: TDBRadioGroup;
    IBTbClientesTBCLI_BOLETO: TIBStringField;
    DBRadioGroup2: TDBRadioGroup;
    IBTbClientesTBCLI_SNLOTE: TIBStringField;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet2Show(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton9Click(Sender: TObject);
    procedure PNGButton8Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    function VerificaClienteUsado(id:string):Boolean;
  private
    { Private declarations }
  public
    IdProduto:Integer;
    NomeProd:String;
    PrecoProd:Currency;
    { Public declarations }
  end;

var
  FrmCadCli: TFrmCadCli;

implementation
Uses UPrincipal, UBuscarCliente, uMensagens, Math, UBuscarProdutos,
  UBuscarPadrao, USelecionaProdPreco;

{$R *.dfm}

procedure TFrmCadCli.PNGButton7Click(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbClientes.Active then
      IBTbClientes.Open;
    If  not IBTbPrecos.Active then
      IBTbPrecos.Open;
      
    IBQPrazos.Open;
    IBTbClientes.Insert;
    DBRadioGroup1.ItemIndex:=1;
    DBRadioGroup2.ItemIndex:=1;
    DBEdit1.SetFocus;  
    StatusBotoes;

  Except;

  end;

end;

procedure TFrmCadCli.PNGButton5Click(Sender: TObject);
begin

  If  (IBTbClientes.State in [dsEdit, dsInsert]) Then
  Begin
    if (tFrmMensagens.Mensagem('Confirma a alteração deste cliente?','Q',[mbSim, mbNao])) then
    Begin
      IBTbClientes.Post;
      //Alterar tabela de preços.
      CDSPrecos.First;
      While Not CDSPrecos.Eof  Do
      Begin
        If IBTbPrecos.Locate('ID_PRODUTO', CDSPrecosID_PRODUTO.AsString, [loPartialKey] ) Then
        Begin
          IBTbPrecos.Edit;
          IBTbPrecosTBPRECLI_PRECO.AsCurrency:=CDSPrecosPRECO.AsCurrency;
          IBTbPrecos.Post;
        End
        Else
        Begin
          IBTbPrecos.Insert;
          IBTbPrecosID_CLIENTE.AsInteger      :=CDSPrecosID_CLIENTE.AsInteger;
          IBTbPrecosID_PRODUTO.AsInteger      :=CDSPrecosID_PRODUTO.AsInteger;
          IBTbPrecosTBPRECLI_PRECO.AsCurrency :=CDSPrecosPRECO.AsCurrency;
          IBTbPrecos.Post;
        End;
        CDSPrecos.Next;
      End;
      FrmPrincipal.IBTMain.Commit;
      CDSPrecos.EmptyDataSet;
      StatusBotoes;
    End;
  End;

end;

procedure TFrmCadCli.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar este cliente?','Q',[mbSim, mbNao])) then
  Begin
     If Not VerificaClienteUsado(IBTbClientesID_CLIENTE.AsString) Then
     Begin
       IBTbClientes.Delete;
       FrmPrincipal.IBTMain.Commit;
     end
     else
       tFrmMensagens.Mensagem('Não é possível deletar este cliente, '+
                             'pois o mesmo já foi utilizado' ,'I',[mbOK]);
  End;
  StatusBotoes;
end;

procedure TFrmCadCli.PNGButton4Click(Sender: TObject);
begin
  IBTbClientes.Cancel;
  FrmPrincipal.IBTMain.Rollback;
  CDSPrecos.EmptyDataSet;    
  StatusBotoes;
    
end;

procedure TFrmCadCli.PNGButton6Click(Sender: TObject);
begin
  TabSheet1.Show;
  FrmPrincipal.IdCliente   :=0;
  Application.CreateForm(TFrmBuscarCliente, FrmBuscarCliente);
  FrmBuscarCliente.ShowModal;

  If   FrmBuscarCliente.Cliente  <> Nil then
  Begin
    IBTbClientes.Open;
    IBTbPrecos.Open;
    IBQPrazos.Open;
    if IBTbClientes.Locate('ID_CLIENTE',   FrmBuscarCliente.Cliente.IdCliente   ,[loCaseInsensitive, loPartialKey]) Then
    Begin
      StatusBotoes;
      IBTbPrecos.Filtered:=False;
      IBTbPrecos.Filter:='ID_CLIENTE='+IBTbClientesID_CLIENTE.AsString;
      IBTbPrecos.Filtered:=True;
      CDSPrecos.EmptyDataSet;  
    End;
  End;    
  FreeAndNil(FrmBuscarCliente);


end;

procedure TFrmCadCli.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCli.StatusBotoes;
Var Botao: TPNGButton;
    i:Integer;
begin
   For i:=0 To Self.ComponentCount -1 do
     Begin
       If (Self.Components[i] is TPNGButton) Then
         Begin
           Botao:=(Self.Components[i] as TPNGButton);
           Botao.Enabled := not Botao.Enabled;
         End;
     End;
end;

procedure TFrmCadCli.PNGButton1Click(Sender: TObject);
begin
   IBTbClientes.edit;
  // StatusBotoes;
end;

procedure TFrmCadCli.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmCadCli.TabSheet2Show(Sender: TObject);
begin
  if not FrmPrincipal.IBTMain.Active Then
    FrmPrincipal.IBTMain.StartTransaction;

  IBSQLPrecos.Close;
  IBSQLPrecos.SQL.clear;
  IBSQLPrecos.SQL.add('SELECT * FROM TB_PRECOSCLI '+
                       'INNER JOIN TB_PRODUTOS '+
                     '     ON TB_PRODUTOS.ID_PRODUTO=TB_PRECOSCLI.ID_PRODUTO '+
                      ' INNER JOIN TB_CLIENTES '+
                          'ON TB_CLIENTES.ID_CLIENTE=TB_PRECOSCLI.ID_CLIENTE  '+
                        'WHERE TB_PRECOSCLI.ID_CLIENTE=:pIDCLIENTE ');
  IBSQLPrecos.ParamByName('pIDCLIENTE').AsInteger:=IBTbClientesID_CLIENTE.AsInteger;
  IBSQLPrecos.ExecQuery;
  while not   IBSQLPrecos.Eof do
  Begin
    If Not CDSPrecos.Locate('ID_PRODUTO',IBSQLPrecos.FieldByName('ID_PRODUTO').AsString,[loPartialKey]) Then
    Begin
      CDSPrecos.Append;
      CDSPrecosNOME.AsString:=IBSQLPrecos.FieldByName('TBPRD_NOME').AsString;
      CDSPrecosID_CLIENTE.AsInteger :=IBSQLPrecos.FieldByName('ID_CLIENTE').AsInteger;
      CDSPrecosPRECO.AsCurrency :=IBSQLPrecos.FieldByName('TBPRECLI_PRECO').AsCurrency;
      CDSPrecosID_PRECO.AsInteger :=IBSQLPrecos.FieldByName('ID_PRECOSCLI').AsInteger;
      CDSPrecosID_PRODUTO.AsInteger :=IBSQLPrecos.FieldByName('ID_PRODUTO').AsInteger;
     // CDSPrecos.Post;

    End;
    IBSQLPrecos.Next;
  End;

end;

procedure TFrmCadCli.FormShow(Sender: TObject);
begin
  CDSPrecos.CreateDataSet;
  CDSPrecos.Open;
  PageControl1.Pages[0].Show;  

end;

procedure TFrmCadCli.PNGButton9Click(Sender: TObject);
begin
  IdProduto:=0;
  Application.CreateForm(TFrmSelProdPre, FrmSelProdPre);
  FrmSelProdPre.ShowModal;
  FrmSelProdPre.Free;
  If IdProduto<> 0 Then
  Begin
    CDSPrecos.Append;
    CDSPrecosID_PRODUTO.AsInteger := IdProduto;
    CDSPrecosNOME.AsString        := NomeProd;
    CDSPrecosID_PRECO.AsCurrency  := PrecoProd;
    CDSPrecosID_CLIENTE.AsInteger := IBTbClientesID_CLIENTE.AsInteger;
  End;
end;

procedure TFrmCadCli.PNGButton8Click(Sender: TObject);
begin
  CDSPrecos.Delete;  
end;

procedure TFrmCadCli.DBEdit9Exit(Sender: TObject);
var Endereco:TEndereco;
begin
  if DBEdit9.Text <> EmptyStr Then
  Begin
    Endereco:=TEndereco.Create;
    Endereco:=FrmPrincipal.RetornaEndereco(DBEdit9.Text);
    If Endereco<> Nil Then
    Begin
      If Endereco.Rua <>EmptyStr  Then
        IBTbClientesTBCLI_ENDERECO.AsString := AnsiUpperCase(Endereco.Rua);
      If Endereco.Bairro  <>EmptyStr  Then
         IBTbClientesTBCLI_BAIRRO.AsString  := AnsiUpperCase(Endereco.Bairro);
      If Endereco.Cidade  <>EmptyStr  Then
        IBTbClientesTBCLI_CIDADE.AsString   := AnsiUpperCase(Endereco.Cidade) ;
      If Endereco.Estado  <>EmptyStr  Then
        IBTbClientesTBCLI_ESTADO.AsString   := AnsiUpperCase( Endereco.Estado) ;
    End;
   End;
   FreeAndNil(Endereco); 
end;

function TFrmCadCli.VerificaClienteUsado(id: string): Boolean;
begin
 Result:=False;
 IBSQLClientes.Close;
 IBSQLClientes.SQL.Clear;
 IBSQLClientes.SQL.Add(' SELECT ID_CLIENTE FROM TB_PEDIDOS '+
                       'WHERE  ID_CLIENTE=:pID_cliente');
 IBSQLClientes.ParamByName('pID_cliente').AsString :=id;

 IBSQLClientes.ExecQuery;
 If not IBSQLClientes.Eof then
   Result:=True;
end;

end.
