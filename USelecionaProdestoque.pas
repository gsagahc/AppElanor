unit USelecionaProdestoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmSelecionarProdEstoque = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditNome: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    IBQProdutos: TIBQuery;
    DSProdutos: TDataSource;
    Label1: TLabel;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecionarProdEstoque: TFrmSelecionarProdEstoque;

implementation
Uses uPrincipal, UMensagens, UCadPedido, UEnfestadoPRolo;

{$R *.dfm}

procedure TFrmSelecionarProdEstoque.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSelecionarProdEstoque.PNGButton6Click(Sender: TObject);
begin
    IBQProdutos.Close;
    IBQProdutos.SQL.Clear;
    IBQProdutos.Sql.Add('SELECT * FROM VIEW_ESTOQUE '+
                        ' WHERE TBES_QUANTI>0 '+
                        '   AND   TBES_FORMATO=:PFormato '+
                        ' AND TBPRD_NOME LIKE ''%'+Trim(EditNome.Text)+'%''');

    IBQProdutos.ParamByName('PFormato').AsString:='ENFESTADO';
    IBQProdutos.Open;
end;

procedure TFrmSelecionarProdEstoque.DBGrid1DblClick(Sender: TObject);
Var Estoque:TEstoque;
begin
  Estoque:=TEstoque.Create;
  Estoque.Nome       :=IBQProdutos.FieldByName('TBPRD_NOME').AsString;
  Estoque.Id_estoque :=IBQProdutos.FieldByName('ID_ESTOQUE').AsInteger;
  Estoque.Quantidade :=IBQProdutos.FieldByName('TBES_QUANTI').AsInteger;
  Estoque.id_produto :=IBQProdutos.FieldByName('ID_PRODUTO').AsInteger;
  Estoque.Formato    :=IBQProdutos.FieldByName('TBES_FORMATO').AsString;
  FrmEnfestadoPRolo.LstBoxEstoque.AddItem(Estoque.Nome, Estoque); 
//   CBoxClientes.AddItem(Pedido.NomeCli , Pedido);
  Close;
end;

end.
