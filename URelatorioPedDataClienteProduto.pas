unit URelatorioPedDataClienteProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URelatorioPedDataCliente, StdCtrls, Grids, DBGrids, ComCtrls,
  pngextra, ExtCtrls;
Type TProduto= class
     public
     Nome:String;
     Id:Integer;
end;

type
  TFrmRelatorioPedDataCliProd = class(TFrmRelatorioPedDataCli)
    CbBoxProdutos: TComboBox;
    Label5: TLabel;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Produto:TProduto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorioPedDataCliProd: TFrmRelatorioPedDataCliProd;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math, URelPedidosdata;

{$R *.dfm}

procedure TFrmRelatorioPedDataCliProd.PNGButton1Click(Sender: TObject);
var StrSql:string;
begin
  FrmPrincipal.IBQPedidos.Close;
  FrmPrincipal.IBQPedidos.SQL.Clear;
  StrSql:= 'SELECT DISTINCT TB_PEDIDOS.ID_PEDIDO, '+
                    ' TBPED_DATA, '+
                    ' TB_PEDIDOS.id_cliente, '+
                    ' TB_PEDIDOS.TBPED_NOME, '+
                    ' TBPED_ENDERECO, '+
                    ' TBPED_CIDADE, '+
                    ' TBPED_ESTADO, '+
                    ' TBPED_TELEFONE, '+
                    ' TB_PEDIDOS.ID_PRAZO, '+
                    ' TBPED_VALTOTAL, '+
                    ' TBPED_VENC01, '+
                    ' TBPED_VENC02, '+
                    ' TBPED_VENC03, '+
                    ' TBPED_VENC04, '+
                    ' TB_PEDIDOS.ID_USUARIO, '+
                    ' TBPED_BAIRRO, '+
                    ' TBPED_CNPJ, '+
                    ' TB_PRAZOS.TBPRZ_NOME, '+
                    ' TBPED_NUMPED, '+
                    ' TB_USUARIO.TBUSR_NOME, '+
                    ' TBPED_CANCELADO, '+
                    ' TBPED_MOTIVOCANCEL, '+
                    ' OBS '+
         ' FROM TB_PEDIDOS '+
         ' INNER JOIN TB_PRAZOS '+
         ' ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO) '+
         ' INNER JOIN TB_USUARIO '+
         ' ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO '+
         ' INNER JOIN TB_ITENSPEDIDO '+
         ' ON TB_ITENSPEDIDO.ID_PEDIDO=TB_PEDIDOS.ID_PEDIDO '+
         ' INNER JOIN TB_PRODUTOS '+
         ' ON TB_ITENSPEDIDO.ID_PRODUTO=TB_PRODUTOS.ID_PRODUTO ';

         StrSql:= StrSql +' WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin '+
         ' AND TBPED_NOME LIKE ''%' +EdtNome.Text+'%''';
      if CbBoxProdutos.Text<> EmptyStr then
        StrSql:= StrSql + ' AND TB_ITENSPEDIDO.ID_PRODUTO=:pProduto';
  If Not CBoxCancelados.Checked  Then
    StrSql:= StrSql +  ' AND (TBPED_CANCELADO IS NULL or TBPED_CANCELADO<>''S'')';


  StrSql:= StrSql+' ORDER BY TBPED_NUMPED ';
  FrmPrincipal.IBQPedidos.SQL.Add(StrSql);
  FrmPrincipal.IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  FrmPrincipal.IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  if CbBoxProdutos.Text<> EmptyStr then
    FrmPrincipal.IBQPedidos.ParamByName('pProduto').AsInteger:=(CBBoxProdutos.Items.Objects[CBBoxProdutos.ITemIndex] As TProduto).Id;
  FrmPrincipal.IBQPedidos.Open;
  if Not FrmPrincipal.IBQPedidos.IsEmpty then
  begin
    PNGButton6.Enabled :=True;
    PNGButton7.Enabled :=True;
    PNGButton8.Enabled :=True;
  End
  Else
  begin
    PNGButton6.Enabled :=False;
    PNGButton7.Enabled :=False;
    PNGButton8.Enabled :=False;
  end;

end;

procedure TFrmRelatorioPedDataCliProd.FormCreate(Sender: TObject);
begin
  inherited;
  FrmPrincipal.IBQUtil1.Close;
  FrmPrincipal.IBQUtil1.SQL.Clear;
  FrmPrincipal.IBQUtil1.SQL.Add('SELECT ID_PRODUTO,TBPRD_NOME FROM TB_PRODUTOS ORDER BY TBPRD_NOME DESC');
  FrmPrincipal.IBQUtil1.Open;
  while  not FrmPrincipal.IBQUtil1.Eof do
  begin
    Produto:=TProduto.Create;
    Produto.Nome:= FrmPrincipal.IBQUtil1.FieldByname('TBPRD_NOME').AsString;
    Produto.Id  := FrmPrincipal.IBQUtil1.FieldByname('ID_PRODUTO').AsInteger;
    CbBoxProdutos.AddItem(Produto.Nome, Produto);
    FrmPrincipal.IBQUtil1.Next;
  end;
end;

end.
