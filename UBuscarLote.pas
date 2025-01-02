unit UBuscarLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmBuscarLote = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditNumero: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    DSProdutos: TDataSource;
    IBQProdutos: TIBQuery;
    Label1: TLabel;
    TimerBusca: TTimer;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EditNumeroChange(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure EditDescricaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarLote: TFrmBuscarLote;

implementation
Uses  UMensagens, UPrincipal;

{$R *.dfm}

procedure TFrmBuscarLote.PNGButton2Click(Sender: TObject);
begin
  FrmPrincipal.IdProduto:=0;
  Close;
end;

procedure TFrmBuscarLote.PNGButton6Click(Sender: TObject);
var StrSQL:String;
begin
  if Trim(EditNumero.Text)<>EmptyStr  Then
  Begin
    IBQProdutos.Close;
    IBQProdutos.ParamByName('pNUMLOTE').AsString:=EditNumero.text ;
    IBQProdutos.Open;
  End
  Else
    tFrmMensagens.Mensagem('Você precisa digitar algum dado antes de clicar','I',[mbOK]) ;
end;

procedure TFrmBuscarLote.DBGrid1DblClick(Sender: TObject);
begin
  FrmPrincipal.IdProduto:=IBQProdutos.FieldByName('ID_PRODUTO').AsInteger ;
  FrmPrincipal.NomeProduto :=IBQProdutos.FieldByName('TBPRD_NOME').AsString;
  Close;
end;

procedure TFrmBuscarLote.EditNumeroChange(Sender: TObject);
begin
  TimerBusca.Enabled := True;
end;

procedure TFrmBuscarLote.TimerBuscaTimer(Sender: TObject);
begin
  PNGButton6Click(Self);
  TimerBusca.Enabled := False;

end;

procedure TFrmBuscarLote.EditDescricaoChange(Sender: TObject);
begin
  TimerBusca.Enabled :=True; 
end;

end.
