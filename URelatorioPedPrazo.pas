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
    IBQPedidosTBPED_VENC04: TDateField;
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
  IBQItensPedido.Close;
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
  Sql:='SELECT   '+
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
                'AND P.TBPED_DATA < :pDataFin  '+
                ' AND P.TBPED_NOME LIKE ''%' + EditCliente.Text+ '%''' ;

   Sql:=Sql+' AND P.ID_PRAZO<>:pPrazo '+
            'AND (P.TBPED_CANCELADO IS NULL OR P.TBPED_CANCELADO <>''S'') '+
            ' GROUP BY   '+
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
