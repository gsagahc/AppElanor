program Project1;

uses
  Forms,
  UQuantidade in 'UQuantidade.pas' {FrmQuantidade};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmQuantidade, FrmQuantidade);
  Application.Run;
end.
