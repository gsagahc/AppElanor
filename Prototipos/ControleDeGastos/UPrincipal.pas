unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBDatabase, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    IBTMain: TIBTransaction;
    IBDMain: TIBDatabase;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UEntradaDeGastos;

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCadGastos, FrmCadGastos);
  FrmCadGastos.ShowModal;
  FreeAndNil(FrmCadGastos);
end;

end.
