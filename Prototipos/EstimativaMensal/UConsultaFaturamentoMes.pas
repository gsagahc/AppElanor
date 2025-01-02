unit UConsultaFaturamentoMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, Chart,
  Series, IBSQL, DbChart,TeeProcs, TeEngine, DateUtils;

Type TPedido = Class
     public
     NomeCli:String;
     Id_pedido:Integer;
     NomeProd:String;
     Id_produto:Integer;  
End;

type
  TFrmConsultarFatMensal = class(TForm)
    Panel1: TPanel;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    IBQPedidosDia: TIBQuery;
    IBQPedidosDiaID_PEDIDO: TIntegerField;
    IBQPedidosDiaTBPED_DATA: TDateField;
    IBQPedidosDiaTBPED_VALTOTAL: TIBBCDField;
    IBQPedidosDiaTBPED_NUMPED: TIBStringField;
    IBQPedidosDiaTBPED_CANCELADO: TIBStringField;
    CDSPedidos: TClientDataSet;
    CDSPedidosDIA: TDateField;
    CDSPedidosVALDIA: TCurrencyField;
    DataSource1: TDataSource;
    PNGButton1: TPNGButton;
    CDSPedidosVALACUM: TCurrencyField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure MontarCDS(DataIni:TDate );
    procedure FormShow(Sender: TObject);
  private
    ValTotal:Currency;
    vAno,vMes: string;
    QuantDias:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarFatMensal: TFrmConsultarFatMensal;

implementation
Uses UPrincipal, UMensagens, Math, URelatorioPedDias, URelFaturamentoMes, UGraficoEstimadoFaturamento;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmConsultarFatMensal.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarFatMensal.PNGButton6Click(Sender: TObject);
Var DiasNoMes:Integer;
    DiasTrabalhados, vDia:Integer;
    Count:Integer;
begin
  DiasTrabalhados:=0;
 
  DiasNoMes:=DaysInMonth(EncodeDate(StrToInt(vAno), StrToInt(vMes), 1  ));
  for vDia:=1 to DiasNoMes do
  begin
     If DayOfTheWeek(EncodeDate(StrToInt(vAno),StrToInt(vMes), vDia  )) < 7 then
     begin
       DiasTrabalhados:=DiasTrabalhados+1;

     end;

  end;
  MontarCDS(EncodeDate(StrToInt(vAno),StrToInt(vMes), 1 )) ;

  Application.CreateForm(TFrmRelFaturamentoMensal, FrmRelFaturamentoMensal);
  FrmRelFaturamentoMensal.QRLabelde.Caption := ' Mês ' + vMes + ' de ' + vAno;
  //FrmRelFaturamentoMensal.QrLabelAte.Caption := FormatDateTime('DD/MM/YYYY',Now());
  FrmRelFaturamentoMensal.QrLabelTotal.Caption :='R$ '+ FormatFloat('#,,0.00',ValTotal);
  FrmRelFaturamentoMensal.QRLabelQuantDias.Caption:=IntToStr(QuantDias );
  FrmRelFaturamentoMensal.QRLabelMedia.Caption:='R$ '+ FormatFloat('#,,0.00',(ValTotal/QuantDias ));
  FrmRelFaturamentoMensal.QRLabelDTRabalhados.Caption:=IntToStr(DiasTrabalhados);
  FrmRelFaturamentoMensal.QRLabelEstMesal.Caption := 'R$ '+ FormatFloat('#,,0.00',(DiasTrabalhados * ((ValTotal/QuantDias ) )));
  FrmRelFaturamentoMensal.QuickRep1.PreviewModal;
  FreeAndNil(FrmRelFaturamentoMensal);
  CDSPedidos.EmptyDataSet;
  CDSPedidos.Close;
end;

procedure TFrmConsultarFatMensal.PNGButton1Click(Sender: TObject);
begin
  MontarCDS(EncodeDate(StrToInt(vAno),StrToInt(vMes), 1 )) ;
  If not CDSPedidos.IsEmpty then
  begin
    Application.CreateForm(TFrmGraficoEstimaFaturamento, FrmGraficoEstimaFaturamento);
    FrmGraficoEstimaFaturamento.Series1.Clear;
    FrmGraficoEstimaFaturamento.Series1.Marks.Style:=smsPercent;
    CDSPedidos.First;
    While not CDSPedidos.Eof do
    begin
      FrmGraficoEstimaFaturamento.Series1.Add(CDSPedidosVALDIA.AsInteger,CDSPedidosDIA.AsString);
      CDSPedidos.Next;
    end;
    FrmGraficoEstimaFaturamento.ShowModal;
    FreeAndNil(FrmGraficoEstimaFaturamento);
  end;


  CDSPedidos.EmptyDataSet;
  CDSPedidos.Close;
                     
end;

procedure TFrmConsultarFatMensal.MontarCDS(DataIni:TDate);
var
  DiaAtual, DiaAnterior:TDate;
  ValDia:Currency;
begin
  QuantDias:=0;
  IBQPedidosDia.Close;
  IBQPedidosDia.SQL.Clear;
  IBQPedidosDia.SQL.Add('SELECT    TB_PEDIDOS.ID_PEDIDO, '+
                              ' TBPED_DATA, '+
                              ' TBPED_VALTOTAL, '+
                              ' TBPED_NUMPED, '+
                              ' TBPED_CANCELADO '+

                     ' FROM TB_PEDIDOS '+
                     ' INNER JOIN TB_PRAZOS '+
                     ' ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO) '+
                     ' INNER JOIN TB_USUARIO '+
                     ' ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO '+
                     ' WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin '+
                     ' AND (TBPED_CANCELADO IS NULL or TBPED_CANCELADO<>''S'')');

  IBQPedidosDia.SQL.Add(' ORDER BY  TBPED_DATA ');
  IBQPedidosDia.ParamByName('pDataIni').AsDate:= DataIni ;
  IBQPedidosDia.ParamByName('pDataFin').AsDate:= Now ;
  IBQPedidosDia.Open;


  If Not IBQPedidosDia.IsEmpty then
  begin
    ValTotal:=0;
    ValDia:=0;
    CDSPedidos.CreateDataSet;
    IBQPedidosDia.First;
    DiaAnterior:= IBQPedidosDiaTBPED_DATA.AsDateTime;
    While not IBQPedidosDia.Eof do
    begin
      If IBQPedidosDiaTBPED_DATA.AsDateTime= DiaAnterior then
      begin
        ValDia:=ValDia + IBQPedidosDiaTBPED_VALTOTAL.AsCurrency;
        ValTotal :=ValTotal +  IBQPedidosDiaTBPED_VALTOTAL.AsCurrency;
        DiaAtual:= IBQPedidosDiaTBPED_DATA.AsDateTime;
      end
      else
      begin
        QuantDias:=QuantDias + 1;
        CDSPedidos.Append;
        CDSPedidosDIA.AsDateTime:= DiaAtual;
        CDSPedidosVALDIA.AsCurrency :=ValDia;
        CDSPedidosVALACUM.AsCurrency :=ValTotal;  
        CDSPedidos.Post;
        ValDia:= 0;
        DiaAnterior:=IBQPedidosDiaTBPED_DATA.AsDateTime;

        ValDia:=ValDia + IBQPedidosDiaTBPED_VALTOTAL.AsCurrency;
        ValTotal :=ValTotal +  IBQPedidosDiaTBPED_VALTOTAL.AsCurrency;
        DiaAtual:= IBQPedidosDiaTBPED_DATA.AsDateTime;
      end;

      IBQPedidosDia.Next;

    End;
    CDSPedidos.Append;
    //CDSPedidos.Append;
    CDSPedidosDIA.AsDateTime:= DiaAtual;
    CDSPedidosVALDIA.AsCurrency :=ValDia;
    CDSPedidosVALACUM.AsCurrency :=ValTotal;
    CDSPedidos.Post;
    QuantDias:=QuantDias + 1;
  end;

end;

procedure TFrmConsultarFatMensal.FormShow(Sender: TObject);
begin
  vAno:= FormatDateTime('yyyy', NOW);
  vMes:=FormatDateTime('MM', NOW);
end;

end.
