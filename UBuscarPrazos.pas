unit UBuscarPrazos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB;

type
  TFrmBuscaPrazos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DSPrazos: TDataSource;
    procedure PNGButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscaPrazos: TFrmBuscaPrazos;

implementation
Uses UCadPrazos;
{$R *.dfm}

procedure TFrmBuscaPrazos.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscaPrazos.DBGrid1DblClick(Sender: TObject);
begin
  FrmCadPrazos.IdPrazo:=FrmCadPrazos.IBQPrazosID_PRAZO.AsInteger;
  Close;
end;

end.
