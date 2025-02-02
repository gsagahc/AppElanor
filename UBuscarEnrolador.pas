unit UBuscarEnrolador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmBuscarEnrolador = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    IBQEnrolador: TIBQuery;
    DsUser: TDataSource;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    IBQEnroladorNOME: TIBStringField;
    IBQEnroladorCPF: TIBStringField;
    IBQEnroladorSN_ATIVO: TIBStringField;
    procedure PNGButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarEnrolador: TFrmBuscarEnrolador;

implementation
Uses UPrincipal, uMensagens, UCadUser;

{$R *.dfm}

procedure TFrmBuscarEnrolador.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarEnrolador.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

end.
