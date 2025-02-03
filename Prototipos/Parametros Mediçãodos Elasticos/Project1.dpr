program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UParamMedicao in 'UParamMedicao.pas' {FrmCadParamElasticos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCadParamElasticos, FrmCadParamElasticos);
  Application.Run;
end.
