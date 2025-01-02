unit UBuscarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmBuscarPrd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditNome: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    DSProdutos: TDataSource;
    IBQProdutos: TIBQuery;
    Label1: TLabel;
    TimerBusca: TTimer;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure EditDescricaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarPrd: TFrmBuscarPrd;

implementation
Uses  UMensagens, UPrincipal;

{$R *.dfm}

procedure TFrmBuscarPrd.PNGButton2Click(Sender: TObject);
begin
  FrmPrincipal.IdProduto:=0;
  Close;
end;

procedure TFrmBuscarPrd.PNGButton6Click(Sender: TObject);
var StrSQL:String;
begin
  if Trim(EditNome.Text)<>EmptyStr  Then
  Begin
     If Trim(EditNome.Text)<>EmptyStr Then
     begin
       StrSQL:= 'TBPRD_NOME LIKE ''%'+EditNome.Text+'%''';
     end;

    IBQProdutos.Close;
    IBQProdutos.SQL.Clear;
    IBQProdutos.Sql.Add('SELECT  ID_PRODUTO,'+
                               ' TBPRD_NOME,'+
                               ' TBPRD_PRECOCUSTO,'+
                               ' TBPRD_PRECOVENDA,'+
                               ' TBPRD_DESCRICAO '+
                         ' FROM TB_PRODUTOS '+
                         'WHERE  ' +StrSQL);

   //  If Trim(EditNome.Text)<>EmptyStr Then
   //    IBQProdutos.ParamByName('PNOME').AsString:=EditNome.Text+'%';
   
    IBQProdutos.Open;
  End
  Else
    tFrmMensagens.Mensagem('Você precisa digitar algum dado antes de clicar','I',[mbOK]) ;
end;

procedure TFrmBuscarPrd.DBGrid1DblClick(Sender: TObject);
begin
  FrmPrincipal.IdProduto:=IBQProdutos.FieldByName('ID_PRODUTO').AsInteger ;
  FrmPrincipal.NomeProduto :=IBQProdutos.FieldByName('TBPRD_NOME').AsString;
  Close;
end;

procedure TFrmBuscarPrd.EditNomeChange(Sender: TObject);
begin
  TimerBusca.Enabled := True;
end;

procedure TFrmBuscarPrd.TimerBuscaTimer(Sender: TObject);
begin
  PNGButton6Click(Self);
  TimerBusca.Enabled := False;

end;

procedure TFrmBuscarPrd.EditDescricaoChange(Sender: TObject);
begin
  TimerBusca.Enabled :=True; 
end;

end.
