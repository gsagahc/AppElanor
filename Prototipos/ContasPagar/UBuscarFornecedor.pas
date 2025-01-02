unit UBuscarFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmBuscarFornecedor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditNome: TEdit;
    EditCNPJ: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    IBQFornecedor: TIBQuery;
    DSFornecedor: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    IBQFornecedorTBFOR_NOME: TIBStringField;
    IBQFornecedorTBFOR_CNPJ: TIBStringField;
    IBQFornecedorTBFOR_BAIRRO: TIBStringField;
    IBQFornecedorTBFOR_CIDADE: TIBStringField;
    IBQFornecedorID_FORNECEDOR: TIntegerField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarFornecedor: TFrmBuscarFornecedor;

implementation
Uses UPrincipal, UMensagens;

{$R *.dfm}

procedure TFrmBuscarFornecedor.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarFornecedor.PNGButton6Click(Sender: TObject);
var StrSQL:String;
begin
  if (Trim(EditNome.Text)<>EmptyStr) Or (Trim(EditCNPJ.Text)<>EmptyStr) Then
  Begin
   If Trim(EditNome.Text)<>EmptyStr Then
     begin
       StrSQL:= 'TBFOR_NOME LIKE :PNOME ';
       If Trim(EditCNPJ.Text)<> EmptyStr Then
          StrSQL:=StrSQL+ ' AND TBFOR_CNPJ LIKE :PCNPJ';
     end
     Else
       If Trim(EditCNPJ.Text)<> EmptyStr Then
         StrSQL:='TBFOR_CNPJ LIKE :PCNPJ';
    IBQFornecedor.Close;
    IBQFornecedor.SQL.Clear;
    IBQFornecedor.SQL.Add('SELECT TBFOR_NOME, '+
                             ' TBFOR_CNPJ, '+
                             ' TBFOR_BAIRRO, '+
                             ' TBFOR_CIDADE, '+
                             ' ID_FORNECEDOR '+

                        '  FROM TB_FORNECEDORES '+
                        'WHERE '+ StrSQL +
                        ' ORDER BY TBFOR_NOME ');

     If Trim(EditNome.Text)<>EmptyStr Then
       IBQFornecedor.ParamByName('PNOME').AsString:=EditNome.Text+'%';
     If Trim(EditCNPJ.Text)<> EmptyStr Then
       IBQFornecedor.ParamByName('PCNPJ').AsString:=EditCNPJ.Text+'%';

    IBQFornecedor.Open;
  End
  Else
    tFrmMensagens.Mensagem('Você precisa digitar algum dado antes de clicar','I',[mbOK]) ;
end;

procedure TFrmBuscarFornecedor.DBGrid1DblClick(Sender: TObject);
begin
  FrmPrincipal.id_fornecedor  := IBQFornecedorID_FORNECEDOR.AsInteger;
  Close;
end;

end.
