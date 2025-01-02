unit UConcultaPedCancelado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery;

type
  TFrmConsultarPedCancelado = class(TForm)
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
    IBQPedidosTBPED_CANCELADO: TIBStringField;
    IBQPedidosTBPED_MOTIVOCANCEL: TIBStringField;
    IBQItensPedidoTBITPED_QUANT: TIBBCDField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    PNGButton8: TPNGButton;
    PNGButton7: TPNGButton;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PNGButton8Click(Sender: TObject);
    procedure PNGButton7Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPedCancelado: TFrmConsultarPedCancelado;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmConsultarPedCancelado.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPedCancelado.PNGButton1Click(Sender: TObject);
begin
  IBQPedidos.Close;
  IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQPedidos.Open;
  If not IBQPedidos.IsEmpty Then
  Begin
    If Pedido=Nil Then
      Pedido:=TPedido.Create;
    Pedido.Id_pedido:=IBQPedidosID_PEDIDO.AsInteger;
  End;
end;

procedure TFrmConsultarPedCancelado.DBGrid1DblClick(Sender: TObject);
begin
    IBQItensPedido.Close;
    IBQItensPedido.ParamByName('pID_PEDIDO').AsInteger:=IBQPedidosID_PEDIDO.AsInteger;
    IBQItensPedido.Open;
end;

procedure TFrmConsultarPedCancelado.PNGButton6Click(Sender: TObject);
begin
    Application.CreateForm(TFrmImprePedidos, FrmImprePedidos);
    FrmImprePedidos.IBQImpressaoPed.Close;
    FrmImprePedidos.IBQImpressaoPed.ParamByName('pIDPedido').AsInteger:=Pedido.Id_pedido   ;
    FrmImprePedidos.IBQImpressaoPed.Open;
    FrmImprePedidos.MontarCDs;
    FrmImprePedidos.QuickRepEmpresa.PreviewModal; //Empresa

  {  if (tFrmMensagens.Mensagem('Deleja imprimir a via do cliente?','Q',[mbSim, mbNao])) then
      FrmImprePedidos.QuickRepCliente.PreviewModal; //Cliente}
    FreeAndNil(FrmImprePedidos);   
end;

procedure TFrmConsultarPedCancelado.DBGrid1CellClick(Column: TColumn);
begin
  If  Pedido=Nil Then
    Pedido:=TPedido.Create;
  Pedido.Id_pedido:=IBQPedidosID_PEDIDO.AsInteger;
end;

procedure TFrmConsultarPedCancelado.FormShow(Sender: TObject);
begin
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
end;

procedure TFrmConsultarPedCancelado.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsultarPedCancelado.PNGButton8Click(Sender: TObject);
begin
  if IBQPedidos.Active then
    IBQPedidos.First;
end;

procedure TFrmConsultarPedCancelado.PNGButton7Click(Sender: TObject);
begin
  if IBQPedidos.Active then
    IBQPedidos.Last;
end;

end.
