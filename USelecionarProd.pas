unit USelecionarProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmSelecionarProd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditNome: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    IBQProdutos: TIBQuery;
    DSProdutos: TDataSource;
    Label1: TLabel;
    TimerBusca: TTimer;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecionarProd: TFrmSelecionarProd;

implementation
Uses uPrincipal, UMensagens, UCadPedido;

{$R *.dfm}

procedure TFrmSelecionarProd.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSelecionarProd.PNGButton6Click(Sender: TObject);
begin
  if (Trim(EditNome.Text)<>EmptyStr) Then
  Begin
    IBQProdutos.Close;
    IBQProdutos.SQL.Clear;
    IBQProdutos.Sql.Add('SELECT TBPRD_NOME, '+
                        ' TBPRD_PRECOVENDA, '+
                        ' TBPRD_UNIDADE, '+
                        ' ID_PRODUTO, '+
                        ' ID_ESTOQUE, '+
                        ' TBES_QUANTI, '+
                        ' TBES_FORMATO, '+
                        ' TBES_TAMANHO '+
                        ' FROM VIEW_ESTOQUE '+
                        ' WHERE TBPRD_NOME LIKE ''%'+ EditNome.Text +'%''');
                       // ' AND TBES_QUANTI>0');

   

    IBQProdutos.Open;
  End
  Else
  tFrmMensagens.Mensagem('Você precisa digitar algum dado antes de clicar','I',[mbOK]) ;
end;

procedure TFrmSelecionarProd.DBGrid1DblClick(Sender: TObject);
begin
  FrmPrincipal.IdProduto:= IBQProdutos.FieldByName('ID_PRODUTO').AsInteger;


  Close;
end;

procedure TFrmSelecionarProd.FormShow(Sender: TObject);
begin
  IBQProdutos.Open;
  EditNome.SetFocus;
end;

procedure TFrmSelecionarProd.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
   113: PNGButton6Click(Self);
   114: PNGButton2Click(Self);
 end;
end;

procedure TFrmSelecionarProd.TimerBuscaTimer(Sender: TObject);
begin
  PNGButton6Click(Self);
  TimerBusca.Enabled := False; 
end;

procedure TFrmSelecionarProd.EditNomeChange(Sender: TObject);
begin
  TimerBusca.Enabled :=True; 
end;

end.
