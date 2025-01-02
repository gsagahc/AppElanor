unit UConsMovEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls, pngextra,
  DBClient, DB, IBSQL, IBCustomDataSet, IBQuery;



type
  TFrmConsMovEntrada = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    CBBoxProdutos: TComboBox;
    Label1: TLabel;
    PNGButton1: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    IBSQLUtil: TIBSQL;
    DsEstoque: TDataSource;
    CDSEstoque: TClientDataSet;
    IBSQLUtil1: TIBSQL;
    CBBoxFormato: TComboBox;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    IBQMovEstoque: TIBQuery;
    IBQMovEstoqueTBMOVE_DATA: TDateField;
    IBQMovEstoqueTBMOVE_QUANT: TIBBCDField;
    IBQMovEstoqueTBMOVE_FORMATO: TIBStringField;
    IBQMovEstoqueTBMOVE_TAMANHO: TIBBCDField;
    IBQMovEstoqueTBUSR_NOME: TIBStringField;
    IBQMovEstoqueTBPRD_NOME: TIBStringField;
    IBQMovEstoqueTBMOVE_HORA: TTimeField;
    IBQMovEstoqueTBMOVE_SALDOANT: TIBBCDField;
    IBQMovEstoqueTBES_QUANTI: TIBBCDField;
    IBQMovEstoqueTBMOVE_SOMA: TIBBCDField;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsMovEntrada: TFrmConsMovEntrada;

implementation
Uses UPrincipal, UMensagens, URelEntradasemEStoque;

{$R *.dfm}

procedure TFrmConsMovEntrada.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsMovEntrada.FormShow(Sender: TObject);
var Produto:TProduto;
begin
  if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
  DTPickerIni.Date :=(now-5 );
  DTPickerFin.Date :=Now;
  //Adicionar produtos com entrada bno estoque
  IBSQLUtil.Close;
  IBSQLUtil.SQL.Clear;
  IBSQLUtil.SQL.Add('SELECT DISTINCT TB_PRODUTOS.TBPRD_NOME, '+
                                    'TB_PRODUTOS.ID_PRODUTO  '+
                      'FROM TB_ESTOQUE '+
                     'INNER JOIN TB_PRODUTOS '+
                      '  ON TB_PRODUTOS.ID_PRODUTO=TB_ESTOQUE.ID_PRODUTO '+
                      'ORDER BY TB_PRODUTOS.TBPRD_NOME ASC');
  IBSQLUtil.ExecQuery;
  While Not IBSQLUtil.Eof do
  Begin
    Produto:= TProduto.Create;
    Produto.Nome:=IBSQLUtil.FieldByName('TBPRD_NOME').AsString;
    Produto.Id :=IBSQLUtil.FieldByName('ID_PRODUTO').AsInteger;
    CBBoxProdutos.AddItem(Produto.Nome, Produto);
    IBSQLUtil.Next;

  End;

end;

procedure TFrmConsMovEntrada.PNGButton1Click(Sender: TObject);
Var StrSQL:String;
begin
  StrSql:= 'SELECT TBMOVE_DATA, '+
                  'TBMOVE_QUANT, '+
                  'TBMOVE_FORMATO, '+
                  'TBMOVE_SALDOANT, '+
                  'TBUSR_NOME, '+
                  'TBES_QUANTI, '+
                  'TBPRD_NOME, '+
                  'TBMOVE_SOMA, '+
                  'TBMOVE_HORA, '+
                  'TBMOVE_TAMANHO '+
             'FROM TB_MOVESTOQUE '+
            'INNER JOIN TB_USUARIO '+
              ' ON TB_USUARIO.ID_USUARIO=TB_MOVESTOQUE.ID_USUARIO '+
           ' INNER JOIN TB_PRODUTOS '+
               'ON TB_PRODUTOS.ID_PRODUTO=TB_MOVESTOQUE.ID_PRODUTO '+
          '  INNER JOIN TB_ESTOQUE '+
               'ON TB_ESTOQUE.ID_ESTOQUE=TB_MOVESTOQUE.ID_ESTOQUE  ';
               
  If CBBoxProdutos.Text<>'TODOS' Then
    StrSql:=StrSql+' WHERE TB_MOVESTOQUE.ID_PRODUTO=:pProduto '
  Else
     StrSql:=StrSql+' WHERE TB_MOVESTOQUE.ID_PRODUTO IS  NOT NULL ';

  if CBBoxFormato.Text <>'TODOS' Then
    StrSql:=StrSql+' AND TBMOVE_FORMATO=:pFormato ';


  StrSql:=StrSQL + ' AND TBMOVE_DATA BETWEEN :pDataIni AND :pDataFin' +
                   ' AND (TBMOVE_TIPO=:pTipo OR TBMOVE_TIPO=:pTipo2) ';

  StrSql:= StrSQL + ' ORDER BY TBMOVE_DATA,TBMOVE_HORA';
  IBQMovEstoque.Close;
  IBQMovEstoque.SQL.Clear;
  IBQMovEstoque.SQL.Add(StrSql);
  IBQMovEstoque.ParamByName('pTipo').AsString:='E';
  IBQMovEstoque.ParamByName('pTipo').AsString:='ET';
  if CBBoxProdutos.Text <>'TODOS' Then
    IBQMovEstoque.ParamByName('pProduto').AsInteger  := (CBBoxProdutos.Items.Objects[CBBoxProdutos.ITemIndex] As TProduto).Id;
  if CBBoxFormato.Text <>'TODOS' Then
     IBQMovEstoque.ParamByName('pFormato').AsString  := CBBoxFormato.Text;

  IBQMovEstoque.ParamByName('pDataIni').AsDate    := DTPickerIni.Date;
  IBQMovEstoque.ParamByName('pDataFin').AsDate    := DTPickerFin.Date;

  IBQMovEstoque.Open;
  If  not IBQMovEstoque.IsEmpty Then
    PNGButton6.Enabled :=True
  Else
    PNGButton6.Enabled :=False;
end;

procedure TFrmConsMovEntrada.PNGButton6Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelEntradas,FrmRelEntradas);
  FrmRelEntradas.QuickRep1.PreviewModal;
  FreeAndNil(FrmRelEntradas);
end;

end.
