unit UContasPagasPPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery, ComCtrls;

type
  TFrmBuscarContaPaga = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    IBQContaPaga: TIBQuery;
    DSFornecedor: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    PNGBImprimir: TPNGButton;
    IBQContaPagaTBCONT_NUMNOTA: TIBStringField;
    IBQContaPagaTBCONT_EMISSAO: TDateField;
    IBQContaPagaTBCONT_VALORNOTA: TIBBCDField;
    IBQContaPagaTBCONT_VENCIMENTO: TDateField;
    IBQContaPagaTBCONT_VALOR: TIBBCDField;
    IBQContaPagaTBFOR_NOME: TIBStringField;
    IBQUtil: TIBQuery;
    IBQContaPagaTBCONT_DATAPAG: TDateField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGBImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarContaPaga: TFrmBuscarContaPaga;

implementation
Uses UPrincipal, UMensagens, Math, URelContasPagas;

{$R *.dfm}

procedure TFrmBuscarContaPaga.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarContaPaga.PNGButton6Click(Sender: TObject);
begin
  IBQContaPaga.Close;
  IBQContaPaga.ParamByName('pDataIni').AsString:=DateToStr(DateTimePicker1.Date );
  IBQContaPaga.ParamByName('pDataFin').AsString:=DateToStr(DateTimePicker2.Date );
  IBQContaPaga.Open;
  if Not IBQContaPaga.IsEmpty Then
    PNGBImprimir.Enabled :=True
  Else
    PNGBImprimir.Enabled :=False;

end;

procedure TFrmBuscarContaPaga.PNGBImprimirClick(Sender: TObject);
Var MesAnterior:string;
      Meses:TStringList;
      Total, TotalGeral:Currency;
      I:Integer;
      Registro:Integer;
begin
  TotalGeral:=0;
  if not FrmPrincipal.IBTMain.Active Then
    FrmPrincipal.IBTMain.StartTransaction;
   
  Application.CreateForm(TFrmRelContasPagas,FrmRelContasPagas);
  MesAnterior:='';

  If not IBQContaPaga.IsEmpty then
  begin
    Meses:=TStringList.Create;
    IBQContaPaga.DisableControls;
    IBQContaPaga.First;
    While not IBQContaPaga.Eof do
    begin
      FrmPrincipal.IBSQLContasPagTemp.Close;
      if MesAnterior <>FrmPrincipal.retornaMespExtenso(Copy(IBQContaPaga.FieldByName('TBCONT_VENCIMENTO').AsString, 4,2 )) then
      Begin
        FrmPrincipal.IBSQLContasPagTemp.ParamByName('pMES').AsString := FrmPrincipal.retornaMespExtenso(Copy(IBQContaPaga.FieldByName('TBCONT_VENCIMENTO').AsString, 4,2 ));
        MesAnterior                                                  := FrmPrincipal.retornaMespExtenso(Copy(IBQContaPaga.FieldByName('TBCONT_VENCIMENTO').AsString, 4,2 ));
        Meses.Add(MesAnterior);
      End
      else
      Begin
         FrmPrincipal.IBSQLContasPagTemp.ParamByName('pMES').AsString:='';
      end;
      FrmPrincipal.IBSQLContasPagTemp.ParamByName('pREGMES').AsString       := FrmPrincipal.retornaMespExtenso(Copy(IBQContaPaga.FieldByName('TBCONT_VENCIMENTO').AsString, 4,2 ));
      FrmPrincipal.IBSQLContasPagTemp.ParamByName('pNUMNOTA').AsString      := IBQContaPaga.FieldByName('TBCONT_NUMNOTA').AsString;
      FrmPrincipal.IBSQLContasPagTemp.ParamByName('pEMISSAO').AsString      := IBQContaPaga.FieldByName('TBCONT_EMISSAO').AsString;
      FrmPrincipal.IBSQLContasPagTemp.ParamByName('pFORNECEDOR').AsString   := IBQContaPaga.FieldByName('TBFOR_NOME').AsString;
      FrmPrincipal.IBSQLContasPagTemp.ParamByName('pVALORNOTA').AsCurrency  := IBQContaPaga.FieldByName('TBCONT_VALORNOTA').AsCurrency ;
      FrmPrincipal.IBSQLContasPagTemp.ParamByName('pVENCIMENTO').AsString   := IBQContaPaga.FieldByName('TBCONT_VENCIMENTO').AsString;
      FrmPrincipal.IBSQLContasPagTemp.ParamByName('pVALOR').AsCurrency      := IBQContaPaga.FieldByName('TBCONT_VALOR').AsCurrency ;
      FrmPrincipal.IBSQLContasPagTemp.ParamByName('pDATAPAG').AsString      := IBQContaPaga.FieldByName('TBCONT_DATAPAG').AsString ;
      FrmPrincipal.IBSQLContasPagTemp.ExecQuery;
      IBQContaPaga.Next;
    end;
  end;
  //Atualizando Totais

  For i:=0 to Meses.Count -1 do
  begin
    Total:=0;
    IBQUtil.Close;
    IBQUtil.SQL.Clear;
    IBQUtil.Sql.Add('SELECT TBCONT_VALOR, '+
                          ' ID_CONTASPAGARTEMP '+
                     ' FROM TB_CONTASPAGARTEMP '+
                     'WHERE  TBCONT_REGMES=:pMes' );
    IBQUtil.ParamByName('pMes').AsString:=Meses[i];
    IBQUtil.Open;
    IBQUtil.First;
    While not IBQUtil.Eof do
    begin
      Total:= Total + IBQUtil.FieldByName('TBCONT_VALOR').AsCurrency;
      Registro:= IBQUtil.FieldByName('ID_CONTASPAGARTEMP').AsInteger;
      IBQUtil.Next;
    end;
    FrmPrincipal.IBSQLUTIL.Close;
    FrmPrincipal.IBSQLUTIL.SQL.Clear;
    FrmPrincipal.IBSQLUTIL.SQL.Add('UPDATE TB_CONTASPAGARTEMP '+
                         'SET '+
                           '  TBCONT_TOTAL= :pTOTAL '+
                     '  WHERE '+
                            ' ID_CONTASPAGARTEMP = :pIDCONTA ');
    FrmPrincipal.IBSQLUTIL.ParamByName('pTOTAL').AsCurrency := Total ;
    TotalGeral := TotalGeral + Total;
    FrmPrincipal.IBSQLUTIL.ParamByName('pIDCONTA').AsCurrency := Registro ;
    FrmPrincipal.IBSQLUTIL.ExecQuery;
  End;

  FrmRelContasPagas.IBQContasPag.Open;
  FrmRelContasPagas.QRLabel9.Caption := 'Total de débitos pagos: ' + formatfloat('R$ #.##0,##', TotalGeral);
  FrmRelContasPagas.QuickRep1.PreViewModal;
  FreeAndNil(FrmRelContasPagas);
  FrmPrincipal.IBTMain.Rollback;
{ IBSQLUTIL.Close;
  IBSQLUTIL.SQL.Clear;
  IBSQLUTIL.SQL.Add('DELETE FROM TB_CONTASPAGARTEMP');
  IBSQLUTIL.ExecQuery;
  IBTMain.StartTransaction;}
end;

end.
