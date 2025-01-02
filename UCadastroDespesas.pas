unit UCadastroDespesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, DBClient;

type
  TFrmCadDespesas = class(TForm)
    PnlBottom: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGBSalvar: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton7: TPNGButton;
    IBUSQLProdutos: TIBUpdateSQL;
    IBTbDespesas: TIBTable;
    IBSQLDespesas: TIBSQL;
    DSCadDespesas: TDataSource;
    PNGButton1: TPNGButton;
    PnlMain: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    DBEditNome: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    IBTbDespesasTBCADDESP_NOME: TIBStringField;
    IBTbDespesasTBCADDESP_TIPO: TIBStringField;
    IBTbDespesasTBCADDESP_DESCRICAO: TIBStringField;
    IBTbDespesasID_CADDESPESAS: TIntegerField;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGBSalvarClick(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditNomeExit(Sender: TObject);
    function VerificaProdutoUsado(id:string):Boolean;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadDespesas: TFrmCadDespesas;

implementation
Uses UPrincipal, UBuscarProdutos, uMensagens, Math;

{$R *.dfm}

procedure TFrmCadDespesas.PNGButton7Click(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbDespesas.Active then
      IBTbDespesas.Open;
    
    IBTbDespesas.Insert;
    StatusBotoes;

  Except;

  end;

end;

procedure TFrmCadDespesas.PNGBSalvarClick(Sender: TObject);
begin
  
  If (IBTbDespesas.State in [dsEdit, dsInsert]) Then
  Begin
    IBTbDespesas.Post;
    FrmPrincipal.IBTMain.Commit;
    StatusBotoes;
  End;
end;

procedure TFrmCadDespesas.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar a despesa mostrado?','Q',[mbSim, mbNao])) then
    If Not VerificaProdutoUsado(IBTbDespesasID_CADDESPESAS.AsString) Then
    begin
      IBTbDespesas.Delete;
      FrmPrincipal.IBTMain.Commit;
    end
    else
     tFrmMensagens.Mensagem('Não é possível deletar este item, '+
                              'pois o mesmo já foi utilizado' ,'I',[mbOK]);

  StatusBotoes;
end;

procedure TFrmCadDespesas.PNGButton4Click(Sender: TObject);
begin
  IBTbDespesas.Cancel;
  IBTbDespesas.Close;
  StatusBotoes;
end;

procedure TFrmCadDespesas.PNGButton6Click(Sender: TObject);
begin
  FrmPrincipal.IdProduto  :=0;
  Application.CreateForm(TFrmBuscarPrd, FrmBuscarPrd);
  FrmBuscarPrd.Caption := 'Localizar produto';
  FrmBuscarPrd.ShowModal;
  If  FrmPrincipal.IdProduto<>0 Then
  begin
    IBTbDespesas.Open;
    if IBTbDespesas.Locate('ID_PRODUTO',  FrmPrincipal.IdProduto ,[loCaseInsensitive, loPartialKey]) Then
      StatusBotoes;
  End;
  FrmBuscarPrd.Free;
end;

procedure TFrmCadDespesas.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadDespesas.StatusBotoes;
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

procedure TFrmCadDespesas.PNGButton1Click(Sender: TObject);
begin
   IBTbDespesas.edit;
  // StatusBotoes;
end;

procedure TFrmCadDespesas.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure TFrmCadDespesas.DBEditNomeExit(Sender: TObject);
begin
  If (IBTbDespesas.State in [dsinsert]) Then
  Begin
    IBSQLDespesas.Close;
    IBSQLDespesas.SQL.Clear;
    IBSQLDespesas.SQL.Add('SELECT TBPRD_NOME '+
                            'FROM TB_PRODUTOS '+
                           'WHERE TBPRD_NOME=:pNome');
    IBSQLDespesas.ParamByName('pNome').AsString:=DBEditNome.Text;
    IBSQLDespesas.ExecQuery;
    If Not  IBSQLDespesas.Eof Then
    Begin
       tFrmMensagens.Mensagem('Já existe um produto com este nome!','E',[mbOK]);
       PNGBSalvar.Enabled:=False;

    End
    Else
      PNGBSalvar.Enabled:= True;
  end;
end;

function TFrmCadDespesas.VerificaProdutoUsado(id: string): Boolean;
begin
  Result:=False;
  IBSQLDespesas.Close;
  IBSQLDespesas.SQL.Clear;
  IBSQLDespesas.SQL.Add('SELECT ID_PRODUTO FROM TB_ITENSPEDIDO '+
                         'WHERE ID_PRODUTO=:pId_produto');


  IBSQLDespesas.ParamByName('pId_produto').AsString :=id;
  IBSQLDespesas.ExecQuery;
  If Not IBSQLDespesas.Eof then
    Result:=True;

end;

end.
