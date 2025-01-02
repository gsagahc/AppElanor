unit UGraficoVenProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, TeeProcs, TeEngine, Chart,
  Series, IBSQL, DbChart;

type
  TFrmGraficoVenProd = class(TForm)
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
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    IBQPedidos: TIBQuery;
    IBQuery1ID_PRODUTO: TIntegerField;
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
    Chart1: TChart;
    Series1: TLineSeries;
    IBQPedidosTBITPED_QUANT: TIBBCDField;
    EdtProduto: TEdit;
    Panel3: TPanel;
    EdtValorTotal: TEdit;
    Label3: TLabel;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGraficoVenProd: TFrmGraficoVenProd;

implementation
Uses UPrincipal,  Math;

{$R *.dfm}

procedure TFrmGraficoVenProd.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGraficoVenProd.FormShow(Sender: TObject);
Var Pedido:Tpedido;
begin
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
  CDsGrafico.CreateDataSet;
  CDsGrafico.Open;
  PageControl1.ActivePage := TabSheet2;
  EdtProduto.SetFocus;
end;

procedure TFrmGraficoVenProd.PNGButton1Click(Sender: TObject);
Var    cseries: TChartSeries;
       ValTotal:Currency;
begin

  CDsGrafico.EmptyDataSet;
  IBQPedidos.Close;
  IBQPedidos.SQL.Clear;
  IBQPedidos.SQL.Add(' SELECT  TB_ITENSPEDIDO.ID_PRODUTO, '+
                     ' TB_ITENSPEDIDO.TBITPED_QUANT, '+
                     ' TB_ITENSPEDIDO.TBITPED_VALUNI, '+
                     ' TB_ITENSPEDIDO.TBITPED_VALTOT, '+
                     ' TB_ITENSPEDIDO.ID_PEDIDO, '+
                     ' TB_ITENSPEDIDO.TBITPED_UNIDADE, '+
                     ' TB_ITENSPEDIDO.TBITPED_TIPO, '+
                     ' TB_PEDIDOS.TBPED_DATA, ' +
                     ' TB_PEDIDOS.TBPED_NOME, ' +
                     ' TB_PEDIDOS.TBPED_NUMPED, '+
                     ' TB_PRODUTOS.TBPRD_NOME '+
                     ' FROM TB_ITENSPEDIDO '+
                     ' INNER JOIN TB_PEDIDOS '+
                     ' ON TB_ITENSPEDIDO.ID_PEDIDO=TB_PEDIDOS.ID_PEDIDO '+
                     ' INNER JOIN TB_PRODUTOS '+
                     ' ON TB_ITENSPEDIDO.ID_PRODUTO=TB_PRODUTOS.ID_PRODUTO '+
                     ' WHERE TB_PRODUTOS.TBPRD_NOME LIKE ''%'+EdtProduto.Text+'%'''+
                     ' AND TB_PEDIDOS.TBPED_DATA BETWEEN :PDataIni AND :PDataFin '+
                     ' AND (TBPED_CANCELADO<>''S'' OR TBPED_CANCELADO IS NULL) '+
                     ' ORDER BY TB_PEDIDOS.TBPED_DATA');
  IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQPedidos.Open;
  IBQPedidos.DisableControls;
  IBQPedidos.First;
  ValTotal:=0;
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
    ValTotal:=ValTotal+IBQPedidos.FieldByName('TBITPED_VALTOT').AsCurrency;
    IBQPedidos.Next;
  End;
  IBQPedidos.EnableControls;
  //gerar gráfico
  If not CDsGrafico.IsEmpty then
  begin
    Series1.Clear;
    Series1.Marks.Style:=smsPercent;
    CDsGrafico.First;
    While not CDsGrafico.Eof do
    begin
      Series1.Add(CDsGraficoQuantidade.AsInteger,CDsGraficoData.AsString);
      CDsGrafico.Next;
    end;
  end;
  //Calcular Total
  EdtValorTotal.Text :=FormatCurr('R$ #,###.00',ValTotal) ;
  EdtProduto.SetFocus;
end;



end.
