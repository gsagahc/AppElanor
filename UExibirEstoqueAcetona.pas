unit UExibirEstoqueAcetona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TFormExibirEstoqueAcetona = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    IBQEstoqueAcetona: TIBQuery;
    DSEStoqueAcetona: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExibirEstoqueAcetona: TFormExibirEstoqueAcetona;

implementation
Uses UPrincipal, uMensagens;
{$R *.dfm}

procedure TFormExibirEstoqueAcetona.FormCreate(Sender: TObject);
begin
  Try
    IBQEstoqueAcetona.Open;
  except
   on E: EDatabaseError do
   begin
     tFrmMensagens.Mensagem('Erro ao realizar consulta','E',[mbOK], E.Message);

   end;

  end;
end;

end.
