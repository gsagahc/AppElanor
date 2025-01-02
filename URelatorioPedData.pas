unit URelatorioPedData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery;

type
  TFrmRelatorioPedData = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    PNGButton1: TPNGButton;
    PnlItens: TPanel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    CBoxCancelados: TCheckBox;
    PNGButton7: TPNGButton;
    PNGButton8: TPNGButton;
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
  FrmRelatorioPedData: TFrmRelatorioPedData;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math, URelPedidosdata;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmRelatorioPedData.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorioPedData.PNGButton1Click(Sender: TObject);
begin
  FrmPrincipal.IBQPedidos.Close;
  FrmPrincipal.IBQPedidos.SQL.Clear;
  FrmPrincipal.IBQPedidos.SQL.Add('SELECT    TB_PEDIDOS.ID_PEDIDO, '+
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


                     ' FROM TB_PEDIDOS '+
                     ' INNER JOIN TB_PRAZOS '+
                     ' ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO) '+
                     ' INNER JOIN TB_USUARIO '+
                     ' ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO '+
                     ' WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin ');


  If Not CBoxCancelados.Checked  Then
    FrmPrincipal.IBQPedidos.SQL.Add(' AND (TBPED_CANCELADO IS NULL or TBPED_CANCELADO<>''S'')');

  FrmPrincipal.IBQPedidos.SQL.Add(' ORDER BY TBPED_NUMPED ');
  FrmPrincipal.IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  FrmPrincipal.IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
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

procedure TFrmRelatorioPedData.DBGrid1DblClick(Sender: TObject);
begin
    FrmPrincipal.IBQItensPedido.Close;
    FrmPrincipal.IBQItensPedido.ParamByName('pID_PEDIDO').AsInteger:=FrmPrincipal.IBQPedidosID_PEDIDO.AsInteger;
    FrmPrincipal.IBQItensPedido.Open;
end;

procedure TFrmRelatorioPedData.PNGButton6Click(Sender: TObject);
begin
    Application.CreateForm(TFrmRelPedidos, FrmRelPedidos);
    FrmRelPedidos.Total :=0;
    FrmPrincipal.IBQPedidos.DisableControls;
    FrmPrincipal.IBQPedidos.First;
    while not  FrmPrincipal.IBQPedidos.Eof do
    begin
      If FrmPrincipal.IBQPedidosTBPED_CANCELADO.AsString<> 'S' Then
        FrmRelPedidos.Total:=FrmRelPedidos.Total+ FrmPrincipal.IBQPedidosTBPED_VALTOTAL.AsCurrency;
      FrmPrincipal.IBQPedidos.Next;
    End;
    FrmRelPedidos.QRLTotal.Caption :='R$ ' + FormatFloat('#,,0.00',FrmRelPedidos.Total);
    FrmRelPedidos.QuickRep1.PreviewModal;
    FreeAndNil(FrmRelPedidos);
    FrmPrincipal.IBQPedidos.EnableControls;
end;

procedure TFrmRelatorioPedData.DBGrid1CellClick(Column: TColumn);
begin
  Pedido:=TPedido.Create;
  Pedido.Id_pedido:=FrmPrincipal.IBQPedidosID_PEDIDO.AsInteger;
end;

procedure TFrmRelatorioPedData.FormShow(Sender: TObject);
begin
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
  FrmPrincipal.IBQPedidos.Close;
end;

procedure TFrmRelatorioPedData.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If FrmPrincipal.IBQPedidos.FieldByName('TBPED_CANCELADO').asString='S'  then // condição
  Begin
    Dbgrid1.Canvas.Font.Color:= clRed; // coloque aqui a cor desejada
    Dbgrid1.Canvas.Font.Style:= [fsStrikeOut];
  End;
    Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TFrmRelatorioPedData.PNGButton8Click(Sender: TObject);
begin
  If FrmPrincipal.IBQPedidos.Active then
    FrmPrincipal.IBQPedidos.First;
end;

procedure TFrmRelatorioPedData.PNGButton7Click(Sender: TObject);
begin
    If FrmPrincipal.IBQPedidos.Active then
      FrmPrincipal.IBQPedidos.Last;
end;

end.
