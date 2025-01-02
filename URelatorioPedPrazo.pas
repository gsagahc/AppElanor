unit URelatorioPedPrazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, IBSQL;

type
  TFrmConsultarPedPrazo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    PNGButton1: TPNGButton;
    IBQPedidos: TIBQuery;
    DsPedidos: TDataSource;
    PnlItens: TPanel;
    DBGrid2: TDBGrid;
    IBQPedidosID_PEDIDO: TIntegerField;
    IBQPedidosTBPED_DATA: TDateField;
    IBQPedidosID_CLIENTE: TIntegerField;
    IBQPedidosTBPED_NOME: TIBStringField;
    IBQPedidosTBPED_ENDERECO: TIBStringField;
    IBQPedidosTBPED_CIDADE: TIBStringField;
    IBQPedidosTBPED_ESTADO: TIBStringField;
    IBQPedidosTBPED_TELEFONE: TIBStringField;
    IBQPedidosID_PRAZO: TIntegerField;
    IBQPedidosTBPED_VALTOTAL: TIBBCDField;
    IBQPedidosTBPED_VENC01: TDateField;
    IBQPedidosTBPED_VENC02: TDateField;
    IBQPedidosTBPED_VENC03: TDateField;
    IBQPedidosID_USUARIO: TIntegerField;
    IBQPedidosTBPED_BAIRRO: TIBStringField;
    IBQPedidosTBPED_CNPJ: TIBStringField;
    IBQPedidosTBPRZ_NOME: TIBStringField;
    IBQPedidosTBPED_NUMPED: TIBStringField;
    IBQItensPedido: TIBQuery;
    DSItens: TDataSource;
    IBQItensPedidoTBPRD_NOME: TIBStringField;
    IBQItensPedidoTBITPED_VALUNI: TIBBCDField;
    IBQItensPedidoTBITPED_VALTOT: TIBBCDField;
    IBQItensPedidoTBITPED_UNIDADE: TIBStringField;
    IBQItensPedidoTBITPED_TIPO: TIBStringField;
    IBQItensPedidoID_ITENSPEDIDO: TIntegerField;
    Panel3: TPanel;
    Label4: TLabel;
    IBQPedidosTBUSR_NOME: TIBStringField;
    Panel4: TPanel;
    Label1: TLabel;
    IBQClientes: TIBQuery;
    DDsClientes: TDataSource;
    IBQPedidosTBPED_CANCELADO: TIBStringField;
    IBQItensPedidoTBITPED_QUANT: TIBBCDField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    PNGButton8: TPNGButton;
    PNGButton7: TPNGButton;
    EditCliente: TEdit;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure montarSql;
    procedure PNGButton8Click(Sender: TObject);
    procedure PNGButton7Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPedPrazo: TFrmConsultarPedPrazo;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math, URelPedidosdata,
  URelatorioPedidosPrazo;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmConsultarPedPrazo.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPedPrazo.PNGButton1Click(Sender: TObject);
begin

  IBQPedidos.Close;
  montarSql;
  IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQPedidos.ParamByName('pPrazo').AsInteger :=6;
  IBQPedidos.Open;
  
end;

procedure TFrmConsultarPedPrazo.DBGrid1DblClick(Sender: TObject);
begin
    IBQItensPedido.Close;
    IBQItensPedido.ParamByName('pID_PEDIDO').AsInteger:=IBQPedidosID_PEDIDO.AsInteger;
    IBQItensPedido.Open;
end;

procedure TFrmConsultarPedPrazo.PNGButton6Click(Sender: TObject);
begin
    Application.CreateForm(TFrmRelPedidosPrazo, FrmRelPedidosPrazo);
    FrmRelPedidosPrazo.QuickRep1.PreviewModal;
    FreeAndNil(FrmRelPedidosPrazo);
end;

procedure TFrmConsultarPedPrazo.DBGrid1CellClick(Column: TColumn);
begin
  Pedido:=TPedido.Create;
  Pedido.Id_pedido:=IBQPedidosID_PEDIDO.AsInteger;
end;

procedure TFrmConsultarPedPrazo.FormShow(Sender: TObject);
Var Pedido:Tpedido;
begin
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
 { Pedido            := TPedido.Create;
  Pedido.NomeCli    :='TODOS';
  CBoxClientes.AddItem(Pedido.NomeCli , Pedido);
  IBQClientes.Open;
  While not  IBQClientes.Eof Do
  Begin
    Pedido:= TPedido.Create;
    Pedido.NomeCli     :=IBQClientes.FieldByName('TBPED_NOME').AsString;
    CBoxClientes.AddItem(Pedido.NomeCli , Pedido);
    IBQClientes.Next;
  End;
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
  If CBoxClientes.Items.Count>0 Then
    CBoxClientes.ItemIndex:=0;
  }  
end;


procedure TFrmConsultarPedPrazo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If IBQPedidos.FieldByName('TBPED_CANCELADO').asString='S'  then // condição
  Begin
    Dbgrid1.Canvas.Font.Color:= clRed; // coloque aqui a cor desejada
    Dbgrid1.Canvas.Font.Style:= [fsStrikeOut];
  End;
    Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TFrmConsultarPedPrazo.montarSql;
var Sql:String;
begin
  Sql:='SELECT    TB_PEDIDOS.ID_PEDIDO, '+
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
           ' TB_PEDIDOS.ID_USUARIO, '+
           ' TBPED_BAIRRO, '+
           ' TBPED_CNPJ, '+
           ' TB_PRAZOS.TBPRZ_NOME, '+
           ' TBPED_NUMPED, '+
           ' TB_USUARIO.TBUSR_NOME, '+
           ' TBPED_CANCELADO '+
   ' FROM TB_PEDIDOS '+
   ' INNER JOIN TB_PRAZOS '+
      ' ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO) '+
   ' INNER JOIN TB_USUARIO '+
      ' ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO '+
   ' WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin ';

     Sql:= Sql + ' AND TB_PEDIDOS.TBPED_NOME LIKE ''%' + EditCliente.Text+ '%''' ;

   Sql:=Sql+' AND TB_PEDIDOS.ID_PRAZO<>:pPrazo '+
            'AND (TBPED_CANCELADO IS NULL OR TBPED_CANCELADO <>''S'') '+
            ' ORDER BY TBPED_NUMPED ';
  IBQPedidos.Close;
  IBQPedidos.Sql.Clear;
  IBQPedidos.Sql.Add(Sql);
end;

procedure TFrmConsultarPedPrazo.PNGButton8Click(Sender: TObject);
begin
  if IBQPedidos.Active then
    IBQPedidos.First;
end;

procedure TFrmConsultarPedPrazo.PNGButton7Click(Sender: TObject);
begin
   if IBQPedidos.Active then
     IBQPedidos.First;
end;

end.
