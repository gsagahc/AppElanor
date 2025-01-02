program Project1;

uses
  Forms,
  URomaneioEntrega in 'URomaneioEntrega.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
