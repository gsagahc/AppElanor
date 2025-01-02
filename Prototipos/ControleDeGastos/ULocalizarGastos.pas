unit ULocalizarGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery, ComCtrls, IBSQL;
type TFornecedor = class
     Nome: string;
     Id:  Integer;
end;
type
  TFrmBuscarGastos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    IBQGastos: TIBQuery;
    DSFornecedor: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    IBQGastosTBG_VALOR: TIBBCDField;
    IBQGastosTBG_DATA: TDateField;
    IBQGastosID_FORNECEDOR: TIntegerField;
    IBQGastosTBG_DESCRICAO: TIBStringField;
    DateTimePicker1: TDateTimePicker;
    IBSQL1: TIBSQL;
    CBoxFornecedor: TComboBox;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarGastos: TFrmBuscarGastos;

implementation
Uses UPrincipal, UMensagens;

{$R *.dfm}

procedure TFrmBuscarGastos.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarGastos.PNGButton6Click(Sender: TObject);
var StrSQL:String;
begin
  StrSql:='SELECT * FROM TB_GASTOS WHERE TBG_DATA='''+ DateToStr(DateTimePicker1.Date)+'''';
  IBQGastos.Close;
  IBQGastos.SQL.Clear;
  IBQGastos.Sql.Add(StrSQL);
  if CBoxFornecedor.Text <> 'NENHUM' then
     IBQGastos.Sql.Add('AND ID_FORNECEDOR='+IntToStr((CBoxFornecedor.Items.Objects[CBoxFornecedor.ITemIndex] As TFornecedor).Id));
  IBQGastos.Open;
 
end;

procedure TFrmBuscarGastos.FormShow(Sender: TObject);
Var Fornec:TFornecedor;
begin
  IBSQL1.Close;
  IBSQL1.SQL.Clear;
  IBSQL1.SQL.Add ('SELECT  ID_FORNECEDOR, TBFOR_NOME FROM TB_FORNECEDORES');
  IBSQL1.ExecQuery;
  If Not IBSQL1.Eof then
  begin
    while Not IBSQL1.Eof do
    begin
      Fornec := TFornecedor.Create;
      Fornec.Nome := IBSQL1.FieldByName('TBFOR_NOME').AsString;
      Fornec.Id  :=  IBSQL1.FieldByName('ID_FORNECEDOR').AsInteger;
      CBoxFornecedor.AddItem(Fornec.Nome, Fornec );
      IBSQL1.Next;
    end;
    CBoxFornecedor.Enabled:= True;  
  end;
end;

end.
