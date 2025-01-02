unit UConsultarPerdas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, pngextra, ExtCtrls, DB, IBCustomDataSet, IBQuery, DateUtils,
  IBTable, StdCtrls, Mask  ;

 

type
  TFrmConsultarPerdas = class(TForm)
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    IBQConsultar: TIBQuery;
    DataSource1: TDataSource;
    IBQConsultarTBCP_DATA: TDateField;
    IBQConsultarTBCP_MAQUINA: TIntegerField;
    IBQConsultarTBCP_ELASTICO: TIBStringField;
    IBQConsultarTBCP_COMPRIMENTO: TIntegerField;
    IBQConsultarTBCP_PESOB: TFloatField;
    IBQConsultarTBCP_QUANTIDADERC: TIntegerField;
    IBQConsultarTBCP_QUANTIDADE: TIntegerField;
    IBQConsultarTBCP_PRIMEIRA: TFloatField;
    IBQConsultarTBCP_SEGUNDA: TFloatField;
    IBQConsultarTBCP_PERCENTUAL: TFloatField;
    IBQConsultarTBPRD_NOME: TIBStringField;
    Label1: TLabel;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPerdas: TFrmConsultarPerdas;

implementation
Uses  UPrincipal, UConsultarPerdasMes, Math;
{$R *.dfm}

procedure TFrmConsultarPerdas.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPerdas.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date :=Now();
end;

procedure TFrmConsultarPerdas.PNGButton6Click(Sender: TObject);
var     DiasMes:String;
        Ano, Mes: String;
        Percentual,SomaPrimeira, SomaSegunda:Real;
begin

   Ano:= FormatDateTime('yyyy', DateTimePicker1.Date);
   Mes:= FormatDateTime('MM', DateTimePicker1.Date);
   DiasMes:=IntToStr(DaysInMonth(EncodeDate(StrToInt(Ano),StrToInt(Mes) , 15)));
   IBQConsultar.Close;
   IBQConsultar.SQL.Clear;
   IBQConsultar.SQL.Add(' SELECT         TBCP_DATA, '+
                                         'TBCP_MAQUINA, '+
                                         'TBCP_ELASTICO, '+
                                         'TBCP_COMPRIMENTO, '+
                                         'TBCP_PESOB, '+
                                         'TBCP_QUANTIDADERC, '+
                                         'TBCP_QUANTIDADE, '+
                                         'TBCP_PRIMEIRA, '+
                                         'TBCP_SEGUNDA, '+
                                         'TBCP_PERCENTUAL, '+
                                         'TBPRD_NOME '+
                   ' FROM  TB_CONTROLE_PERDAS '+
                   ' INNER JOIN TB_PRODUTOS '+
                   ' ON TB_PRODUTOS.ID_PRODUTO = TB_CONTROLE_PERDAS.TBCP_ELASTICO '+
                   ' WHERE TBCP_DATA BETWEEN :pDataIni AND :pDataFin '+
                   ' ORDER BY   TBCP_DATA');
   IBQConsultar.ParamByName('pDataIni').AsString:= '01/'+Mes+'/'+Ano;
   IBQConsultar.ParamByName('pDataFin').AsString:=  DiasMes+'/'+Mes+'/'+Ano;;
   IBQConsultar.Open;
   IBQConsultar.First;
   while Not IBQConsultar.Eof Do
   Begin
     SomaPrimeira:=RoundTo(SomaPrimeira+IBQConsultar.FieldByName('TBCP_PRIMEIRA').AsFloat,-2);
     SomaSegunda :=RoundTo(SomaSegunda+IBQConsultar.FieldByName('TBCP_SEGUNDA').AsFloat,-2);
     IBQConsultar.Next;
   End;
   Percentual:=(RoundTo((SomaSegunda *100) / SomaPrimeira, -2));
   IBQConsultar.First;
   Application.CreateForm(TFrmImpressaoPerdasMes, FrmImpressaoPerdasMes);
   If Percentual <= 2 then
       FrmImpressaoPerdasMes.QRLAcumulado.Color :=clGreen
   else
       FrmImpressaoPerdasMes.QRLAcumulado.Color:=clRed;     
   FrmImpressaoPerdasMes.QRLAcumulado.Caption :=FormatFloat( '#,##0.00' ,   Percentual);
   FrmImpressaoPerdasMes.PreviewModal;
   FrmImpressaoPerdasMes.Free;
end;

end.
