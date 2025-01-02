unit UConsultaDespesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery;

type
  TFrmConsultarDespesas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    PNGButton1: TPNGButton;
    IBQDespesas: TIBQuery;
    DDsBoletos: TDataSource;
    Label2: TLabel;
    IBQUtil: TIBQuery;
    PnlItens: TPanel;
    DBGrid2: TDBGrid;
    IBQBoletos: TIBQuery;
    DSDespesas: TDataSource;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
    IBQDespesasTBG_VALOR: TIBBCDField;
    IBQDespesasTBG_DATA: TDateField;
    IBQDespesasID_FORNECEDOR: TIntegerField;
    IBQDespesasTBG_DESCRICAO: TIBStringField;
    IBQDespesasTBFOR_NOME: TIBStringField;
    IBQDespesasTBG_EMISSAO: TDateField;
    IBQDespesasTBG_NUMNOTA: TIBStringField;
    IBQBoletosTBCONT_NUMNOTA: TIBStringField;
    IBQBoletosTBCONT_EMISSAO: TDateField;
    IBQBoletosTBCONT_VALORNOTA: TIBBCDField;
    IBQBoletosTBCONT_VENCIMENTO: TDateField;
    IBQBoletosTBCONT_VALOR: TIBBCDField;
    IBQBoletosTBCONT_STATUS: TIBStringField;
    IBQBoletosTBCONT_DATAPAG: TDateField;
    IBQBoletosTBCONT_DESCRICAO: TIBStringField;
    IBQBoletosTBFOR_NOME: TIBStringField;
    Label3: TLabel;
    EdtTotal: TEdit;
    CDSRelDespesas: TClientDataSet;
    DSRelDespesas: TDataSource;
    CDSRelDespesasData: TDateField;
    CDSRelDespesasFornecedor: TStringField;
    CDSRelDespesasValor: TCurrencyField;
    CDSRelDespesasNota: TStringField;
    CDSRelDespesasVencimento: TDateField;
    CDSRelDespesasBoleto: TStringField;
    CDSRelDespesasDescricao: TStringField;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarDespesas: TFrmConsultarDespesas;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math, URelatorioDespesas;

{$R *.dfm}

procedure TFrmConsultarDespesas.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarDespesas.FormShow(Sender: TObject);
Var Pedido:Tpedido;
begin
 { IBQClientes.Open;
  While not  IBQClientes.Eof Do
  Begin
    Pedido:= TPedido.Create;
    Pedido.NomeCli     :=IBQClientes.FieldByName('TBPED_NOME').AsString;
    CBoxClientes.AddItem(Pedido.NomeCli , Pedido);
    IBQClientes.Next;
  End; }
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;

end;

procedure TFrmConsultarDespesas.PNGButton1Click(Sender: TObject);
var Total:Currency;
begin
  EdtTotal.Clear;
  Total :=0;
  //Despesas
  IBQDespesas.Close;
  IBQDespesas.Sql.Clear;
  IBQDespesas.Sql.Add('SELECT  TBG_VALOR, '+
                             ' TBG_DATA,  '+
                             ' TB_GASTOS.ID_FORNECEDOR, '+
                             ' TB_FORNECEDORES.ID_FORNECEDOR, '+
                             ' TBG_DESCRICAO, '+
                             ' TBFOR_NOME, '+
                             ' TBG_EMISSAO, '+
                             ' TBG_NUMNOTA  '+
                       ' FROM TB_GASTOS   '+
                      ' INNER JOIN TB_FORNECEDORES '+
                      '    ON TB_FORNECEDORES.ID_FORNECEDOR=TB_GASTOS.ID_FORNECEDOR '+
                      ' WHERE TBG_DATA BETWEEN :pDataIni AND :pDataFin  '+
                      ' ORDER BY TBG_DATA');  


  IBQDespesas.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQDespesas.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQDespesas.Open;
  if not IBQDespesas.IsEmpty then
  begin
    IBQDespesas.DisableControls;
    IBQDespesas.First;
    While Not IBQDespesas.Eof Do
    begin
      Total:= Total+ IBQDespesasTBG_VALOR.AsCurrency;
      IBQDespesas.Next;

    End;
    IBQDespesas.EnableControls;
  End;

  //Boletos
  IBQBoletos.Close;
  IBQBoletos.Sql.Clear;
  IBQBoletos.Sql.Add('SELECT  TBCONT_NUMNOTA, '+
                            '  TBCONT_EMISSAO, '+
                            '  TBCONT_VALORNOTA, '+
                            '  TBCONT_VENCIMENTO, '+
                            '  TBCONT_VALOR, '+
                            '  TBCONT_STATUS, '+
                            '  TBCONT_DATAPAG, '+
                            '  TBCONT_DESCRICAO, '+
                            '  TBFOR_NOME  '+
                     '  FROM TB_CONTASPAGAR  '+
                     ' INNER JOIN TB_FORNECEDORES '+
                        ' ON TB_FORNECEDORES.ID_FORNECEDOR= TB_CONTASPAGAR.ID_FORNECEDOR '+
                     ' WHERE TBCONT_DATAPAG BETWEEN :pDataIni AND :pDataFin '+
                    '  ORDER BY   TBCONT_DATAPAG ');


  IBQBoletos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQBoletos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQBoletos.Open;
  if not IBQBoletos.IsEmpty then
  begin
    IBQBoletos.DisableControls;
    IBQBoletos.First;
    While Not IBQBoletos.Eof Do
    begin
      Total:= Total+ IBQBoletosTBCONT_VALOR.AsCurrency;
      IBQBoletos.Next;

    End;
    IBQBoletos.EnableControls;
  End;
  EdtTotal.Text := 'R$ ' + FormatFloat('#,,0.00',Total);


end;

procedure TFrmConsultarDespesas.PNGButton6Click(Sender: TObject);
var Total:Currency;
begin

    If ( not IBQDespesas.IsEmpty ) Or (not IBQBoletos.IsEmpty) then
    Begin
      Total:=0;
      CDSRelDespesas.CreateDataSet;
      If ( not IBQDespesas.IsEmpty ) Then
      Begin
        IBQDespesas.DisableControls;
        IBQDespesas.First;
        While not IBQDespesas.Eof do
        begin
          CDSRelDespesas.Append;
          CDSRelDespesasData.AsDateTime       := IBQDespesasTBG_DATA.AsDateTime;
          CDSRelDespesasFornecedor.AsString   := IBQDespesasTBFOR_NOME.AsString;
          CDSRelDespesasValor.AsCurrency      := IBQDespesasTBG_VALOR.AsCurrency  ;
          CDSRelDespesasNota.AsString         := IBQDespesasTBG_NUMNOTA.AsString ;
          CDSRelDespesasBoleto.AsString       := 'N';
          CDSRelDespesasDescricao.AsString    := IBQDespesasTBG_DESCRICAO.AsString;
          CDSRelDespesas.Post;
          Total:= Total+IBQDespesasTBG_VALOR.AsCurrency ;
          IBQDespesas.Next;
        End;
        IBQDespesas.EnableControls;
      end;
      If ( not IBQBoletos.IsEmpty ) Then
      Begin
        IBQBoletos.DisableControls;
        IBQBoletos.First;
        While not IBQBoletos.Eof do
        begin
          CDSRelDespesas.Append;
          CDSRelDespesasData.AsDateTime       := IBQBoletosTBCONT_DATAPAG.AsDateTime  ;
          CDSRelDespesasFornecedor.AsString   := IBQBoletosTBFOR_NOME.AsString;
          CDSRelDespesasValor.AsCurrency      := IBQBoletosTBCONT_VALOR.AsCurrency  ;
          CDSRelDespesasNota.AsString         := IBQBoletosTBCONT_NUMNOTA.AsString ;
          CDSRelDespesasBoleto.AsString       := 'S';
          CDSRelDespesasDescricao.AsString    := IBQBoletosTBCONT_DESCRICAO.AsString;
          CDSRelDespesas.Post;
          Total:=Total+IBQBoletosTBCONT_VALOR.AsCurrency ;
          IBQBoletos.Next;
        End;
        IBQBoletos.EnableControls; 
      end;
      Application.CreateForm(TFrmRelDespesas, FrmRelDespesas);
      FrmRelDespesas.QRLabel8.Caption := 'Total: R$ ' + FormatFloat('#,,0.00',Total);
      FrmRelDespesas.QRLabelPeriodo.Caption:= 'Período: de '+ FormatDateTime('DD/MM/YYYY', DTPickerIni.Date)+
                                              ' Até '+ FormatDateTime('DD/MM/YYYY', DTPickerFin.Date);
      FrmRelDespesas.QuickRep1.PreviewModal;
      FreeAndNil(FrmRelDespesas);
    End;



end;

end.
