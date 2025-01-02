program Project1;

uses
  Forms,
  UMain in 'UMain.pas' {Form1},
  UNumPed in 'UNumPed.pas' {FrmQuantidade};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
