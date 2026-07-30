unit URelatorioMovAcetona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery, ComCtrls;

type
  TFrmBuscarMovPeriodo = class(TForm)
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
    DateTimePicker2: TDateTimePicker;
    PNGButton1: TPNGButton;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure EditDescricaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarMovPeriodo: TFrmBuscarMovPeriodo;

implementation
Uses  UMensagens, UPrincipal, URelMovimentacaoAcetona;

{$R *.dfm}

procedure TFrmBuscarMovPeriodo.PNGButton2Click(Sender: TObject);
begin
  FrmPrincipal.IdProduto:=0;
  Close;
end;

procedure TFrmBuscarMovPeriodo.PNGButton6Click(Sender: TObject);
var StrSQL:String;
begin
    StrSQL:= 'DATA Between :pDataIni AND :pDataFin';
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


    IBQProdutos.ParamByName('pDataIni').AsDate:= DateTimePicker1.Date;
    IBQProdutos.ParamByName('pDataFin').AsDate:= DateTimePicker2.Date;
  try
    IBQProdutos.Open;
  except
   on E: EDatabaseError do
   begin
     tFrmMensagens.Mensagem('Erro ao realizar consulta','E',[mbOK], E.Message);

   end;

  end;

end;

procedure TFrmBuscarMovPeriodo.DBGrid1DblClick(Sender: TObject);
begin
  FrmPrincipal.IdProduto:=IBQProdutos.FieldByName('ID_PRODUTO').AsInteger ;
  FrmPrincipal.NomeProduto :=IBQProdutos.FieldByName('TBPRD_NOME').AsString;
  Close;
end;

procedure TFrmBuscarMovPeriodo.EditNomeChange(Sender: TObject);
begin
  TimerBusca.Enabled := True;
end;

procedure TFrmBuscarMovPeriodo.TimerBuscaTimer(Sender: TObject);
begin
  PNGButton6Click(Self);
  TimerBusca.Enabled := False;

end;

procedure TFrmBuscarMovPeriodo.EditDescricaoChange(Sender: TObject);
begin
  TimerBusca.Enabled :=True; 
end;

procedure TFrmBuscarMovPeriodo.FormShow(Sender: TObject);
begin
  DateTimePicker2.Date:=Now;
  DateTimePicker1.Date:= (Now-5);
end;

procedure TFrmBuscarMovPeriodo.PNGButton1Click(Sender: TObject);
begin
  if (IBQProdutos.Active) and (IBQProdutos.RecordCount>0) Then
  begin
    Application.CreateForm(TFrmRelMovAcetona, FrmRelMovAcetona);
    FrmRelMovAcetona.Caption := 'Relatório de movimentações de acetona';
    FrmRelMovAcetona.QuickRep1.PreviewModal;
    FrmRelMovAcetona.Free;
  end;  
  
end;

end.
