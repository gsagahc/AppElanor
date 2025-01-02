unit UConsultaPedDia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, Chart,
  Series, IBSQL, DbChart,TeeProcs, TeEngine;

Type TPedido = Class
     public
     NomeCli:String;
     Id_pedido:Integer;
     NomeProd:String;
     Id_produto:Integer;
End;

type
  TFrmConsultarPedDia = class(TForm)
    Panel1: TPanel;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    Label2: TLabel;
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
    procedure FormShow(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure MontarCDS;
  private
    ValTotal:Currency;
    QuantDias:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPedDia: TFrmConsultarPedDia;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math, URelatorioPedDias, UGraficoDeFaturamentoDiario;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmConsultarPedDia.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPedDia.FormShow(Sender: TObject);
begin
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
end;

procedure TFrmConsultarPedDia.PNGButton6Click(Sender: TObject);
begin
  MontarCDS;
  Application.CreateForm(TFrmRelPedidosDia, FrmRelPedidosDia);
  FrmRelPedidosDia.QRLabelde.Caption := DateToStr(DTPickerIni.Date);
  FrmRelPedidosDia.QrLabelAte.Caption := DateToStr(DTPickerFin.Date);
  FrmRelPedidosDia.QrLabelTotal.Caption :='R$ '+ FormatFloat('#,,0.00',ValTotal);
  FrmRelPedidosDia.QRLabelQuantDias.Caption:=IntToStr(QuantDias );
  FrmRelPedidosDia.QRLabelMedia.Caption:='R$ '+ FormatFloat('#,,0.00',(ValTotal/QuantDias ));
  FrmRelPedidosDia.QuickRep1.PreviewModal;
  FreeAndNil(FrmRelPedidosDia);
  CDSPedidos.EmptyDataSet;
  CDSPedidos.Close;
end;

procedure TFrmConsultarPedDia.PNGButton1Click(Sender: TObject);
begin
   MontarCDS;
  If not CDSPedidos.IsEmpty then
  begin
    Application.CreateForm(TFrmGraficoFaturamentodia, FrmGraficoFaturamentodia);
    FrmGraficoFaturamentodia.Series1.Clear;
    FrmGraficoFaturamentodia.Series1.Marks.Style:=smsPercent;
    CDSPedidos.First;
    While not CDSPedidos.Eof do
    begin
      FrmGraficoFaturamentodia.Series1.Add(CDSPedidosVALDIA.AsInteger,CDSPedidosDIA.AsString);
      CDSPedidos.Next;
    end;
    FrmGraficoFaturamentodia.ShowModal;
    FreeAndNil(FrmGraficoFaturamentodia);
  end;


  CDSPedidos.EmptyDataSet;
  CDSPedidos.Close;

end;

procedure TFrmConsultarPedDia.MontarCDS;
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
  IBQPedidosDia.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQPedidosDia.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
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

end.
