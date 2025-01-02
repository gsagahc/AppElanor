unit USelecionarDespesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, ComCtrls, StdCtrls, pngextra,
  ExtCtrls;
type
   TTipoDespesa = class
   Nome:string;
   Id:Integer;
End;

type
  TFrmSelecionaDespesas = class(TForm)
    Panel1: TPanel;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    Label2: TLabel;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    IBQDespesas: TIBQuery;
    DataSource1: TDataSource;
    ComboBoxTipoDespesa: TComboBox;
    IBQUtil: TIBQuery;
    IBQUtilTBCADDESP_NOME: TIBStringField;
    IBQUtilID_CADDESPESAS: TIntegerField;
    IBQDespesasTBG_DATA: TDateField;
    IBQDespesasTBG_VALOR: TIBBCDField;
    IBQDespesasTBG_DESCRICAO: TIBStringField;
    IBQDespesasID_FORNECEDOR: TIntegerField;
    IBQDespesasTBG_EMISSAO: TDateField;
    IBQDespesasTBG_NUMNOTA: TIBStringField;
    IBQDespesasID_CADDESPESAS: TIntegerField;
    IBQDespesasTBCADDESP_NOME: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecionaDespesas: TFrmSelecionaDespesas;

implementation
Uses UPrincipal, uMensagens, URelatorioDeCustos;

{$R *.dfm}

procedure TFrmSelecionaDespesas.FormShow(Sender: TObject);
var Tipodesdesp: TTipoDespesa;
begin
  DTPickerIni.Date := Now;
  DTPickerFin.Date := Now;
  IBQUtil.Open;
  If Not IBQUtil.IsEmpty then
  begin
    while Not IBQUtil.Eof do
    begin
      Tipodesdesp      :=TTipoDespesa.Create;
      Tipodesdesp.Nome :=IBQUtilTBCADDESP_NOME.AsString;
      Tipodesdesp.Id   :=IBQUtilID_CADDESPESAS.AsInteger;
      ComboBoxTipoDespesa.AddItem(Tipodesdesp.Nome,Tipodesdesp );
      IBQUtil.Next;
    end;
  end;

end;

procedure TFrmSelecionaDespesas.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSelecionaDespesas.PNGButton6Click(Sender: TObject);
Var TotalCustos:Currency;
begin
  TotalCustos:=0;
  IBQDespesas.Close;
  IBQDespesas.SQL.Clear;
  IBQDespesas.SQL.Add('SELECT TBG_DATA, '+
                           '  TBG_VALOR, '+
                           '  TBG_DESCRICAO, '+
                           '  ID_FORNECEDOR, '+
                           '  TBG_EMISSAO, '+
                           '  TBG_NUMNOTA, '+
                           '  TB_GASTOS.ID_CADDESPESAS, '+
	                         '  TBCADDESP_NOME '+
                           '  FROM TB_GASTOS '+
                           '  INNER JOIN TB_CADDESPESAS '+
                           '  ON TB_CADDESPESAS.ID_CADDESPESAS=TB_GASTOS.ID_CADDESPESAS '+
                           '  WHERE TBG_DATA BETWEEN :PDATAINI AND :PDATAFIN ' );
  If ComboBoxTipoDespesa.Text <> 'TODAS' then
  Begin
     IBQDespesas.SQL.Add(' AND TB_GASTOS.ID_CADDESPESAS=:PID_CADDESPESAS ');
     IBQDespesas.ParamByName('PID_CADDESPESAS').AsInteger := (ComboBoxTipoDespesa.Items.Objects[ComboBoxTipoDespesa.ITemIndex] As TTipoDespesa).Id;
  End;
  IBQDespesas.ParamByName('PDATAINI').AsDate :=DTPickerIni.Date;
  IBQDespesas.ParamByName('PDATAFIN').AsDate :=DTPickerFin.Date;
  IBQDespesas.Open;
  If not IBQDespesas.IsEmpty then
  Begin
    IBQDespesas.DisableControls;
    IBQDespesas.First;
    while not IBQDespesas.Eof do
    begin
      TotalCustos:=TotalCustos+IBQDespesasTBG_VALOR.AsCurrency;
      IBQDespesas.Next;
    end;
    end;
    IBQDespesas.EnableControls;
    Application.CreateForm(TFrmRelCustos, FrmRelCustos);
    FrmRelCustos.QRLTotal.Caption :=FormatCurr('R$ #,###.00',TotalCustos );
    FrmRelCustos.QuickRep1.PreviewModal;
    FrmRelCustos.Free;
    Close;
end;


end.
