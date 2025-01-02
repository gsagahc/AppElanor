unit UBuscarUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TFrmBuscarUser = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    IBQUser: TIBQuery;
    DsUser: TDataSource;
    IBQUserID_USUARIO: TIntegerField;
    IBQUserTBUSR_NOME: TIBStringField;
    IBQUserTBUSR_LOGIN: TIBStringField;
    procedure PNGButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarUser: TFrmBuscarUser;

implementation
Uses UPrincipal, uMensagens, UCadUser;

{$R *.dfm}

procedure TFrmBuscarUser.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarUser.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

end.
