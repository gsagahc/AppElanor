unit UIncluir_OBS_Pedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBSQL, DB, IBCustomDataSet, IBQuery, pngextra, Grids,
  DBGrids, ExtCtrls, IBUpdateSQL, IBTable, Mask, DBCtrls;

type
  TFrmIncluirObsPedidos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    PNGButton1: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton4: TPNGButton;
    Panel2: TPanel;
    PanelViewPedido: TPanel;
    Panel3: TPanel;
    EditPedido: TEdit;
    Label1: TLabel;
    IBTbPedidos: TIBTable;
    DsPedidos: TDataSource;
    IBTbPedidosTBPED_DATA: TDateField;
    IBTbPedidosTBPED_NOME: TIBStringField;
    IBTbPedidosTBPED_VALTOTAL: TIBBCDField;
    IBTbPedidosTBPED_NUMPED: TIBStringField;
    DBEdit1: TDBEdit;
    IBTbPedidosOBS: TIBStringField;
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure MemoMotivoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIncluirObsPedidos: TFrmIncluirObsPedidos;

implementation
Uses UPrincipal, UMensagens, Math;

{$R *.dfm}

procedure TFrmIncluirObsPedidos.PNGButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIncluirObsPedidos.PNGButton1Click(Sender: TObject);
begin
  IBTbPedidos.Open;
  If Trim(EditPedido.Text)<> EmptyStr Then
  Begin
    If IBTbPedidos.Locate('TBPED_NUMPED', EditPedido.Text, [loPartialKey] ) Then
    begin
      PNGButton5.Enabled :=True;
      IBTbPedidos.Edit;
    end
    Else
      tFrmMensagens.Mensagem('Pedido não localizado, favor verificar número digitado','I',[mbOK]);


  End;
end;

procedure TFrmIncluirObsPedidos.PNGButton5Click(Sender: TObject);
begin
  if  (tFrmMensagens.Mensagem('Confirma a observação?','Q',[mbSim, mbNao])) Then
  Begin
    IBTbPedidos.Post;
    FrmIncluirObsPedidos.Close;
  End;
end;



procedure TFrmIncluirObsPedidos.MemoMotivoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmIncluirObsPedidos.FormShow(Sender: TObject);
begin
  IBTbPedidos.Close;
end;

end.
