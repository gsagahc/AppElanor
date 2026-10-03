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
  FrmPrincipal.IBQItensPedido.Close;
  FrmPrincipal.IBQPedidos_OBS.SQL.Clear;
  StrSql:= 'SELECT   '+
                      'P.ID_PEDIDO, '+
                      'P.TBPED_DATA, '+
                      'P.ID_CLIENTE, '+
                      'P.TBPED_NOME, '+
                      'P.TBPED_ENDERECO, '+
                      'P.TBPED_CIDADE, '+
                      'P.TBPED_ESTADO, '+
                      'P.TBPED_TELEFONE, '+
                      'P.ID_PRAZO, '+
                      'P.TBPED_VALTOTAL, '+
                      'P.TBPED_VENC01, '+
                      'P.TBPED_VENC02, '+
                      'P.TBPED_VENC03, '+
                      'P.TBPED_VENC04, '+
                      'P.ID_USUARIO, '+
                      'P.TBPED_BAIRRO, '+
                      'P.TBPED_CNPJ, '+
                      'PR.TBPRZ_NOME, '+
                      'P.TBPED_NUMPED,  '+
                      'U.TBUSR_NOME, '+
                      'P.TBPED_CANCELADO, '+
                      'P.TBPED_MOTIVOCANCEL, '+
                      'P.OBS,   '+

                      'LIST(I.TBITPED_QUANT, '', '') AS ITENS_QUANTIDADES,  '+
                      'LIST(I.TBITPED_VALUNI, '', '') AS ITENS_VALORES_UNITARIOS '+

                  'FROM TB_PEDIDOS P  '+

                  'INNER JOIN TB_PRAZOS PR  '+
                      'ON PR.ID_PRAZO = P.ID_PRAZO  '+

                  'INNER JOIN TB_USUARIO U '+
                      'ON U.ID_USUARIO = P.ID_USUARIO  '+

                  'INNER JOIN TB_ITENSPEDIDO I '+
                      'ON I.ID_PEDIDO = P.ID_PEDIDO  '+

                  'WHERE  '+
                      'P.TBPED_DATA >= :pDataIni  '+
                      'AND P.TBPED_DATA < :pDataFin + 1 '+
                  ' AND P.OBS LIKE ''%' +EdtOC.Text+'%''';

  If Not CBoxCancelados.Checked  Then
     StrSql:=StrSql+ ' AND (P.TBPED_CANCELADO IS NULL or P.TBPED_CANCELADO<>''S'')';

     StrSql:=StrSql+       ' GROUP BY   '+
                          'P.ID_PEDIDO, '+
                          'P.TBPED_DATA, '+
                          'P.ID_CLIENTE, '+
                          'P.TBPED_NOME,  '+
                          'P.TBPED_ENDERECO, '+
                          'P.TBPED_CIDADE, '+
                          'P.TBPED_ESTADO, '+
                          'P.TBPED_TELEFONE, '+
                          'P.ID_PRAZO,  '+
                          'P.TBPED_VALTOTAL, '+
                          'P.TBPED_VENC01, '+
                          'P.TBPED_VENC02, '+
                          'P.TBPED_VENC03, '+
                          'P.TBPED_VENC04, '+
                          'P.ID_USUARIO, '+
                          'P.TBPED_BAIRRO, '+
                          'P.TBPED_CNPJ, '+
                          'PR.TBPRZ_NOME,  '+
                          'P.TBPED_NUMPED, '+
                          'U.TBUSR_NOME, '+
                          'P.TBPED_CANCELADO, '+
                          'P.TBPED_MOTIVOCANCEL, '+
                          'P.OBS  '+

                      'ORDER BY '+
                         ' P.ID_PEDIDO; ';


  FrmPrincipal.IBQPedidos_OBS.SQL.Add(StrSql);
  FrmPrincipal.IBQPedidos_OBS.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  FrmPrincipal.IBQPedidos_OBS.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  FrmPrincipal.IBQPedidos_OBS.Open;

End;

procedure TFrmConsultarPedOrdemCompra.DBGrid1DblClick(Sender: TObject);
begin
    FrmPrincipal.IBQItensPedido.Close;
    FrmPrincipal.IBQItensPedido.ParamByName('pID_PEDIDO').AsInteger:=FrmPrincipal.IBQPedidos_OBSID_PEDIDO.AsInteger;
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
      If FrmPrincipal.IBQPedidos_OBSTBPED_CANCELADO.AsString <> 'S' Then
        FrmRelPedidosOC.Total:=FrmRelPedidosOC.Total+ FrmPrincipal.IBQPedidos_OBSTBPED_VALTOTAL.AsCurrency;
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
  Pedido.Id_pedido:=FrmPrincipal.IBQPedidos_OBSID_PEDIDO.AsInteger;
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
