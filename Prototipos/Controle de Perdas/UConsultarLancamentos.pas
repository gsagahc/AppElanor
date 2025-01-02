unit UConsultarLancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, IBCustomDataSet, IBQuery, ComCtrls, pngextra,DateUtils;

type
  TFrmConsultarLancamentos = class(TForm)
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    DateTimePicker1: TDateTimePicker;
    IBQConsultarLancamentos: TIBQuery;
    DSConsultar: TDataSource;
    IBQUtil: TIBQuery;
    IBQConsultarLancamentosTBCP_MAQUINA: TIntegerField;
    IBQConsultarLancamentosTBCP_DATA: TDateField;
    IBQConsultarLancamentosTBCP_PERCENTUAL: TFloatField;
    IBQConsultarLancamentosTBPRD_NOME: TIBStringField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    function CalculaAcumuladoMes(sData:TDate ): Real;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarLancamentos: TFrmConsultarLancamentos;

implementation
Uses UPrincipal, Math, UReimpressaoPerdas;

{$R *.dfm}

procedure TFrmConsultarLancamentos.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarLancamentos.PNGButton6Click(Sender: TObject);
Var Mes, Ano: string;
    Acumulado: Real;
begin
  IBQConsultarLancamentos.Close;
  IBQConsultarLancamentos.SQL.Clear;
  IBQConsultarLancamentos.SQL.Add(' SELECT TBCP_MAQUINA, '+
                                  '        TBCP_DATA, '+
                                  '        TBCP_ELASTICO, '+
                                  '        TBCP_COMPRIMENTO, '+
                                  '        TBCP_PESOB, '+
                                  '        TBCP_QUANTIDADERC, '+
                                  '        TBCP_QUANTIDADE, '+
                                  '        TBCP_PRIMEIRA, '+
                                  '        TBCP_SEGUNDA, '+
                                  '        TBCP_PERCENTUAL, '+
                                  '        TB_PRODUTOS.TBPRD_NOME '+
                                  ' FROM TB_CONTROLE_PERDAS  '+
                                  ' INNER JOIN TB_PRODUTOS   '+
                                  ' ON TB_PRODUTOS.ID_PRODUTO=TB_CONTROLE_PERDAS.TBCP_ELASTICO '+
                                  ' WHERE TB_CONTROLE_PERDAS.TBCP_DATA =:PDATA');
  IBQConsultarLancamentos.ParamByName('PDATA').AsString :=FormatdateTime('dd/mm/yyyy', DateTimePicker1.Date);
  IBQConsultarLancamentos.Open;
  if Not IBQConsultarLancamentos.IsEmpty Then
  begin
    Mes:=Copy (IBQConsultarLancamentos.FieldByName('TBCP_DATA').AsString ,4,2);
    Ano:=Copy (IBQConsultarLancamentos.FieldByName('TBCP_DATA').AsString ,7 ,4);
    Acumulado:=CalculaAcumuladoMes(DateTimePicker1.Date);
    Application.CreateForm(TFrmReImpressaoPerdas, FrmReImpressaoPerdas);
    FrmReImpressaoPerdas.QRLAcumulado.Caption:=FormatFloat( '#,##0.00' ,Acumulado);
    if Acumulado <= 2 then
    begin
      FrmReImpressaoPerdas.QRLAcumulado.Color       :=clGreen;
      FrmReImpressaoPerdas.QRDBText3.Color          :=clGreen;
    end
    else
    begin
      FrmReImpressaoPerdas.QRLAcumulado.Color       :=clRed;
      FrmReImpressaoPerdas.QRDBText3.Color          :=clRed;
    End;

    FrmReImpressaoPerdas.PreviewModal;
    FreeAndNil(FrmReImpressaoPerdas);
  End;
end;


function TFrmConsultarLancamentos.CalculaAcumuladoMes(sData:TDate): Real;
var SomaPrimeira, SomaSegunda:Real;
    MeseAno:String;

begin
   SomaPrimeira:=0.0;
   SomaSegunda:=0.0;
  // DiasMes:=IntToStr(DaysInMonth(EncodeDate(StrToInt(sAno), StrToInt(sMes), 15)));
//   MeseAno :=FormatDateTime()
   Result:=0.0;
   IBQUtil.Close;
   IBQUtil.SQL.Clear;
   IBQUtil.SQL.Add(' SELECT TBCP_PRIMEIRA, TBCP_SEGUNDA  '+
                   ' FROM  TB_CONTROLE_PERDAS '+
                   ' WHERE TBCP_DATA BETWEEN :pDataIni AND :pDataFin');
   IBQUtil.ParamByName('pDataIni').AsString:='01/'+FormatDateTime('MM/yyyy', sData);
   IBQUtil.ParamByName('pDataFin').AsString:= DateToStr(sData);
   IBQUtil.Open;
   If Not IBQUtil.IsEmpty then
   begin
     IBQUtil.First;
     While  not IBQUtil.Eof do
     begin
       SomaPrimeira:=RoundTo(SomaPrimeira+IBQUtil.FieldByName('TBCP_PRIMEIRA').AsFloat,-2);
       SomaSegunda :=RoundTo(SomaSegunda+IBQUtil.FieldByName('TBCP_SEGUNDA').AsFloat,-2);
       IBQUtil.Next;
     end;
     Result:=RoundTo((SomaSegunda *100) / SomaPrimeira, -2);
   end;

end;

procedure TFrmConsultarLancamentos.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=Now();
end;

end.
