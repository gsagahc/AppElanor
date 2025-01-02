unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Menus, IBSQL, IBDatabase, DB,
  IBCustomDataSet, IBQuery, ImgList, StdCtrls, DBClient, StrUtils, ComObj;
type
  TPagamentosPHoje = class
  Vencimento: TDate;
  Emissao:TDate;
  Fornecedor:String;
  Valor: Currency;
  NumNota:string;
  ValorNota:Currency;
end;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    TViewContas: TTreeView;
    Cadastrodefornecedores1: TMenuItem;
    IBDMain: TIBDatabase;
    IBTMain: TIBTransaction;
    IBSQLUTIL: TIBSQL;
    Cadastrodecontasapagar1: TMenuItem;
    IBQUtil: TIBQuery;
    ImageList1: TImageList;
    MemoDados: TMemo;
    Panel3: TPanel;
    BaixarContaapagar1: TMenuItem;
    Cadastros1: TMenuItem;
    Relatrios1: TMenuItem;
    imprimircontasapagaremaberto1: TMenuItem;
    Contasapagar1: TMenuItem;
    IBSQLContasPagTemp: TIBSQL;
    Imprimircontaspagas1: TMenuItem;
    Exportarparaexcel1: TMenuItem;
    DsContasPagar: TDataSource;
    IBQContasPag: TIBQuery;
    IBQContasPagTBCONT_NUMNOTA: TIBStringField;
    IBQContasPagTBCONT_EMISSAO: TDateField;
    IBQContasPagFORNECEDOR: TIBStringField;
    IBQContasPagTBCONT_VALORNOTA: TIBBCDField;
    IBQContasPagTBCONT_VENCIMENTO: TDateField;
    IBQContasPagTBCONT_VALOR: TIBBCDField;
    IBQContasPagTBCONT_TOTAL: TIBBCDField;
    IBQContasPagTBCONT_MES: TIBStringField;
    procedure Cadastrodefornecedores1Click(Sender: TObject);
    procedure Cadastrodecontasapagar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TViewContasClick(Sender: TObject);
    procedure BaixarContaapagar1Click(Sender: TObject);
    procedure imprimircontasapagaremaberto1Click(Sender: TObject);
    procedure Imprimircontaspagas1Click(Sender: TObject);
    procedure ExportarPExcel;
    procedure CriarContasPagTemp;
    procedure Exportarparaexcel1Click(Sender: TObject);
  private
     TotalGeral:Currency;
    { Private declarations }
  public
   id_fornecedor: Integer;
   IdProduto:Integer;
   id_contapagar:Integer;
   function retornaMespExtenso(mes:string):string;
   procedure atualizarTreeView;
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UCadFornecedor, UcadContasPagar, UBaixarContasPag, URelContasEmAberto,
  UContasPagasPPeriodo;

{$R *.dfm}

procedure TFrmPrincipal.Cadastrodefornecedores1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCadFornec,FrmCadFornec);
  FrmCadFornec.ShowModal;
  FreeAndNil(FrmCadFornec);
end;

procedure TFrmPrincipal.Cadastrodecontasapagar1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCadContasaPagar,FrmCadContasaPagar);
  FrmCadContasaPagar.ShowModal;
  FreeAndNil(FrmCadContasaPagar);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  atualizarTreeView;
end;

procedure TFrmPrincipal.TViewContasClick(Sender: TObject);
begin
  if TViewContas.Selected.Data <> Nil   then
   Begin
      MemoDados.Lines.Clear;
      MemoDados.Visible:=True;
      MemoDados.Lines.Add ('Fornecedor: '     +TPagamentosPHoje(TViewContas.Selected.Data).Fornecedor );
      MemoDados.Lines.Add ('Número da nota: ' +TPagamentosPHoje(TViewContas.Selected.Data).NumNota );
      MemoDados.Lines.Add ('Emissão: '        +DateToStr(TPagamentosPHoje(TViewContas.Selected.Data).Emissao));
      MemoDados.Lines.Add ('Valor da nota:   '+CurrToStr (TPagamentosPHoje(TViewContas.Selected.Data).ValorNota ));
      MemoDados.Lines.Add ('Vencimento: '     +DateToStr(TPagamentosPHoje(TViewContas.Selected.Data).Vencimento ));
      MemoDados.Lines.Add ('Valor: '          +CurrToStr(TPagamentosPHoje(TViewContas.Selected.Data).Valor));

   End;
end;

procedure TFrmPrincipal.BaixarContaapagar1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmBaixarContasPag, FrmBaixarContasPag);
  FrmBaixarContasPag.ShowModal;
  FreeAndNil(FrmBaixarContasPag); 
end;

procedure TFrmPrincipal.atualizarTreeView;
Var PagamentosHoje:TPagamentosPHoje;
begin
  TViewContas.Items.Clear; 
  IBQUtil.Close;
  IBQUtil.ParamByName('pVencimento').AsString:=FormatDateTime('dd/mm/yyyy', Now());
  IBQUtil.Open;
  Panel1.Visible:=False;
  if Not IBQUtil.IsEmpty then
  begin
    IBQUtil.First;
    While not IBQUtil.Eof do
    begin
      PagamentosHoje :=TPagamentosPHoje.Create;
      PagamentosHoje.Emissao := IBQUtil.FieldByName('TBCONT_EMISSAO').AsDateTime;
      PagamentosHoje.NumNota := IBQUtil.FieldByName('TBCONT_NUMNOTA').AsString;
      PagamentosHoje.Fornecedor := IBQUtil.FieldByName('TBFOR_NOME').AsString;
      PagamentosHoje.Vencimento := IBQUtil.FieldByName('TBCONT_VENCIMENTO').AsDateTime;
      PagamentosHoje.Valor  := IBQUtil.FieldByName('TBCONT_VALOR').AsCurrency ;
      PagamentosHoje.ValorNota  := IBQUtil.FieldByName('TBCONT_VALORNOTA').AsCurrency ;
      TViewContas.Items.AddObject(Nil,PagamentosHoje.Fornecedor,PagamentosHoje);
      IBQUtil.Next;
    end;
    Panel1.Visible:=True;
  end;
end;

procedure TFrmPrincipal.imprimircontasapagaremaberto1Click(
  Sender: TObject);
begin
  CriarContasPagTemp;
  Application.CreateForm(TFrmRelContasAberto,FrmRelContasAberto);
  FrmRelContasAberto.IBQContasPag.Open;
  FrmRelContasAberto.QRLabel9.Caption := 'Total de débitos em aberto: ' + formatfloat('R$ #.##0,##', TotalGeral);
  FrmRelContasAberto.QuickRep1.PreViewModal;
  FreeAndNil(FrmRelContasAberto);
  IBTMain.Rollback;

end;

function TFrmPrincipal.retornaMespExtenso(mes: string): string;

begin
  case AnsiIndexStr(UpperCase(mes), ['01', '02','03','04','05','06','07','08','09','10','11','12' ]) of
    0 : result:='JANEIRO';
    1 : result:='FEVEREIRO';
    2 : result:='MARÇO';
    3 : result:='ABRIL';
    4 : result:='MAIO';
    5 : result:='JUNHO';
    6 : result:='JULHO';
    7 : result:='AGOSTO';
    8 : result:='SETEMBRO';
    9 : result:='OUTUBRO';
    10 : result:='NOVEMBRO';
    11 : result:='DEZEMBRO';
  end;
end;

procedure TFrmPrincipal.Imprimircontaspagas1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmBuscarContaPaga, FrmBuscarContaPaga);
  FrmBuscarContaPaga.ShowModal;
  FreeAndNil(FrmBuscarContaPaga);
end;

procedure TFrmPrincipal.ExportarPExcel;
var objExcel,Sheet,Chart,s : Variant;
    cTitulo : string;
    i, l : integer;
    ExcApp: OleVariant;
begin
  CriarContasPagTemp;
  cTitulo := 'Títulos a pagar pendentes';
  ExcApp := CreateOleObject('Excel.Application');
  ExcApp.Visible := True;
  ExcApp.WorkBooks.Add;
  ExcApp.Caption := cTitulo;
  // Adiciona planilha(sheet)


  ExcApp.Workbooks[1].WorkSheets[1].Name := cTitulo;
  Sheet := ExcApp.Workbooks[1].WorkSheets[cTitulo];

  //Criando cabeçalho
  Sheet.Range['A1'] := 'Mês';
  Sheet.Range['B1'] := 'Nota';
  Sheet.Range['C1'] := 'Data de emissão';
  Sheet.Range['D1'] := 'Fornecedor';
  Sheet.Range['F1'] := 'Vencimento';
  Sheet.Range['E1'] := 'Valor da Nota';
  Sheet.Range['G1'] := 'Valor a ser pago';
  Sheet.Range['H1'] := 'Total';

 //Formatando cabeçalho
 // Formatando o Cabeçalho
  Sheet.Range['A1','H1'].font.name := 'Verdana'; // Fonte
  Sheet.Range['A1','H1'].font.size := 12; // Tamanho da Fonte
  Sheet.Range['A1','H1'].font.bold := true; // Negrito
  Sheet.Range['A1','H1'].font.italic := true; // Italico
  Sheet.Range['A1','H1'].font.color := clYellow; // Cor da Fonte
  Sheet.Range['A1','H1'].Interior.Color := $00ffcf9c; // Cor da Célula
  // Define o tamanho das Colunas (basta fazer em uma delas e as demais serão alteradas)
  Sheet.Range['B1','C1' ].ColumnWidth := 27;
  Sheet.Range['B1','C1' ].RowHeight := 25;
  Sheet.Range['D1'] .ColumnWidth := 16;
  
  
  // Alinhando as Células
  Sheet.Range['A2','H100' ].HorizontalAlignment := 3; // 3=Center - 4=Right

  IBQContasPag.First;
  l := 2;  
  While not IBQContasPag.Eof do
  begin
    for i := 0 to IBQContasPag.Fields.Count - 1 do
    begin
      If IBQContasPag.Fields[i].DisplayText<>'R$ 0,00' Then
        ExcApp.WorkBooks[1].Sheets[1].Cells[l,i + 1] :=
         IBQContasPag.Fields[i].DisplayText;
      if (IBQContasPag.Fields[i].Name='IBQContasPagTBCONT_VALORNOTA') or  (IBQContasPag.Fields[i].Name='IBQContasPagTBCONT_VALOR')
         or (IBQContasPag.Fields[i].Name='IBQContasPagTBCONT_VALOR')  then
         Sheet.Cells[l,i + 1].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
    end;
    IBQContasPag.Next;
    l := l + 1;
  end;
  Sheet.Cells[l+1,7] := 'Total R$';
  // Na linha abaixo inclui uma soma e converti para Moeda atravez do NUMBERFORMAT
//  Sheet.Cells[i,4].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
  Sheet.Cells[l+1,8].formula := '=SUM(G2:'+'G'+IntToStr(l)+')';

  ExcApp.WorkBooks[1].SaveAs('C:\AppElanor\Excel\Contas'+FormatDateTime('dd-mm-yyyy',Now())+'.xlsx');
  IBTMain.Rollback;

end;

procedure TFrmPrincipal.CriarContasPagTemp;
 Var MesAnterior:string;
      Meses:TStringList;
      Total:Currency;
      I:Integer;
      Registro:Integer;
begin
  TotalGeral:=0;
  if not FrmPrincipal.IBTMain.Active Then
    FrmPrincipal.IBTMain.StartTransaction;

     MesAnterior:='';
  IBQUtil.Close;
  IBQUtil.SQL.Clear;
  IBQUtil.SQL.Add('SELECT  TBCONT_NUMNOTA, '+
                         ' TBCONT_EMISSAO, '+
                         ' TBCONT_VALORNOTA, '+
                         ' TBCONT_VENCIMENTO, '+
                         ' TBCONT_VALOR, '+
                         ' TBFOR_NOME '+
                   ' FROM TB_CONTASPAGAR '+
                   ' INNER JOIN TB_FORNECEDORES '+
                  '     ON TB_CONTASPAGAR.ID_FORNECEDOR=TB_FORNECEDORES.ID_FORNECEDOR '+
                   ' WHERE (TBCONT_STATUS IS NULL OR TBCONT_STATUS<>''PG'')'+
                   ' ORDER BY TBCONT_VENCIMENTO');
  IBQUtil.OPen;
  If not IBQUtil.IsEmpty then
  begin
    Meses:=TStringList.Create;

    IBQUtil.First;
    While not IBQUtil.Eof do
    begin
      IBSQLContasPagTemp.Close;
      if MesAnterior <>retornaMespExtenso(Copy(IBQUtil.FieldByName('TBCONT_VENCIMENTO').AsString, 4,2 )) then
      Begin
        IBSQLContasPagTemp.ParamByName('pMES').AsString         := retornaMespExtenso(Copy(IBQUtil.FieldByName('TBCONT_VENCIMENTO').AsString, 4,2 ));
        MesAnterior                                             := retornaMespExtenso(Copy(IBQUtil.FieldByName('TBCONT_VENCIMENTO').AsString, 4,2 ));
        Meses.Add(MesAnterior);
      End
      else
      Begin
        IBSQLContasPagTemp.ParamByName('pMES').AsString:='';
      end;
      IBSQLContasPagTemp.ParamByName('pREGMES').AsString       := retornaMespExtenso(Copy(IBQUtil.FieldByName('TBCONT_VENCIMENTO').AsString, 4,2 ));
      IBSQLContasPagTemp.ParamByName('pNUMNOTA').AsString      := IBQUtil.FieldByName('TBCONT_NUMNOTA').AsString;
      IBSQLContasPagTemp.ParamByName('pEMISSAO').AsString      := IBQUtil.FieldByName('TBCONT_EMISSAO').AsString;
      IBSQLContasPagTemp.ParamByName('pFORNECEDOR').AsString   := IBQUtil.FieldByName('TBFOR_NOME').AsString;
      IBSQLContasPagTemp.ParamByName('pVALORNOTA').AsCurrency  := IBQUtil.FieldByName('TBCONT_VALORNOTA').AsCurrency ;
      IBSQLContasPagTemp.ParamByName('pVENCIMENTO').AsString   := IBQUtil.FieldByName('TBCONT_VENCIMENTO').AsString;
      IBSQLContasPagTemp.ParamByName('pVALOR').AsCurrency      := IBQUtil.FieldByName('TBCONT_VALOR').AsCurrency ;
      IBSQLContasPagTemp.ExecQuery;
      IBQUtil.Next;
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
    IBSQLUTIL.Close;
    IBSQLUTIL.SQL.Clear;
    IBSQLUTIL.SQL.Add('UPDATE TB_CONTASPAGARTEMP '+
                         'SET '+
                           '  TBCONT_TOTAL= :pTOTAL '+
                     '  WHERE '+
                            ' ID_CONTASPAGARTEMP = :pIDCONTA ');
    IBSQLUTIL.ParamByName('pTOTAL').AsCurrency := Total ;
    TotalGeral := TotalGeral + Total;
    IBSQLUTIL.ParamByName('pIDCONTA').AsCurrency := Registro ;
    IBSQLUTIL.ExecQuery;
  End;

end;

procedure TFrmPrincipal.Exportarparaexcel1Click(Sender: TObject);
begin
  CriarContasPagTemp;
  IBQContasPag.Open;
  ExportarPExcel;
end;

end.
