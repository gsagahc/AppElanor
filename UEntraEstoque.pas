unit UEntraEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TFrmEntEstoque = class(TForm)
    PnlBottom: TPanel;
    PnlMain: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton4: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton7: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    IBUSQLEstoque: TIBUpdateSQL;
    IBQEstoque: TIBQuery;
    IBTbEstoque: TIBTable;
    IBSQLEstoque: TIBSQL;
    DSMovEstoque: TDataSource;
    DBEdit1: TDBEdit;
    IBTbEstoqueID_MOVEESTOQUE: TIntegerField;
    IBTbEstoqueTBMOVE_DATA: TDateField;
    IBTbEstoqueID_ESTOQUE: TIntegerField;
    IBTbEstoqueID_USUARIO: TIntegerField;
    IBTbEstoqueID_PRODUTO: TIntegerField;
    LabelQuantidade: TLabel;
    PNGButton6: TPNGButton;
    IBQProdutos: TIBQuery;
    IBQProdutosID_PRODUTO: TIntegerField;
    IBQProdutosTBPRD_NOME: TIBStringField;
    IBQProdutosTBPRD_DESCRICAO: TIBStringField;
    IBQProdutosTBPRD_CODIGO: TIBStringField;
    DSProdutos: TDataSource;
    CBoxFormato: TComboBox;
    Label4: TLabel;
    IBTbEstoqueTBMOVE_FORMATO: TIBStringField;
    IBTbEstoqueTBMOVE_HORA: TTimeField;
    IBTbEstoqueTBMOVE_TAMANHO: TIBBCDField;
    Labeltamanho: TLabel;
    DBEditTamanho: TDBEdit;
    IBTbEstoqueTBMOVE_QUANT: TIBBCDField;
    DBEditQuantidade: TDBEdit;
    IBTbEstoqueTBMOVE_SALDOANT: TIBBCDField;
    IBTbEstoqueTBMOVE_SOMA: TIBBCDField;
    IBTbEstoqueTBMOVE_TIPO: TIBStringField;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PNGButton6Click(Sender: TObject);
    procedure AtualizaTbEstoque(idProduto, Formato:String);
    function retornaIdEstoque(idProduto:Integer;Formato:String):Integer;
    function SaldoAnterior(idProduto:Integer;Formato:String):Real;
    procedure DBEditQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure CBoxFormatoChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEntEstoque: TFrmEntEstoque;

implementation
Uses UPrincipal,  uMensagens, Math, UBuscarProdutos;

{$R *.dfm}

procedure TFrmEntEstoque.PNGButton7Click(Sender: TObject);
begin

  try
   if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbEstoque.Active then
      IBTbEstoque.Open;

    IBTbEstoque.Insert;
    StatusBotoes;


  Except;

  end;

end;

procedure TFrmEntEstoque.PNGButton5Click(Sender: TObject);
begin
  If (IBTbEstoque.State in [dsEdit, DsInsert]) Then
  Begin
    if (tFrmMensagens.Mensagem('Deseja incluir esta entrada no estoque?','Q',[mbSim, mbNao])) then
    Begin

      If CBoxFormato.ItemIndex <>-1 Then
      Begin
        //Verificar Saldo anterior
        IBTbEstoqueTBMOVE_SALDOANT.Value  :=SaldoAnterior(IBQProdutosID_PRODUTO.AsInteger,CBoxFormato.Text );
        //verificar no estoque se já possui este produto, senão inserir
        AtualizaTbEstoque(IBQProdutosID_PRODUTO.AsString, CBoxFormato.Text   );
        IBTbEstoqueTBMOVE_FORMATO.AsString:=CBoxFormato.Text ;
        IBTbEstoqueTBMOVE_DATA.AsString:=formatdatetime('dd/mm/yyyy', now());
        IBTbEstoqueTBMOVE_HORA.AsString:=formatdatetime('hh:mm', now());
        IBTbEstoqueTBMOVE_TIPO.AsString:='E';
        IBTbEstoqueID_USUARIO.AsInteger:= FrmPrincipal.IdUsuario;
        IBTbEstoqueID_PRODUTO.AsString :=IBQProdutosID_PRODUTO.AsString;
        IBTbEstoqueID_ESTOQUE.AsInteger:=retornaIdEstoque(IBQProdutosID_PRODUTO.AsInteger,IBTbEstoqueTBMOVE_FORMATO.AsString);
        IBTbEstoqueTBMOVE_SOMA.Value :=   IBTbEstoqueTBMOVE_SALDOANT.Value +StrToFloat(DBEditQuantidade.Text) ;

        IBTbEstoque.Post;
        FrmPrincipal.IBTMain.Commit;
        IBQProdutos.Close;
        IBTbEstoque.Close;
        CBoxFormato.ItemIndex :=-1;
        StatusBotoes;
      End
      Else
        tFrmMensagens.Mensagem('Você precisa selecionar um formato','E',[mbOK]);
    End;
  End;
   Labeltamanho.Visible  :=False;
   DBEditTamanho.Visible :=False;
   LabelQuantidade.Caption:='Quantidade (Metros)';

end;

procedure TFrmEntEstoque.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o produtos mostrado?','Q',[mbSim, mbNao])) then
     IBTbEstoque.Delete;
  StatusBotoes;
end;

procedure TFrmEntEstoque.PNGButton4Click(Sender: TObject);
begin
  IBTbestoque.Cancel;
  CBoxFormato.ItemIndex :=-1;
  FrmPrincipal.IBTMain.Rollback;
  IBTbEstoque.Close;
  IBQProdutos.Close; 
  StatusBotoes;
end;

procedure TFrmEntEstoque.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEntEstoque.StatusBotoes;
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
  CBoxFormato.Enabled:=Not CBoxFormato.Enabled;      
end;

procedure TFrmEntEstoque.PNGButton1Click(Sender: TObject);
begin
   IBTbEstoque.edit;
   StatusBotoes;
end;

procedure TFrmEntEstoque.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmEntEstoque.PNGButton6Click(Sender: TObject);
begin
  Application.CreateForm(TFrmBuscarPrd, FrmBuscarPrd);
  FrmBuscarPrd.ShowModal;
  If FrmBuscarPrd.IBQProdutos.Fieldbyname('ID_PRODUTO').AsString <> EmptyStr Then
  Begin
    IBQProdutos.Close;
    IBQProdutos.SQL.Clear;
    IBQProdutos.SQL.Add('SELECT ID_PRODUTO, '+
                                'TBPRD_NOME, '+
                                'TBPRD_DESCRICAO, '+
                                ' TBPRD_CODIGO '+
                          'FROM  TB_PRODUTOS '+
                         ' WHERE ID_PRODUTO= '+
                         FrmBuscarPrd.IBQProdutos.Fieldbyname('ID_PRODUTO').AsString);

    IBQProdutos.Open;
  end;
  FrmBuscarPrd.Free;
end;

procedure TFrmEntEstoque.AtualizaTbEstoque(idProduto, Formato: String);
var StrTamanho:String;
begin
  IBQEstoque.Close;
  IBQEstoque.SQL.Clear;
  IBQEstoque.Sql.Add('SELECT * '+
                       '  FROM TB_ESTOQUE '+
                       ' WHERE  ID_PRODUTO=:pProduto '+
                       ' AND TBES_FORMATO=:pFormato ');
 
  IBQEstoque.ParambyName('pProduto').AsString:=idProduto;
  IBQEstoque.ParambyName('pFormato').AsString:=Formato;
  If DBEditTamanho.Text<> EmptyStr Then
  Begin
    IBQEstoque.Sql.Add(' AND TBES_TAMANHO=:pTamanho ');
    StrTamanho:= StringReplace(DBEditTamanho.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
    IBQEstoque.ParambyName('pTamanho').AsString:=StrTamanho ;
  End;

  IBQEstoque.Open;
  If IBQEstoque.IsEmpty Then
  begin
    IBSQLEstoque.Close;
    IBSQLEstoque.SQL.Clear;
    IBSQLEstoque.Sql.Add('INSERT INTO TB_ESTOQUE '+
                                     '(ID_PRODUTO,'+
                                     'TBES_FORMATO, '+
                                     'TBES_QUANTI, '+
                                     'TBES_TAMANHO) '+
                         ' VALUES '+
                         ' (:pID_PRODUTO, '+
                         ' :pTBES_FORMATO,'+
                         ' :pTBES_QUANTI,'+
                         ' :pTBES_TAMANHO)');
     IBSQLEstoque.ParamByName('pID_PRODUTO').AsString := idProduto;
     IBSQLEstoque.ParamByName('pTBES_FORMATO').AsString:=Formato;
     IBSQLEstoque.ParamByName('pTBES_QUANTI').Value :=StrToFloat(DBEditQuantidade.Text) ;
     IBSQLEstoque.ParamByName('pTBES_TAMANHO').AsString:=StrTamanho;
     IBSQLEstoque.ExecQuery;
  end
  Else
  Begin

    IBSQLEstoque.Close;
    IBSQLEstoque.SQL.Clear;
    IBSQLEstoque.Sql.Add('UPDATE TB_ESTOQUE '+
                         ' SET '+
                         'TBES_QUANTI = :pTBES_QUANTI '+
                          'WHERE '+
                         'ID_PRODUTO = :pOLD_ID_PRODUTO  '+
                         'AND TBES_FORMATO = :pOLD_TBES_FORMATO ');
     If DBEditTamanho.Text<> EmptyStr Then
     Begin
       IBSQLEstoque.Sql.Add(' AND TBES_TAMANHO = :pOLDTBES_TAMANHO ');
       IBSQLEstoque.ParamByName('pOLDTBES_TAMANHO').AsString:=StrTamanho ;
     End;
    IBSQLEstoque.ParamByName('pOLD_ID_PRODUTO').AsString := idProduto;
    IBSQLEstoque.ParamByName('pOLD_TBES_FORMATO').AsString:=Formato;
    IBSQLEstoque.ParamByName('pTBES_QUANTI').Value:=IBQEstoque.FieldByName('TBES_QUANTI').Value  + StrToFloat (DBEditQuantidade.Text);
    IBSQLEstoque.ExecQuery;
  end;


end;

function TFrmEntEstoque.retornaIdEstoque(idProduto:Integer;Formato:String):Integer;
begin
  Result :=0;
  IBSQLEstoque.Close;
  IBSQLEstoque.SQL.Clear;
  IBSQLEstoque.SQL.Add('SELECT ID_ESTOQUE '+
                       'FROM VIEW_ESTOQUES '+
                       'WHERE ID_PRODUTO=:pProduto '+
                       ' AND TBES_FORMATO=:pFormato');
  IBSQLEstoque.ParamByName('pProduto').AsInteger :=idProduto;
  IBSQLEstoque.ParamByName('pFormato').AsString  :=Formato;
  IBSQLEstoque.ExecQuery;
  If Not IBSQLEstoque.Eof Then
    Result :=IBSQLEstoque.FieldByName('ID_ESTOQUE').AsInteger
  Else
  Begin
    IBSQLEstoque.Close;
    IBSQLEstoque.SQL.Clear;
    IBSQLEstoque.SQL.Add('SELECT ID_ESTOQUE '+
                         '  FROM TB_ESTOQUE '+
                          ' WHERE ID_ESTOQUE = '+
                          '(SELECT MAX(ID_ESTOQUE) FROM TB_ESTOQUE)');

    IBSQLEstoque.ExecQuery;
    Result:=IBSQLEstoque.FieldByName('ID_ESTOQUE').AsInteger;
  End;


end;

function TFrmEntEstoque.SaldoAnterior(idProduto: Integer;
  Formato: String):Real ;
begin
  IBSQLEstoque.Close;
  IBSQLEstoque.SQL.Clear;
  IBSQLEstoque.SQL.Add('SELECT TBES_QUANTI '+
                       'FROM VIEW_ESTOQUES '+
                       'WHERE ID_PRODUTO=:pProduto '+
                       ' AND TBES_FORMATO=:pFormato');
  IBSQLEstoque.ParamByName('pProduto').AsInteger :=idProduto;
  IBSQLEstoque.ParamByName('pFormato').AsString  :=Formato;
  IBSQLEstoque.ExecQuery;
  Result :=IBSQLEstoque.FieldByName('TBES_QUANTI').Value;
end;

procedure TFrmEntEstoque.DBEditQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#08] ) then
      key:=#0;
end;

procedure TFrmEntEstoque.CBoxFormatoChange(Sender: TObject);
begin
   If CBoxFormato.Text= 'COM PONTEIRA' then
   Begin
     Labeltamanho.Visible  :=True;
     DBEditTamanho.Visible :=True;
     LabelQuantidade.Caption:='Quantidade (Unidades)';
   End
   Else
   If (CBoxFormato.Text= 'ENFESTADO') OR (CBoxFormato.Text= 'ROLO') then
   Begin
     Labeltamanho.Visible  :=False;
     DBEditTamanho.Visible :=False;
     LabelQuantidade.Caption:='Quantidade (Metros ou quilos)';
   End
   Else
   Begin
     Labeltamanho.Visible  :=False;
     DBEditTamanho.Visible :=False;
     LabelQuantidade.Caption:='Quantidade (Metros)';
   End;

end;

procedure TFrmEntEstoque.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
   113: PNGButton6Click(Self);  //Localizar  produto F2
   114: PNGButton4Click(Self);  //Cancelar ou Voltar  F3
   115: PNGButton7Click(Self); //Adicionar produto  F4
   117: PNGButton5Click(Self);    //Salvar  F6
 end;
end;

end.
