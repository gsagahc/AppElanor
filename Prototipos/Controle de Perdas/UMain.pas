unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBDatabase, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IBTMain: TIBTransaction;
    IBDMain: TIBDatabase;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UFrmControlePerdas, UConsultarPerdas;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmControlePerdas,FrmControlePerdas);
  FrmControlePerdas.ShowModal;
  FrmControlePerdas.Free; 
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultarPerdas, FrmConsultarPerdas);
  FrmConsultarPerdas.ShowModal;
  FrmConsultarPerdas.Free;
end;

end.
