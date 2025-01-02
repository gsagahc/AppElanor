unit UCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, DBClient;

type
  TFrmCadProd = class(TForm)
    PnlBottom: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGBSalvar: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton7: TPNGButton;
    IBUSQLProdutos: TIBUpdateSQL;
    IBQProdutos: TIBQuery;
    IBTbProdutos: TIBTable;
    IBTbProdutosID_PRODUTO: TIntegerField;
    IBTbProdutosTBPRD_NOME: TIBStringField;
    IBSQLProdutos: TIBSQL;
    IBTbProdutosTBPRD_DESCRICAO: TIBStringField;
    DSProdutos: TDataSource;
    PNGButton1: TPNGButton;
    IBTbProdutosTBPRD_UNIDADE: TIBStringField;
    IBTbProdutosTBPRD_NCM: TIBStringField;
    IBTbProdutosTBPRD_CODIGO: TIBStringField;
    IBTbProdutosTBPRD_PRECOCUSTO: TIBBCDField;
    IBTbProdutosTBPRD_PRECOVENDA: TIBBCDField;
    PnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEditNome: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGBSalvarClick(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function gerarCod:String;
    procedure DBEditNomeExit(Sender: TObject);
    function VerificaProdutoUsado(id:string):Boolean;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadProd: TFrmCadProd;

implementation
Uses UPrincipal, UBuscarProdutos, uMensagens, Math;

{$R *.dfm}

procedure TFrmCadProd.PNGButton7Click(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbProdutos.Active then
      IBTbProdutos.Open;
    
    IBTbProdutos.Insert;
    StatusBotoes;
    IBTbProdutosTBPRD_CODIGO.AsString:=gerarCod;   
  Except;

  end;

end;

procedure TFrmCadProd.PNGBSalvarClick(Sender: TObject);
begin
  
  If (IBTbProdutos.State in [dsEdit, dsInsert]) Then
  Begin
    IBTbProdutos.Post;
    FrmPrincipal.IBTMain.Commit;
    StatusBotoes;
  End;
end;

procedure TFrmCadProd.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o produto mostrado?','Q',[mbSim, mbNao])) then
    If Not VerificaProdutoUsado(IBTbProdutosID_PRODUTO.AsString) Then
    begin
      IBTbProdutos.Delete;
      FrmPrincipal.IBTMain.Commit;
    end
    else
     tFrmMensagens.Mensagem('Não é possível deletar este produto, '+
                              'pois o mesmo já foi utilizado' ,'I',[mbOK]);

  StatusBotoes;
end;

procedure TFrmCadProd.PNGButton4Click(Sender: TObject);
begin
  IBTbProdutos.Cancel;
  IBTbProdutos.Close;
  StatusBotoes;
end;

procedure TFrmCadProd.PNGButton6Click(Sender: TObject);
begin
  FrmPrincipal.IdProduto  :=0;
  Application.CreateForm(TFrmBuscarPrd, FrmBuscarPrd);
  FrmBuscarPrd.Caption := 'Localizar produto';
  FrmBuscarPrd.ShowModal;
  If  FrmPrincipal.IdProduto<>0 Then
  begin
    IBTbProdutos.Open;
    if IBTbProdutos.Locate('ID_PRODUTO',  FrmPrincipal.IdProduto ,[loCaseInsensitive, loPartialKey]) Then
      StatusBotoes;
  End;
  FrmBuscarPrd.Free;
end;

procedure TFrmCadProd.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadProd.StatusBotoes;
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

procedure TFrmCadProd.PNGButton1Click(Sender: TObject);
begin
   IBTbProdutos.edit;
  // StatusBotoes;
end;

procedure TFrmCadProd.FormKeyPress(Sender: TObject; var Key: Char);
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

function TFrmCadProd.gerarCod: String;
var Cont:String;
begin
  IBSQLProdutos.Close;
  IBSQLProdutos.SQL.Clear;
  IBSQLProdutos.SQL.Add('SELECT ID_PRODUTO FROM VIEW_IDPRODUTO');
  IBSQLProdutos.ExecQuery;
  Cont:=IntToStr(IBSQLProdutos.FieldByName('ID_PRODUTO').AsInteger+1);
  If Length (Cont)=1 Then
    Cont:='000' + Cont;
  If Length (Cont)=2 Then
    Cont:='00' + Cont;
  If Length (Cont)=3 Then
    Cont:='0' + Cont;

  Result:=Cont;
end;

procedure TFrmCadProd.DBEditNomeExit(Sender: TObject);
begin
  If (IBTbProdutos.State in [dsinsert]) Then
  Begin
    IBSQLProdutos.Close;
    IBSQLProdutos.SQL.Clear;
    IBSQLProdutos.SQL.Add('SELECT TBPRD_NOME '+
                            'FROM TB_PRODUTOS '+
                           'WHERE TBPRD_NOME=:pNome');
    IBSQLProdutos.ParamByName('pNome').AsString:=DBEditNome.Text;
    IBSQLProdutos.ExecQuery;
    If Not  IBSQLProdutos.Eof Then
    Begin
       tFrmMensagens.Mensagem('Já existe um produto com este nome!','E',[mbOK]);
       PNGBSalvar.Enabled:=False;

    End
    Else
      PNGBSalvar.Enabled:= True;
  end;
end;

function TFrmCadProd.VerificaProdutoUsado(id: string): Boolean;
begin
  Result:=False;
  IBSQLProdutos.Close;
  IBSQLProdutos.SQL.Clear;
  IBSQLProdutos.SQL.Add('SELECT ID_PRODUTO FROM TB_ITENSPEDIDO '+
                         'WHERE ID_PRODUTO=:pId_produto');


  IBSQLProdutos.ParamByName('pId_produto').AsString :=id;
  IBSQLProdutos.ExecQuery;
  If Not IBSQLProdutos.Eof then
    Result:=True;

end;

end.
