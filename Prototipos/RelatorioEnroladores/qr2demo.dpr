program Qr2demo;

uses
  Forms,
  Menu in 'MENU.PAS' {MainForm},
  Manygrp in 'MANYGRP.PAS' {ManyGrpForm},
  URelatorioEnroladores in 'URelatorioEnroladores.pas' {FormEnroladores};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
