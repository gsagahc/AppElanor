unit UcadContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, DBClient;

type
  TFrmCadContasaPagar = class(TForm)
    PnlBottom: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGBSalvar: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton7: TPNGButton;
    IBUSQLContasPagar: TIBUpdateSQL;
    IBQContasPagar: TIBQuery;
    IBTbContasPagar: TIBTable;
    IBSQLContasPagar: TIBSQL;
    DSContasPagar: TDataSource;
    PNGButton1: TPNGButton;
    PnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    IBTbContasPagarID_CONTASPAGAR: TIntegerField;
    IBTbContasPagarTBCONT_NUMNOTA: TIBStringField;
    IBTbContasPagarTBCONT_EMISSAO: TDateField;
    IBTbContasPagarID_FORNECEDOR: TIntegerField;
    IBTbContasPagarTBCONT_VALORNOTA: TIBBCDField;
    IBTbContasPagarTBCONT_VENCIMENTO: TDateField;
    IBTbContasPagarTBCONT_VALOR: TIBBCDField;
    IBTbContasPagarTBCONT_STATUS: TIBStringField;
    PNGButton5: TPNGButton;
    DsFornecedor: TDataSource;
    IBQFornecedor: TIBQuery;
    IBQFornecedorID_FORNECEDOR: TIntegerField;
    IBQFornecedorTBFOR_NOME: TIBStringField;
    DBEdit2: TDBEdit;
    IBTbContasPagarTBCONT_DATAPAG: TDateField;
    IBTbContasPagarTBCONT_DESCRICAO: TIBStringField;
    Label4: TLabel;
    DBEdit4: TDBEdit;
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
    procedure PNGButton5Click(Sender: TObject);
   
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadContasaPagar: TFrmCadContasaPagar;

implementation
Uses UPrincipal, uMensagens, Math, UBuscarContas, UBuscarFornecedor;

{$R *.dfm}

procedure TFrmCadContasaPagar.PNGButton7Click(Sender: TObject);
begin

  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbContasPagar.Active then
      IBTbContasPagar.Open;


    IBTbContasPagar.Insert;
    StatusBotoes;

  Except;

  end;

end;

procedure TFrmCadContasaPagar.PNGBSalvarClick(Sender: TObject);
begin  If (IBTbContasPagar.State in [dsEdit, dsInsert]) Then
  Begin
    if Not IBQFornecedor.IsEmpty then
    Begin
      IBTbContasPagarID_FORNECEDOR.AsInteger :=IBQFornecedorID_FORNECEDOR.AsInteger;
      IBTbContasPagar.Post;
      FrmPrincipal.IBTMain.Commit;
      StatusBotoes;
      FrmPrincipal.atualizarTreeView
    end;
  End;
end;

procedure TFrmCadContasaPagar.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja a conta mostrada?','Q',[mbSim, mbNao])) then
     IBTbContasPagar.Delete;
  StatusBotoes;
end;

procedure TFrmCadContasaPagar.PNGButton4Click(Sender: TObject);
begin
  IBTbContasPagar.Cancel;
  IBTbContasPagar.Close;
  StatusBotoes;
end;

procedure TFrmCadContasaPagar.PNGButton6Click(Sender: TObject);
begin
  FrmPrincipal.id_contapagar  :=0;
  Application.CreateForm(TFrmBuscarContas, FrmBuscarContas);
  FrmBuscarContas.Caption := 'Localizar contas a pagar';
  FrmBuscarContas.ShowModal;
  If  FrmPrincipal.id_contapagar<>0 Then
  begin
    IBTbContasPagar.Open;
    if IBTbContasPagar.Locate('ID_CONTASPAGAR',  FrmPrincipal.id_contapagar ,[loCaseInsensitive, loPartialKey]) Then
    Begin
       StatusBotoes;
       IBQFornecedor.Close;
       IBQFornecedor.ParamByName('pFornecedor').AsInteger:=IBTbContasPagarID_FORNECEDOR.AsInteger;
       IBQFornecedor.Open;
    end;
  End;
  FreeAndNil(FrmBuscarContas);
end;

procedure TFrmCadContasaPagar.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadContasaPagar.StatusBotoes;
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

procedure TFrmCadContasaPagar.PNGButton1Click(Sender: TObject);
begin
  IBTbContasPagar.Edit;    
 
end;

procedure TFrmCadContasaPagar.FormKeyPress(Sender: TObject; var Key: Char);
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

function TFrmCadContasaPagar.gerarCod: String;
var Cont:String;
begin
  IBSQLContasPagar.Close;
  IBSQLContasPagar.SQL.Clear;
  IBSQLContasPagar.SQL.Add('SELECT ID_PRODUTO FROM VIEW_IDPRODUTO');
  IBSQLContasPagar.ExecQuery;
  Cont:=IntToStr(IBSQLContasPagar.FieldByName('ID_PRODUTO').AsInteger+1);
  If Length (Cont)=1 Then
    Cont:='000' + Cont;
  If Length (Cont)=2 Then
    Cont:='00' + Cont;
  If Length (Cont)=3 Then
    Cont:='0' + Cont;

  Result:=Cont;
end;

procedure TFrmCadContasaPagar.PNGButton5Click(Sender: TObject);
begin
  FrmPrincipal.id_fornecedor  :=0;
  Application.CreateForm(TFrmBuscarFornecedor, FrmBuscarFornecedor);
  FrmBuscarFornecedor.Caption := 'Localizar fornecedor';
  FrmBuscarFornecedor.ShowModal;
  If  FrmPrincipal.id_fornecedor <>0 Then
  begin
    IBQFornecedor.Close; 
    IBQFornecedor.ParamByName('pFornecedor').AsInteger:=FrmPrincipal.id_fornecedor;
    IBQFornecedor.Open;

  End;
  FreeAndNil(FrmBuscarFornecedor) ;

end;



end.
