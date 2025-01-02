unit ULocalizarGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, pngextra, StdCtrls, DB,
  IBCustomDataSet, IBQuery, ComCtrls, IBSQL, IBTable;
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
    DSGastos: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    IBQGastosTBG_VALOR: TIBBCDField;
    IBQGastosTBG_DATA: TDateField;
    IBQGastosID_FORNECEDOR: TIntegerField;
    IBQGastosTBG_DESCRICAO: TIBStringField;
    DateTimePicker1: TDateTimePicker;
    IBSQL1: TIBSQL;
    CBoxFornecedor: TComboBox;
    IBQGastosTBFOR_NOME: TIBStringField;
    IBQGastosID_GASTO: TIntegerField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
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
  IBQGastos.Close;
  IBQGastos.SQL.Clear;
  StrSql:= 'SELECT ID_GASTO, '+
                '  TBG_VALOR, '+
                '  TBG_DATA, '+
                '  TB_GASTOS.ID_FORNECEDOR, '+
                '  TB_FORNECEDORES.ID_FORNECEDOR, '+
                '  TBG_DESCRICAO, '+
                '  TBFOR_NOME  '+
           ' FROM TB_GASTOS  '+
           ' INNER JOIN TB_FORNECEDORES '+
             '  ON TB_FORNECEDORES.ID_FORNECEDOR=TB_GASTOS.ID_FORNECEDOR '+
           ' WHERE TBG_DATA=:pData ' ;


  IBQGastos.Sql.Add(StrSQL);
  if CBoxFornecedor.Text <> 'TODOS' then
  Begin
     IBQGastos.Sql.Add(' AND ID_FORNECEDOR=:pFornecedor ');
     IBQGastos.ParamByName('pFornecedor').AsString :=IntToStr(((CBoxFornecedor.Items.Objects[CBoxFornecedor.ITemIndex] As TFornecedor).Id));
  end;
    IBQGastos.Sql.Add(' ORDER BY TBG_DATA');
  IBQGastos.ParamByName('pData').AsDate  :=DateTimePicker1.Date;
  
  IBQGastos.Open;

end;

procedure TFrmBuscarGastos.FormShow(Sender: TObject);
Var Fornec:TFornecedor;
begin
  DateTimePicker1.Date:=Now();  
  if not FrmPrincipal.IBTMain.Active Then
    FrmPrincipal.IBTMain.StartTransaction;
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

procedure TFrmBuscarGastos.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

end.
