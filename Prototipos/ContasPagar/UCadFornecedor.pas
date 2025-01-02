unit UCadFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, DBClient;

type
  TFrmCadFornec = class(TForm)
    PnlBottom: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGBSalvar: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton7: TPNGButton;
    IBUSQLFornecedores: TIBUpdateSQL;
    IBQFornecedores: TIBQuery;
    IBTbFornecedores: TIBTable;
    IBSQLFornecedores: TIBSQL;
    DSFornecedores: TDataSource;
    PNGButton1: TPNGButton;
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
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    IBTbFornecedoresTBFOR_NOME: TIBStringField;
    IBTbFornecedoresTBFOR_CNPJ: TIBStringField;
    IBTbFornecedoresTBFOR_ENDERECO: TIBStringField;
    IBTbFornecedoresTBFOR_COMPLEMENTO: TIBStringField;
    IBTbFornecedoresTBFOR_BAIRRO: TIBStringField;
    IBTbFornecedoresTBFOR_CIDADE: TIBStringField;
    IBTbFornecedoresTBFOR_ESTADO: TIBStringField;
    IBTbFornecedoresTBFOR_FONE: TIBStringField;
    IBTbFornecedoresTBFOR_FONE2: TIBStringField;
    IBTbFornecedoresTBFOR_EMAIL: TIBStringField;
    IBTbFornecedoresTBFOR_CONTATO: TIBStringField;
    IBTbFornecedoresTBFOR_WEBSITE: TIBStringField;
    IBTbFornecedoresID_FORNECEDOR: TIntegerField;
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
    function VerificaFornecUsado(id:string):Boolean;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadFornec: TFrmCadFornec;

implementation
Uses UPrincipal, uMensagens, Math, UBuscarFornecedor;

{$R *.dfm}

procedure TFrmCadFornec.PNGButton7Click(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbFornecedores.Active then
      IBTbFornecedores.Open;

    IBTbFornecedores.Insert;
    StatusBotoes;
  Except;

  end;

end;

procedure TFrmCadFornec.PNGBSalvarClick(Sender: TObject);
begin

  If (IBTbFornecedores.State in [dsEdit, dsInsert]) Then
  Begin
    IBTbFornecedores.Post;
    FrmPrincipal.IBTMain.Commit;
    StatusBotoes;
  End;
end;

procedure TFrmCadFornec.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o fornecedor mostrado?','Q',[mbSim, mbNao])) then
    If Not VerificaFornecUsado(IBTbFornecedoresID_FORNECEDOR.AsString) Then
    Begin
      IBTbFornecedores.Delete;
      FrmPrincipal.IBTMain.Commit;
    end  
    else
      tFrmMensagens.Mensagem('Não é possível deletar este fornecedor, '+
                              'pois o mesmo já foi utilizado' ,'I',[mbOK]);
  StatusBotoes;
end;

procedure TFrmCadFornec.PNGButton4Click(Sender: TObject);
begin
  IBTbFornecedores.Cancel;
  IBTbFornecedores.Close;
  StatusBotoes;
end;

procedure TFrmCadFornec.PNGButton6Click(Sender: TObject);
begin
  FrmPrincipal.id_fornecedor  :=0;
  Application.CreateForm(TFrmBuscarFornecedor, FrmBuscarFornecedor);
  FrmBuscarFornecedor.Caption := 'Localizar fornecedor';
  FrmBuscarFornecedor.ShowModal;
  If  FrmPrincipal.id_fornecedor<>0 Then
  begin
    IBTbFornecedores.Open;
    if IBTbFornecedores.Locate('ID_FORNECEDOR',  FrmPrincipal.id_fornecedor ,[loCaseInsensitive, loPartialKey]) Then
      StatusBotoes;
  End;
  FreeAndNil(FrmBuscarFornecedor) ;
end;

procedure TFrmCadFornec.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornec.StatusBotoes;
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

procedure TFrmCadFornec.PNGButton1Click(Sender: TObject);
begin
   IBTbFornecedores.edit;
  // StatusBotoes;
end;

procedure TFrmCadFornec.FormKeyPress(Sender: TObject; var Key: Char);
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

function TFrmCadFornec.gerarCod: String;
var Cont:String;
begin
  IBSQLFornecedores.Close;
  IBSQLFornecedores.SQL.Clear;
  IBSQLFornecedores.SQL.Add('SELECT ID_PRODUTO FROM VIEW_IDPRODUTO');
  IBSQLFornecedores.ExecQuery;
  Cont:=IntToStr(IBSQLFornecedores.FieldByName('ID_PRODUTO').AsInteger+1);
  If Length (Cont)=1 Then
    Cont:='000' + Cont;
  If Length (Cont)=2 Then
    Cont:='00' + Cont;
  If Length (Cont)=3 Then
    Cont:='0' + Cont;

  Result:=Cont;
end;

function TFrmCadFornec.VerificaFornecUsado(id: string): Boolean;
begin
  Result:=False;
  IBSQLFornecedores.Close;
  IBSQLFornecedores.SQL.Clear;
  IBSQLFornecedores.SQL.Add('SELECT ID_FORNECEDOR FROM TB_CONTASPAGAR '+
                           ' WHERE  ID_FORNECEDOR=:pId_fornecedor');
  IBSQLFornecedores.ParamByName('pId_fornecedor').AsString :=id;
  IBSQLFornecedores.ExecQuery;
  If  Not IBSQLFornecedores.Eof then
    Result:=True;
end;

end.
