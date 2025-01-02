unit UGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, TeeProcs, TeEngine, Chart,
  Series, IBSQL, DbChart;

type
  TFrmConsultarPedCli = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    PNGButton2: TPNGButton;
    PNGButton1: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    CBoxProdutos: TComboBox;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    IBQPedidos: TIBQuery;
    IBQuery1ID_PRODUTO: TIntegerField;
    IBQuery1TBITPED_QUANT: TIntegerField;
    IBQuery1TBITPED_VALUNI: TIBBCDField;
    IBQuery1TBITPED_VALTOT: TIBBCDField;
    IBQuery1ID_PEDIDO: TIntegerField;
    IBQuery1TBITPED_UNIDADE: TIBStringField;
    IBQuery1TBITPED_TIPO: TIBStringField;
    IBQuery1TBPED_DATA: TDateField;
    IBQuery1TBPED_NOME: TIBStringField;
    IBQuery1TBPED_NUMPED: TIBStringField;
    IBQuery1TBPRD_NOME: TIBStringField;
    DsPedidos: TDataSource;
    IBSQL1: TIBSQL;
    CDsGrafico: TClientDataSet;
    DsGrafico: TDataSource;
    CDsGraficoData: TDateField;
    CDsGraficoQuantidade: TIntegerField;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPedCli: TFrmConsultarPedCli;

implementation
Uses UPrincipal,  Math;

{$R *.dfm}

procedure TFrmConsultarPedCli.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPedCli.FormShow(Sender: TObject);
Var Pedido:Tpedido;
begin
  IBSQL1.Close;
  IBSQL1.Sql.Clear;
  IBSQL1.SQL.Add(' SELECT DISTINCT TB_ITENSPEDIDO.ID_PRODUTO, '+
                                  'TB_PRODUTOS.TBPRD_NOME '+
                   ' FROM TB_ITENSPEDIDO '+
                  'INNER JOIN TB_PRODUTOS '+
                 '    ON TB_ITENSPEDIDO.ID_PRODUTO=TB_PRODUTOS.ID_PRODUTO');
  IBSQL1.ExecQuery;
  While not  IBSQL1.Eof Do
  Begin
    Pedido:= TPedido.Create;
    Pedido.NomeProd       :=IBSQL1.FieldByName('TBPRD_NOME').AsString;
    Pedido.Id_produto     :=IBSQL1.FieldByName('ID_PRODUTO').AsInteger;
    CBoxProdutos.AddItem(Pedido.NomeProd , Pedido);
    IBSQL1.Next;
  End;
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
  CDsGrafico.CreateDataSet;
  CDsGrafico.Open;
end;

procedure TFrmConsultarPedCli.PNGButton1Click(Sender: TObject);
begin
 
  CDsGrafico.EmptyDataSet;
  IBQPedidos.Close;
  If CBoxProdutos.Text <>'' Then
    IBQPedidos.ParamByName('PIdProduto').AsInteger:=(CBoxProdutos.Items.Objects[CBoxProdutos.ITemIndex] As TPedido).Id_produto;
  IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQPedidos.Open;
  IBQPedidos.DisableControls;
  IBQPedidos.First;
  While Not IBQPedidos.Eof Do
  Begin
    If Not CDsGrafico.Locate('DATA',IBQPedidos.FieldByName('TBPED_DATA').AsString,[lopartialkey]) Then
    begin
      CDsGrafico.Append;
      CDsGraficoData.AsString        := IBQPedidos.FieldByName('TBPED_DATA').AsString;
      CDsGraficoQuantidade.AsInteger := IBQPedidos.FieldByName('TBITPED_QUANT').AsInteger;
      CDsGrafico.Post;
    end
    Else
      Begin
        CDsGrafico.Edit;
        CDsGraficoQuantidade.AsInteger:= CDsGraficoQuantidade.AsInteger+ IBQPedidos.FieldByName('TBITPED_QUANT').AsInteger;
        CDsGrafico.Post; 
      End;
    IBQPedidos.Next;
  End;
  IBQPedidos.EnableControls;
end;

end.
