unit UAdicionarItensRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URomaneioEntrega, DB, ImgList, IBCustomDataSet, IBQuery,
  DBClient, pngimage, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids,
  ComCtrls, pngextra;

type
  TFrmAdicionarItensRomaneio = class(TFrmRomaneioEntrega)
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdicionarItensRomaneio: TFrmAdicionarItensRomaneio;

implementation

{$R *.dfm}

procedure TFrmAdicionarItensRomaneio.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
