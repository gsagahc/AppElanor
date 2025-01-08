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
    IBQEstoqueID_PRODUTO: TIntegerField;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SomarQuantidade;
    procedure PNGButton1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure EditProdutoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PNGButtonSalvarClick(Sender: TObject);
    procedure CheckBoxProdutosPesoClick(Sender: TObject);
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
 
  IBQEstoque.Open;
  SomarQuantidade;
  IBQEstoque.First;

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

procedure TFrmConsultarEstoque.PNGButton1Click(Sender: TObject);

Var ValTotal:Currency;
begin
  Application.CreateForm(TFrmRelEstoqueAtual, FrmRelEstoqueAtual);

  FrmRelEstoqueAtual.CDSEstoque.CreateDataSet;
  ValTotal:=0;
  IBQEstoque.DisableControls;
  IBQEstoque.First;
  While Not IBQEstoque.Eof do
  begin
    if  IBQEstoqueTBES_QUANTI.AsFloat > 0 then
    begin
      FrmRelEstoqueAtual.CDSEstoque.Append;
      FrmRelEstoqueAtual.CDSEstoqueCODIGO.AsInteger        :=IBQEstoqueID_PRODUTO.AsInteger;
      FrmRelEstoqueAtual.CDSEstoqueNOME.AsString           :=IBQEstoqueTBPRD_NOME.AsString ;
      FrmRelEstoqueAtual.CDSEstoqueTIPO.AsString           :=IBQEstoqueTBES_FORMATO.AsString ;
      FrmRelEstoqueAtual.CDSEstoqueUNDADE.AsString         :=IBQEstoqueTBPRD_UNIDADE.AsString;
      FrmRelEstoqueAtual.CDSEstoqueQUANTIDADE.AsFloat      :=IBQEstoqueTBES_QUANTI.AsFloat;
      FrmRelEstoqueAtual.CDSEstoquePRECO.AsCurrency        :=IBQEstoqueTBPRD_PRECOVENDA.AsCurrency;
      FrmRelEstoqueAtual.CDSEstoqueVALOR.AsCurrency        :=IBQEstoqueTBES_QUANTI.AsFloat*IBQEstoqueTBPRD_PRECOVENDA.AsCurrency;
      ValTotal                                             :=ValTotal+(IBQEstoqueTBES_QUANTI.AsInteger*IBQEstoqueTBPRD_PRECOVENDA.AsCurrency);
      FrmRelEstoqueAtual.CDSEstoque.Post;
    end;
    IBQEstoque.Next;
  end;
  FrmRelEstoqueAtual.CDSEstoque.First;
   //:=FmtStr  CurrToStr(ValTotal);
  FrmRelEstoqueAtual.QRLValTotal.Caption:='R$ '+  formatfloat('##,###,###.##',ValTotal);

  FrmRelEstoqueAtual.QuickRep1.PreviewModal;
  FrmRelEstoqueAtual.Free;
  IBQEstoque.EnableControls;
//  FrmPrincipal.ExibirEstoqueAtual ;

end;

procedure TFrmConsultarEstoque.tmr1Timer(Sender: TObject);
begin
   if (EditProduto.Text='TODOS') or (EditProduto.Text=EmptyStr) Then
   Begin
     IBQEstoque.Close;
     IBQEstoque.SQL.Clear;
     IBQEstoque.SQL.Add('SELECT ID_ESTOQUE, '+
                        ' TB_PRODUTOS.ID_PRODUTO, '+
                        'TBPRD_NOME, '+
                        'TBPRD_PRECOVENDA, '+
                        'TBPRD_DESCRICAO, '+
                        'TBPRD_UNIDADE, '+
                        'TBPRD_CODIGO, '+
                        'TBES_QUANTI, '+
                        'TBES_FORMATO, '+
                        'TBES_TAMANHO, ' +
                        ' (TBES_QUANTI * TBPRD_PRECOVENDA) AS PRECOTOTAL '+
                        'FROM TB_ESTOQUE '+
                        'INNER JOIN TB_PRODUTOS '+
                        'ON TB_PRODUTOS.ID_PRODUTO=TB_ESTOQUE.ID_PRODUTO ');
     if not CheckBoxProdutosPeso.Checked then
       IBQEstoque.SQL.Add(' WHERE TBPRD_NOME NOT LIKE ''%CADARÇO%'' ');

     if not CheckBoxSegunda.Checked then
       IBQEstoque.SQL.Add(' AND TB_PRODUTOS.id_produto<>''78'' '+
                          ' AND TB_PRODUTOS.id_produto<>''132''');
     IBQEstoque.SQL.Add (' AND TBES_QUANTI >=0 ');
     IBQEstoque.SQL.Add(' ORDER BY TBPRD_NOME');

     IBQEstoque.Open;
   End
   Else
   If (EditProduto.Text<>EmptyStr)  Then
   Begin
     IBQEstoque.Close;
     IBQEstoque.SQL.Clear;
     IBQEstoque.SQL.Add('SELECT ID_ESTOQUE, '+
                        ' TB_PRODUTOS.ID_PRODUTO, '+
                        'TBPRD_NOME, '+
                        'TBPRD_PRECOVENDA, '+
                        'TBPRD_DESCRICAO, '+
                        'TBPRD_UNIDADE, '+
                        'TBPRD_CODIGO, '+
                        'TBES_QUANTI, '+
                        'TBES_FORMATO, '+
                        'TBES_TAMANHO, '+
                        ' (TBES_QUANTI*TBPRD_PRECOVENDA) AS PRECOTOTAL '+
                        'FROM TB_ESTOQUE '+
                        'INNER JOIN TB_PRODUTOS '+
                        'ON TB_PRODUTOS.ID_PRODUTO=TB_ESTOQUE.ID_PRODUTO '+
                        'WHERE TBPRD_NOME LIKE ''%'+ EditProduto.Text +'%'''+
                        ' AND TBES_QUANTI >=0 ');
      if not CheckBoxProdutosPeso.Checked then
        IBQEstoque.SQL.Add(' AND TBPRD_NOME NOT LIKE ''%CADARÇO%'' ');
      if not CheckBoxSegunda.Checked then
       IBQEstoque.SQL.Add(' AND TB_PRODUTOS.id_produto<>''78'' '+
                          ' AND TB_PRODUTOS.id_produto<>''132''');

      IBQEstoque.SQL.Add(' ORDER BY TBPRD_NOME');
     IBQEstoque.Open;
   End;
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
  IBQEstoque.ApplyUpdates;
  EdtValor.Clear;
  SomarQuantidade;
end;

procedure TFrmConsultarEstoque.CheckBoxProdutosPesoClick(Sender: TObject);
begin
  tmr1.Enabled:=True;
end;

end.
