unit UConsultaPedProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsultaPedData, StdCtrls, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, ComCtrls, pngextra, ExtCtrls;


type
  TFrmConsultarPedProduto = class(TFrmConsultarPedData)
    GroupBox2: TGroupBox;
    IBQProdutos: TIBQuery;
    IBQProdutosID_PRODUTO: TIntegerField;
    IBQProdutosTBPRD_NOME: TIBStringField;
    IBQProdutosTBPRD_CODIGO: TIBStringField;
    EdtProdutos: TEdit;
    procedure FormShow(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPedProduto: TFrmConsultarPedProduto;

implementation

{$R *.dfm}

procedure TFrmConsultarPedProduto.FormShow(Sender: TObject);

begin
  inherited;
  EdtProdutos.SetFocus;
end;

procedure TFrmConsultarPedProduto.PNGButton1Click(Sender: TObject);
begin
  inherited;
  IBQPedidos.Close;
  IBQPedidos.SQL.Clear;
  IBQPedidos.SQL.Add(' SELECT DISTINCT  TB_PEDIDOS.ID_PEDIDO, '+
                     ' TBPED_DATA, '+
                     ' TB_PEDIDOS.id_cliente, '+
                     ' TB_PEDIDOS.TBPED_NOME, '+
                     ' TBPED_ENDERECO, '+
                     ' TBPED_CIDADE, '+
                     ' TBPED_ESTADO, '+
                     ' TBPED_TELEFONE, '+
                     ' TB_PEDIDOS.ID_PRAZO, '+
                     ' TBPED_VALTOTAL,  '+
                     ' TBPED_VENC01, '+
                     ' TBPED_VENC02, '+
                     ' TBPED_VENC03, '+
                     ' TB_PEDIDOS.ID_USUARIO, '+
                     ' TBPED_BAIRRO, '+
                     ' TBPED_CNPJ, '+
                     ' TB_PRAZOS.TBPRZ_NOME, '+
                     ' TBPED_NUMPED, '+
                     ' TB_USUARIO.TBUSR_NOME, '+
                     ' TBPED_CANCELADO, '+
                     ' TBPED_MOTIVOCANCEL '+
                     ' FROM TB_PEDIDOS '+
                     ' INNER JOIN TB_PRAZOS '+
                     ' ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO) '+
                     ' INNER JOIN TB_USUARIO '+
                     ' ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO '+
                     ' INNER JOIN TB_ITENSPEDIDO '+
                     ' ON TB_ITENSPEDIDO.ID_PEDIDO=TB_PEDIDOS.ID_PEDIDO '+
                     ' INNER JOIN TB_PRODUTOS '+
                     ' ON TB_ITENSPEDIDO.ID_PRODUTO=TB_PRODUTOS.ID_PRODUTO '+
                     ' WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin '+
                     ' AND TB_PRODUTOS.TBPRD_NOME LIKE ''%'+EdtProdutos.Text+'%'''+
                     ' ORDER BY TBPED_NUMPED');

  IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQPedidos.Open;
end;


end.
