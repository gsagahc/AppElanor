unit USelecionaProdPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids;

type
  TFrmSelProdPre = class(TForm)
    DBGrid1: TDBGrid;
    IBQPrudutos: TIBQuery;
    DSProdutos: TDataSource;
    IBQPrudutosID_PRODUTO: TIntegerField;
    IBQPrudutosTBPRD_CODIGO: TIBStringField;
    IBQPrudutosTBPRD_NOME: TIBStringField;
    IBQPrudutosTBPRD_PRECOVENDA: TIBBCDField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelProdPre: TFrmSelProdPre;

implementation
Uses UPrincipal, UMensagens, UCadCli;

{$R *.dfm}

procedure TFrmSelProdPre.DBGrid1DblClick(Sender: TObject);
begin
  FrmCadCli.IdProduto :=IBQPrudutosID_PRODUTO.AsInteger;
  FrmCadCli.NomeProd  :=IBQPrudutosTBPRD_NOME.AsString;
  FrmCadCli.PrecoProd :=IBQPrudutosTBPRD_PRECOVENDA.AsCurrency;        
  Close;
end;

procedure TFrmSelProdPre.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#27 Then
    Close;
end;

end.
