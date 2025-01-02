unit UBuscarContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmBuscarContas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditNumero: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    IBQFornecedor: TIBQuery;
    DSFornecedor: TDataSource;
    Label1: TLabel;
    IBQFornecedorTBCONT_NUMNOTA: TIBStringField;
    IBQFornecedorTBCONT_EMISSAO: TDateField;
    IBQFornecedorTBCONT_VALORNOTA: TIBBCDField;
    IBQFornecedorTBCONT_VENCIMENTO: TDateField;
    IBQFornecedorTBCONT_VALOR: TIBBCDField;
    IBQFornecedorTBFOR_NOME: TIBStringField;
    IBQFornecedorID_CONTASPAGAR: TIntegerField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarContas: TFrmBuscarContas;

implementation
Uses UPrincipal, UMensagens;

{$R *.dfm}

procedure TFrmBuscarContas.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarContas.PNGButton6Click(Sender: TObject);
begin
  If EditNumero.Text<> EmptyStr then
  Begin
    IBQFornecedor.Close;
    IBQFornecedor.ParamByName('pNUMNOTA').AsString :=EditNumero.Text;
    IBQFornecedor.Open;
  end
  Else
    tFrmMensagens.Mensagem('Você precisa digitar algum dado antes de clicar','I',[mbOK]) ;
end;

procedure TFrmBuscarContas.DBGrid1DblClick(Sender: TObject);
begin
  FrmPrincipal.id_contapagar:= IBQFornecedorID_CONTASPAGAR.AsInteger;
  Close;    
end;

end.
