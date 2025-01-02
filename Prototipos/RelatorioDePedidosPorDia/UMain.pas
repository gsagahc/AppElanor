unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, IBCustomDataSet, IBQuery, IBDatabase,
  DBClient;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    IBTMain: TIBTransaction;
    IBDMain: TIBDatabase;
    IBQuery1: TIBQuery;
    IBQPedidosDia: TIBQuery;
    CDSPedidos: TClientDataSet;
    DSPedidos: TDataSource;
    IBQPedidosDiaID_PEDIDO: TIntegerField;
    IBQPedidosDiaTBPED_DATA: TDateField;
    IBQPedidosDiaTBPED_VALTOTAL: TIBBCDField;
    IBQPedidosDiaTBPED_NUMPED: TIBStringField;
    IBQPedidosDiaTBPED_CANCELADO: TIBStringField;
    CDSPedidosDIA: TDateField;
    CDSPedidosVALDIA: TCurrencyField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
uses URelatorioPedDias;

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
  DiaAtual, DiaAnterior:TDate;
  ValTotal, ValDia:Currency;

begin
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
        CDSPedidos.Append;
        CDSPedidosDIA.AsDateTime:= DiaAtual;
        CDSPedidosVALDIA.AsCurrency :=ValDia;
        CDSPedidos.Post;
        ValDia:= 0;
        DiaAnterior:=IBQPedidosDiaTBPED_DATA.AsDateTime;

        ValDia:=ValDia + IBQPedidosDiaTBPED_VALTOTAL.AsCurrency;
        ValTotal :=ValTotal +  IBQPedidosDiaTBPED_VALTOTAL.AsCurrency;
        DiaAtual:= IBQPedidosDiaTBPED_DATA.AsDateTime;
      end;

      IBQPedidosDia.Next;
    End;
  end;
  Application.CreateForm(TFrmRelPedidos, FrmRelPedidos);
  FrmRelPedidos.QRLabelde.Caption := DateToStr(DTPickerIni.Date);
  FrmRelPedidos.QrLabelAte.Caption := DateToStr(DTPickerFin.Date);
  FrmRelPedidos.QrLabelTotal.Caption := 'Valor total: R$ ' + FormatFloat('#,,0.00',ValTotal);
  FrmRelPedidos.QuickRep1.PreviewModal;
  FreeAndNil(FrmRelPedidos);
  CDSPedidos.EmptyDataSet;
  CDSPedidos.Close;  
end;

end.
