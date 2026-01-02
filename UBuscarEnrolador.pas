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
    CheckInativos: TCheckBox;
    IBQEnroladorNOME: TIBStringField;
    IBQEnroladorCPF: TIBStringField;
    IBQEnroladorSN_ATIVO: TIBStringField;
    IBQEnroladorID_ENROLADOR: TIntegerField;
    procedure PNGButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckInativosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarEnrolador: TFrmBuscarEnrolador;

implementation
Uses UPrincipal, uMensagens, UCadEnrolador;

{$R *.dfm}

procedure TFrmBuscarEnrolador.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarEnrolador.DBGrid1DblClick(Sender: TObject);
begin
  FrmCadEnrolador.idEnrolador:=IBQEnroladorID_ENROLADOR.AsString;
  Close;
end;

procedure TFrmBuscarEnrolador.FormShow(Sender: TObject);
begin
  IBQEnrolador.Close;
  IBQEnrolador.SQL.Clear;
  IBQEnrolador.SQL.Add('SELECT * FROM TB_ENROLADORES WHERE SN_ATIVO=''S''');
  IBQEnrolador.Open;

end;

procedure TFrmBuscarEnrolador.CheckInativosClick(Sender: TObject);
begin
  if not CheckInativos.Checked then
  begin
    IBQEnrolador.Close;
    IBQEnrolador.SQL.Clear;
    IBQEnrolador.SQL.Add('SELECT * FROM TB_ENROLADORES WHERE SN_ATIVO=''S''');

  end
  else
  begin
    IBQEnrolador.Close;
    IBQEnrolador.SQL.Clear;
    IBQEnrolador.SQL.Add('SELECT * FROM TB_ENROLADORES');

  end;
  IBQEnrolador.Open;
end;

end.
