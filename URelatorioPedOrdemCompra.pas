unit URelatorioPedOrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery;

type
  TFrmConsultarPedOrdemCompra = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    PNGButton1: TPNGButton;
    Label2: TLabel;
    PnlItens: TPanel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    EdtOC: TEdit;
    Label1: TLabel;
    CBoxCancelados: TCheckBox;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPedOrdemCompra: TFrmConsultarPedOrdemCompra;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math,
  URelatorioPedData_e_OC, URelPedidosdata;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmConsultarPedOrdemCompra.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPedOrdemCompra.PNGButton1Click(Sender: TObject);
Var StrSql:string;
begin
  FrmPrincipal.IBQPedidos_OBS.Close;
  FrmPrincipal.IBQPedidos_OBS.SQL.Clear;
  StrSql:= 'SELECT    TB_PEDIDOS.ID_PEDIDO, '+
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
                    ' TB_PEDIDOS.OBS, '+
                    ' TBITPED_QUANT  '+

         ' FROM TB_PEDIDOS '+
         ' INNER JOIN TB_PRAZOS '+
         ' ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO) '+
         ' INNER JOIN TB_ITENSPEDIDO '+
         ' ON (TB_PEDIDOS.ID_PEDIDO = TB_ITENSPEDIDO.ID_PEDIDO) '+
         ' INNER JOIN TB_USUARIO '+
         ' ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO '+
         ' WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin '+
         ' AND TB_PEDIDOS.OBS LIKE ''%' +EdtOC.Text+'%''';
  If Not CBoxCancelados.Checked  Then
    StrSql:= StrSql +  ' AND (TBPED_CANCELADO IS NULL or TBPED_CANCELADO<>''S'')';

  StrSql:= StrSql+' ORDER BY TBPED_NUMPED ';
  FrmPrincipal.IBQPedidos_OBS.SQL.Add(StrSql);
  FrmPrincipal.IBQPedidos_OBS.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  FrmPrincipal.IBQPedidos_OBS.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  FrmPrincipal.IBQPedidos_OBS.Open;

End;

procedure TFrmConsultarPedOrdemCompra.DBGrid1DblClick(Sender: TObject);
begin
    FrmPrincipal.IBQItensPedido.Close;
    FrmPrincipal.IBQItensPedido.ParamByName('pID_PEDIDO').AsInteger:=FrmPrincipal.intgrfldIBQPedidos_OBSID_PEDIDO.AsInteger;
    FrmPrincipal.IBQItensPedido.Open;
end;

procedure TFrmConsultarPedOrdemCompra.PNGButton6Click(Sender: TObject);
begin
    Application.CreateForm(TFrmRelPedidosOC, FrmRelPedidosOC);
    FrmRelPedidosOC.Total :=0;
    FrmPrincipal.IBQPedidos_OBS.DisableControls;
    FrmPrincipal.IBQPedidos_OBS.First;
    while not  FrmPrincipal.IBQPedidos_OBS.Eof do
    begin
      If FrmPrincipal.ibstrngfldIBQPedidos_OBSTBPED_CANCELADO.AsString <> 'S' Then
        FrmRelPedidosOC.Total:=FrmRelPedidosOC.Total+ FrmPrincipal.ibcdfldIBQPedidos_OBSTBPED_VALTOTAL.AsCurrency;
      FrmPrincipal.IBQPedidos_OBS.Next;
    End;
    FrmRelPedidosOC.QRLTotal.Caption :='R$ ' + FormatFloat('#,,0.00',FrmRelPedidosOC.Total);
    FrmRelPedidosOC.QuickRep1.PreviewModal;
    FreeAndNil(FrmRelPedidosOC);
    FrmPrincipal.IBQPedidos_OBS.EnableControls;
end;

procedure TFrmConsultarPedOrdemCompra.DBGrid1CellClick(Column: TColumn);
begin
  Pedido:=TPedido.Create;
  Pedido.Id_pedido:=FrmPrincipal.intgrfldIBQPedidos_OBSID_PEDIDO.AsInteger;
end;

procedure TFrmConsultarPedOrdemCompra.FormShow(Sender: TObject);
begin
  FrmPrincipal.IBQPedidos_OBS.Close;
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
end;

procedure TFrmConsultarPedOrdemCompra.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If FrmPrincipal.IBQPedidos_OBS.FieldByName('TBPED_CANCELADO').asString='S'  then // condição
  Begin
    Dbgrid1.Canvas.Font.Color:= clRed; // coloque aqui a cor desejada
    Dbgrid1.Canvas.Font.Style:= [fsStrikeOut];
  End;
    Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

end.
