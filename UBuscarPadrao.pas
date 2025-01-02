unit UBuscarPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmBuscarPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    IBQCheque: TIBQuery;
    DSCheque: TDataSource;
    IBQChequeID_CHEQUE: TIntegerField;
    IBQChequeTBCH_NUMCH: TIBStringField;
    IBQChequeTBCH_VALCH: TIBBCDField;
    IBQChequeTBCH_NUMPED: TIntegerField;
    IBQChequeTBCH_BOMPARA: TDateField;
    procedure PNGButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarPadrao: TFrmBuscarPadrao;

implementation
Uses UPrincipal, UMensagens,UcadCheque;

{$R *.dfm}

procedure TFrmBuscarPadrao.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

end.
