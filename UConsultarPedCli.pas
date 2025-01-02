unit UConsultarPedCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery;

type
  TFrmConsultarPedCli = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    PNGButton1: TPNGButton;
    IBQClientes: TIBQuery;
    DDsClientes: TDataSource;
    Label1: TLabel;
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
    EdtNome: TEdit;
    PNGButton7: TPNGButton;
    PNGButton8: TPNGButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
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
  FrmConsultarPedCli: TFrmConsultarPedCli;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math;

{$R *.dfm}

procedure TFrmConsultarPedCli.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPedCli.FormShow(Sender: TObject);
Var Pedido:Tpedido;
begin
 { IBQClientes.Open;
  While not  IBQClientes.Eof Do
  Begin
    Pedido:= TPedido.Create;
    Pedido.NomeCli     :=IBQClientes.FieldByName('TBPED_NOME').AsString;
    CBoxClientes.AddItem(Pedido.NomeCli , Pedido);
    IBQClientes.Next;
  End; }
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;

end;

procedure TFrmConsultarPedCli.PNGButton1Click(Sender: TObject);
begin
  IBQPedidos.Close;
  IBQPedidos.Sql.Clear;
  IBQPedidos.Sql.Add('SELECT    TB_PEDIDOS.ID_PEDIDO, '+
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
                              ' TBPED_CANCELADO, '+
                              ' TBPED_MOTIVOCANCEL, '+
                              ' OBS '+

                    ' FROM TB_PEDIDOS  '+
                    ' INNER JOIN TB_PRAZOS '+
                    ' ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO) '+
                    ' INNER JOIN TB_USUARIO '+
                    ' ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO '+
                    ' WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin   '+
                    ' AND TB_PEDIDOS.TBPED_NOME LIKE ''%' +EdtNome.Text+'%'''+
                    ' ORDER BY TBPED_NUMPED  ');


  IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQPedidos.Open;
end;

procedure TFrmConsultarPedCli.DBGrid1DblClick(Sender: TObject);
begin
    IBQItensPedido.Close;
    IBQItensPedido.ParamByName('pID_PEDIDO').AsInteger:=IBQPedidosID_PEDIDO.AsInteger;
    IBQItensPedido.Open;
end;

procedure TFrmConsultarPedCli.PNGButton6Click(Sender: TObject);
begin
    Application.CreateForm(TFrmImprePedidos, FrmImprePedidos);
    FrmImprePedidos.IBQImpressaoPed.Close;
    FrmImprePedidos.IBQImpressaoPed.ParamByName('pIDPedido').AsInteger:=IBQPedidosID_PEDIDO.AsInteger;
    FrmImprePedidos.IBQImpressaoPed.Open;

    //FrmImprePedidos.QuickRepEmpresa.Prepare;
       If Not FrmImprePedidos.IBQImpressaoPed.IsEmpty  Then
    Begin
      FrmImprePedidos.MontarCDs;
      FrmImprePedidos.QuickRepEmpresa.PreviewModal; //Empresa
    { if (tFrmMensagens.Mensagem('Deleja imprimir a via do cliente?','Q',[mbSim, mbNao])) then
        FrmImprePedidos.QuickRepCliente.PreviewModal; //Cliente}
    End
    Else
      tFrmMensagens.Mensagem('Este pedido foi cancelado','I',[mbOK]);
   FreeAndNil(FrmImprePedidos);   
end;

procedure TFrmConsultarPedCli.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsultarPedCli.PNGButton8Click(Sender: TObject);
begin
  if IBQPedidos.Active then
    IBQPedidos.First;

end;

procedure TFrmConsultarPedCli.PNGButton7Click(Sender: TObject);
begin
  if IBQPedidos.Active then
    IBQPedidos.Last;
end;

end.
