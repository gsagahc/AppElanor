unit UConsultarEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, pngextra, ExtCtrls,
  StdCtrls, IBSQL, IBUpdateSQL, IBTable;

type
  TFrmConsultarEstoque = class(TForm)
    Panel2: TPanel;
    PNGButton2: TPNGButton;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    DsEstoque: TDataSource;
    PnlTotal: TPanel;
    IBQUTIL: TIBQuery;
    IBQEstoque: TIBQuery;
    IBQEstoqueTBPRD_NOME: TIBStringField;
    IBQEstoqueTBPRD_PRECOVENDA: TIBBCDField;
    IBQEstoqueTBPRD_DESCRICAO: TIBStringField;
    IBQEstoqueTBPRD_UNIDADE: TIBStringField;
    IBQEstoqueTBPRD_CODIGO: TIBStringField;
    IBQEstoqueTBES_FORMATO: TIBStringField;
    IBQEstoqueTBES_TAMANHO: TIBBCDField;
    IBQEstoqueTBES_QUANTI: TIBBCDField;
    PNGButton1: TPNGButton;
    EditProduto: TEdit;
    tmr1: TTimer;
    Label2: TLabel;
    IBUpdateSQLEstoque: TIBUpdateSQL;
    PNGButtonSalvar: TPNGButton;
    IBQEstoqueID_ESTOQUE: TIntegerField;
    Label3: TLabel;
    EdtValor: TEdit;
    IBQEstoquePRECOTOTAL: TFloatField;
    CheckBoxProdutosPeso: TCheckBox;
    CheckBoxSegunda: TCheckBox;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SomarQuantidade;
    procedure tmr1Timer(Sender: TObject);
    procedure EditProdutoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PNGButtonSalvarClick(Sender: TObject);
    procedure CheckBoxProdutosPesoClick(Sender: TObject);
    procedure IBQEstoqueBeforePost(DataSet: TDataSet);
    procedure ExibirEstoqueAtual(StrSql:string);
    function  returnStrSql:string;
    procedure PNGButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarEstoque: TFrmConsultarEstoque;

implementation
Uses Uprincipal, uMensagens, Math, URelEstoqueAtual;

{$R *.dfm}

procedure TFrmConsultarEstoque.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarEstoque.FormShow(Sender: TObject);
begin
  try
    IBQEstoque.Open;
    SomarQuantidade;
    IBQEstoque.First;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao atualizar dados. : '+'FormShow/ ','E',[mbOK], E.Message )
    End;
  end;

end;

Procedure TFrmConsultarEstoque.SomarQuantidade;
Var ValTotal:Currency;
    bmk:TBookmark;
begin
  if not IBQEstoque.IsEmpty then
  begin
    ValTotal:=0;
    bmk:=IBQEstoque.GetBookmark;
    IBQEstoque.DisableControls;
    IBQEstoque.First;
    while not IBQEstoque.eof do
    begin
      ValTotal:=ValTotal+ IBQEstoque.FieldByName('PRECOTOTAL').AsCurrency;
      IBQEstoque.Next;
    end;
    EdtValor.Clear;
    EdtValor.Text:='R$ '+FormatFloat('#,,0.00',ValTotal);
    IBQEstoque.EnableControls;
    IBQEstoque.GotoBookmark(bmk);
  end;


end;

procedure TFrmConsultarEstoque.tmr1Timer(Sender: TObject);
var SSql:string;
begin
  try
    sSql:=returnStrSql;
    IBQEstoque.Close;
    IBQEstoque.SQL.Clear;
    IBQEstoque.SQL.Add(sSql);
    IBQEstoque.Open;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao atualizar dados. : '+'tmr1Timer ' ,'E',[mbOK], E.Message)
    End;
  end;
  SomarQuantidade;
  tmr1.Enabled:=False;
end;

procedure TFrmConsultarEstoque.EditProdutoChange(Sender: TObject);
begin
  tmr1.Enabled:=True;
end;

procedure TFrmConsultarEstoque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If IBQEstoqueTBES_QUANTI.AsInteger <   0  then // condição
  Begin
    Dbgrid1.Canvas.Font.Color:= clRed; // coloque aqui a cor desejada
  End;
    Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TFrmConsultarEstoque.PNGButtonSalvarClick(Sender: TObject);
begin
  try
    IBQEstoque.ApplyUpdates;
    EdtValor.Clear;
    SomarQuantidade;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao salvar dados. : '+'PNGButtonSalvarClick'  ,'E',[mbOK], E.Message)
    End;
  end;
end;

procedure TFrmConsultarEstoque.CheckBoxProdutosPesoClick(Sender: TObject);
begin
  tmr1.Enabled:=True;
end;

procedure TFrmConsultarEstoque.IBQEstoqueBeforePost(DataSet: TDataSet);
begin
  FrmPrincipal.atualizaMovimentacao(IBQEstoqueTBPRD_CODIGO.AsInteger,0,IBQEstoqueTBES_QUANTI.AsFloat,0,'A',IBQEstoqueTBES_FORMATO.AsString);
end;

procedure TFrmConsultarEstoque.ExibirEstoqueAtual(StrSql: string);
Var ValTotal:Currency;
begin
  try
    Application.CreateForm(TFrmRelEstoqueAtual, FrmRelEstoqueAtual);
    FrmRelEstoqueAtual.IBQEstoque.Close;
    FrmRelEstoqueAtual.IBQEstoque.SQL.Clear;
    FrmRelEstoqueAtual.IBQEstoque.SQL.Add(StrSql);
    FrmRelEstoqueAtual.IBQEstoque.Open;
    FrmRelEstoqueAtual.CDSEstoque.CreateDataSet;
    ValTotal:=0;
    FrmRelEstoqueAtual.IBQEstoque.First;
    While Not FrmRelEstoqueAtual.IBQEstoque.Eof do
    begin
      if  FrmRelEstoqueAtual.IBQEstoqueTBES_QUANTI.AsFloat > 0 then
      begin
        FrmRelEstoqueAtual.CDSEstoque.Append;
        FrmRelEstoqueAtual.CDSEstoqueCODIGO.AsInteger        :=FrmRelEstoqueAtual.IBQEstoqueID_PRODUTO1.AsInteger;
        FrmRelEstoqueAtual.CDSEstoqueNOME.AsString           :=FrmRelEstoqueAtual.IBQEstoqueTBPRD_NOME.AsString ;
        FrmRelEstoqueAtual.CDSEstoqueTIPO.AsString           :=FrmRelEstoqueAtual.IBQEstoqueTBES_FORMATO.AsString ;
        FrmRelEstoqueAtual.CDSEstoqueUNDADE.AsString         :=FrmRelEstoqueAtual.IBQEstoqueTBPRD_UNIDADE.AsString;
        FrmRelEstoqueAtual.CDSEstoqueQUANTIDADE.AsFloat      :=FrmRelEstoqueAtual.IBQEstoqueTBES_QUANTI.AsFloat;
        FrmRelEstoqueAtual.CDSEstoquePRECO.AsCurrency        :=FrmRelEstoqueAtual.IBQEstoqueTBPRD_PRECOVENDA.AsCurrency;
        FrmRelEstoqueAtual.CDSEstoqueVALOR.AsCurrency        :=FrmRelEstoqueAtual.IBQEstoqueTBES_QUANTI.AsFloat*FrmRelEstoqueAtual.IBQEstoqueTBPRD_PRECOVENDA.AsCurrency;
        ValTotal:=ValTotal+(FrmRelEstoqueAtual.IBQEstoqueTBES_QUANTI.AsInteger*FrmRelEstoqueAtual.IBQEstoqueTBPRD_PRECOVENDA.AsCurrency);
        FrmRelEstoqueAtual.CDSEstoque.Post;
      end;
      FrmRelEstoqueAtual.IBQEstoque.Next;
    end;
    FrmRelEstoqueAtual.CDSEstoque.First;
     //:=FmtStr  CurrToStr(ValTotal);
    FrmRelEstoqueAtual.QRLValTotal.Caption:='R$ '+  formatfloat('##,###,###.##',ValTotal);

    FrmRelEstoqueAtual.QuickRep1.PreviewModal;
     FrmRelEstoqueAtual.Free;
  except
     on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao gerar relatório de estoque. : '+'ExibirEstoqueAtual'  ,'E',[mbOK], E.Message)
    End;
  end;

end;

function TFrmConsultarEstoque.returnStrSql: string;
var sResultSql:string;
begin
   if (EditProduto.Text='TODOS') or (EditProduto.Text=EmptyStr) Then
   Begin
     sResultSql:= 'SELECT ID_ESTOQUE, '+
                         'TBPRD_NOME, '+
                         'TBPRD_PRECOVENDA, '+
                         'TBPRD_DESCRICAO, '+
                         'TBPRD_UNIDADE, '+
                         'TBPRD_CODIGO, '+
                         'TBES_QUANTI, '+
                         'TBES_FORMATO, '+
                         'TBES_TAMANHO, ' +
                         'TBPRD_PRECOCUSTO, '+
                         'TBPRD_PRECOVENDA, '+
                         'TBPRD_TIPO, '+
                         'TBPRD_NCM, '+
                         'TB_ESTOQUE.ID_PRODUTO AS ID_PRODUTO1,'+
                         ' (TBES_QUANTI * TBPRD_PRECOVENDA) AS PRECOTOTAL '+
                         'FROM TB_ESTOQUE '+
                         'INNER JOIN TB_PRODUTOS '+
                         'ON TB_PRODUTOS.ID_PRODUTO=TB_ESTOQUE.ID_PRODUTO ';
     if not CheckBoxProdutosPeso.Checked then
       sResultSql:=sResultSql +  ' WHERE TBPRD_NOME NOT LIKE ''%CADARÇO%'' ';
     if not CheckBoxSegunda.Checked then
       sResultSql:=sResultSql+' AND TB_PRODUTOS.id_produto<>''78'' '+
                              ' AND TB_PRODUTOS.id_produto<>''132''';

   End
   Else
   If (EditProduto.Text<>EmptyStr)  Then
   Begin
     sResultSql:='SELECT ID_ESTOQUE, '+
                        'TBPRD_NOME, '+
                        'TBPRD_PRECOVENDA, '+
                        'TBPRD_DESCRICAO, '+
                        'TBPRD_UNIDADE, '+
                        'TBPRD_CODIGO, '+
                        'TBES_QUANTI, '+
                        'TBES_FORMATO, '+
                        'TBES_TAMANHO, '+
                        'TBPRD_PRECOCUSTO, '+
                        'TBPRD_PRECOVENDA, '+
                        'TBPRD_TIPO, '+
                        'TBPRD_NCM, '+
                        'TB_ESTOQUE.ID_PRODUTO AS ID_PRODUTO1,'+
                        ' (TBES_QUANTI*TBPRD_PRECOVENDA) AS PRECOTOTAL '+
                        'FROM TB_ESTOQUE '+
                        'INNER JOIN TB_PRODUTOS '+
                        'ON TB_PRODUTOS.ID_PRODUTO=TB_ESTOQUE.ID_PRODUTO '+
                        'WHERE TBPRD_NOME LIKE ''%'+ EditProduto.Text +'%''';
     if not CheckBoxProdutosPeso.Checked then
       sResultSql:=sResultSql+' AND TBPRD_NOME NOT LIKE ''%CADARÇO%'' ';
     if not CheckBoxSegunda.Checked then
       sResultSql:=sResultSql+' AND TB_PRODUTOS.id_produto<>''78'' '+
                              ' AND TB_PRODUTOS.id_produto<>''132''';

   End;
  Result:=sResultSql;

end;

procedure TFrmConsultarEstoque.PNGButton1Click(Sender: TObject);
var sSql:String;
begin
  sSql:=returnStrSql;
  ExibirEstoqueAtual(sSql);
end;

end.
