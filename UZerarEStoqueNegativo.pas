unit UZerarEStoqueNegativo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPrincipal, pngextra, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids;

type
  TFrmEstoqueNegativo = class(TForm)
    DBGrid1: TDBGrid;
    IBQuery1: TIBQuery;
    Panel1: TPanel;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    DataSource1: TDataSource;
    PNGButton5: TPNGButton;
    IBQuery2: TIBQuery;
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstoqueNegativo: TFrmEstoqueNegativo;

implementation
uses uMensagens;
{$R *.dfm}

procedure TFrmEstoqueNegativo.PNGButton6Click(Sender: TObject);
begin
  IBQuery1.close;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('SELECT TBES_QUANTI QUANTIDADE, '+
                          'TB_PRODUTOS.TBPRD_NOME NOME,  '+
                          'TBES_FORMATO FORMATO '+
                    'FROM TB_ESTOQUE, TB_PRODUTOS  '+
                   'WHERE TBES_QUANTI < 0  '+
                    ' AND TB_ESTOQUE.ID_PRODUTO = TB_PRODUTOS.TBPRD_CODIGO ');
  try
    IBQuery1.Open;
    if not IBQuery1.IsEmpty then
    begin
       PNGButton5.Enabled:= True;
    end
    else
      PNGButton5.Enabled:= False;
  except

  end;

end;

procedure TFrmEstoqueNegativo.PNGButton5Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Confirma zerar os estoques negativos mostrados?','Q',[mbSim, mbNao])) then
  Begin
    IBQuery2.close;
    IBQuery2.SQL.Clear;
    IBQuery2.SQL.Add('UPDATE TB_ESTOQUE '+
                     'SET TBES_QUANTI = 0  '+
                     'WHERE TBES_QUANTI < 0');

    try
      IBQuery2.ExecSQL;
      IBQuery1.Close;
      PNGButton5.Enabled:= False;
    except

    end;
    end;
end;

procedure TFrmEstoqueNegativo.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

end.
