unit URelatorioEnroladores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, IBCustomDataSet,
  IBQuery, IBDatabase;

type
  TFormEnroladores = class(TForm)
    QuickRepEnroladores: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRGroup2: TQRGroup;
    QRExpr3: TQRExpr;
    QRLabelQuantidade: TQRLabel;
    QRLabelArtigo: TQRLabel;
    QRBand1: TQRBand;
    QRExprResultado: TQRExpr;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    ChildBand1: TQRChildBand;
    IBQuery1: TIBQuery;
    IBQuery1TBCP_DATA: TDateField;
    IBQuery1TBCP_MAQUINA: TIntegerField;
    IBQuery1TBCP_ELASTICO: TIBStringField;
    IBQuery1TBCP_COMPRIMENTO: TIntegerField;
    IBQuery1TBCP_PESOB: TFloatField;
    IBQuery1TBCP_QUANTIDADERC: TIntegerField;
    IBQuery1TBCP_QUANTIDADE: TIntegerField;
    IBQuery1TBCP_PRIMEIRA: TFloatField;
    IBQuery1TBCP_SEGUNDA: TFloatField;
    IBQuery1TBCP_PERCENTUAL: TFloatField;
    IBQuery1ID_CONTROLEPERDAS: TIntegerField;
    IBQuery1ID_ENROLADOR: TIntegerField;
    IBQuery1NOME: TIBStringField;
    IBQuery1TBPRD_NOME: TIBStringField;
    QRLabelSegunda: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRExprMinimo: TQRExpr;
    IBQuery1MINIMO: TIntegerField;
    QRLabel6: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEnroladores: TFormEnroladores;

implementation
Uses UFrmControlePerdas, UPrincipal, UParametrosConfig;
{$R *.dfm}



procedure TFormEnroladores.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var  iNumero:Real;
   Parametro:TParametros;
   SN_UsarCores:Boolean;
begin
  SN_UsarCores :=Parametro.returnValParametro('SN_UTILIZAR_CORES_RELENROL')='S';
  if SN_UsarCores then
  begin
    iNumero:=QRExprResultado.Value.dblResult;
    if iNumero < QRExprMinimo.Value.dblResult then
      QRBand1.Color:=clRed
    else
      QRBand1.Color:=clGreen;
  end;

end;

end.
