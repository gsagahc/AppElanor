unit UBuscarMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery, ComCtrls;

type
  TFrmBuscarMovimentacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    DSProdutos: TDataSource;
    IBQProdutos: TIBQuery;
    Label1: TLabel;
    TimerBusca: TTimer;
    DateTimePicker1: TDateTimePicker;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure EditDescricaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarMovimentacao: TFrmBuscarMovimentacao;

implementation
Uses  UMensagens, UPrincipal;

{$R *.dfm}

procedure TFrmBuscarMovimentacao.PNGButton2Click(Sender: TObject);
begin
  FrmPrincipal.IdProduto:=0;
  Close;
end;

procedure TFrmBuscarMovimentacao.PNGButton6Click(Sender: TObject);
var StrSQL:String;
begin
    StrSQL:= 'DATA =:pData ';
    IBQProdutos.Close;
    IBQProdutos.SQL.Clear;
    IBQProdutos.Sql.Add('SELECT  ID_MOV,'+
                                'DANFE, '+
                                'DATA, '+
                                'ENTRADA_SAIDA, '+
                                'CASE ENTRADA_SAIDA '+
                                '   WHEN ''E''  THEN ''ENTRADA'''+
                                '   WHEN ''S''  THEN ''SAÍDA'''+
                                'END AS TIPO, '+
                                'ESTOQUE_ANTERIOR, '+
                                'ESTOQUE_APOS, '+
                                'FABRICANTE, '+
                                'QUANTIDADE '+
                        'FROM    TB_MOV_ACETONA '+
                       'WHERE  ' +StrSQL);


    IBQProdutos.ParamByName('pData').AsDate:= DateTimePicker1.Date;
    IBQProdutos.Open;

end;

procedure TFrmBuscarMovimentacao.DBGrid1DblClick(Sender: TObject);
begin
  FrmPrincipal.IdProduto:=IBQProdutos.FieldByName('ID_PRODUTO').AsInteger ;
  FrmPrincipal.NomeProduto :=IBQProdutos.FieldByName('TBPRD_NOME').AsString;
  Close;
end;

procedure TFrmBuscarMovimentacao.EditNomeChange(Sender: TObject);
begin
  TimerBusca.Enabled := True;
end;

procedure TFrmBuscarMovimentacao.TimerBuscaTimer(Sender: TObject);
begin
  PNGButton6Click(Self);
  TimerBusca.Enabled := False;

end;

procedure TFrmBuscarMovimentacao.EditDescricaoChange(Sender: TObject);
begin
  TimerBusca.Enabled :=True; 
end;

procedure TFrmBuscarMovimentacao.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=Now;
end;

end.
