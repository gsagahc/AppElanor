unit UConsultaPedidosVista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, IBSQL;

type
  TFrmConsultarPedVista = class(TForm)
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
    CBoxClientes: TComboBox;
    Label1: TLabel;
    IBQClientes: TIBQuery;
    DDsClientes: TDataSource;
    IBQPedidosTBPED_CANCELADO: TIBStringField;
    IBQItensPedidoTBITPED_QUANT: TIBBCDField;
    PNGButton8: TPNGButton;
    PNGButton7: TPNGButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure montarSql(Tipo:String);
    procedure PNGButton8Click(Sender: TObject);
    procedure PNGButton7Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPedVista: TFrmConsultarPedVista;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math, URelPedidosdata,
  URelatorioPedidosPrazo, URelatorioPedidosVista;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmConsultarPedVista.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPedVista.PNGButton1Click(Sender: TObject);
begin

  IBQPedidos.Close;
  If (CBoxClientes.Text <>'') AND (CBoxClientes.Text <>'TODOS')  Then
  begin
    montarSql('CLIENTE'); 
    IBQPedidos.ParamByName('pNomeCli').AsString:=(CBoxClientes.Items.Objects[CBoxClientes.ITemIndex] As TPedido).NomeCli;
  end
  Else
    montarSql('TODOS');

  IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQPedidos.ParamByName('pPrazo').AsInteger :=6;
  IBQPedidos.Open;
end;

procedure TFrmConsultarPedVista.DBGrid1DblClick(Sender: TObject);
begin
    IBQItensPedido.Close;
    IBQItensPedido.ParamByName('pID_PEDIDO').AsInteger:=IBQPedidosID_PEDIDO.AsInteger;
    IBQItensPedido.Open;
end;

procedure TFrmConsultarPedVista.PNGButton6Click(Sender: TObject);
begin
  {  Application.CreateForm(TFrmImprePedidos, FrmImprePedidos);
    FrmImprePedidos.IBQImpressaoPed.Close;
    FrmImprePedidos.IBQImpressaoPed.ParamByName('pIDPedido').AsInteger:=Pedido.Id_pedido   ;
    FrmImprePedidos.IBQImpressaoPed.Open;
    FrmImprePedidos.QuickRepEmpresa.PreviewModal; //Empresa
    if (tFrmMensagens.Mensagem('Deleja imprimir a via do cliente?','Q',[mbSim, mbNao])) then
   }
    Application.CreateForm(TFrmRelPedidosVista, FrmRelPedidosVista);
    FrmRelPedidosVista.QuickRep1.PreviewModal;
    FreeAndNil(FrmRelPedidosVista);
end;

procedure TFrmConsultarPedVista.DBGrid1CellClick(Column: TColumn);
begin
  Pedido:=TPedido.Create;
  Pedido.Id_pedido:=IBQPedidosID_PEDIDO.AsInteger;
end;

procedure TFrmConsultarPedVista.FormShow(Sender: TObject);
Var Pedido:Tpedido;
begin
  Pedido            := TPedido.Create;
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
end;


procedure TFrmConsultarPedVista.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsultarPedVista.montarSql(Tipo:String);
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
   If Tipo<>'TODOS' Then
     Sql:= Sql + ' AND TB_PEDIDOS.TBPED_NOME=:pNomeCli ';

   Sql:=Sql+' AND TB_PEDIDOS.ID_PRAZO=:pPrazo '+
            ' AND (TBPED_CANCELADO IS NULL OR TBPED_CANCELADO <>''S'') ' +
            ' ORDER BY TBPED_NUMPED ';
  IBQPedidos.Close;
  IBQPedidos.Sql.Clear;
  IBQPedidos.Sql.Add(Sql);
end;

procedure TFrmConsultarPedVista.PNGButton8Click(Sender: TObject);
begin
  If IBQPedidos.Active then
    IBQPedidos.First;
end;

procedure TFrmConsultarPedVista.PNGButton7Click(Sender: TObject);
begin
   If IBQPedidos.Active then
    IBQPedidos.Last;
end;

end.
