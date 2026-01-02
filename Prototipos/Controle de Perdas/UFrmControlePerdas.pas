unit UFrmControlePerdas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,pngextra, DB, DBClient, IBCustomDataSet, IBTable, DBGrids,
  ExtCtrls, IBUpdateSQL, IBSQL, IBQuery, DBCtrls, StdCtrls, Mask, ComCtrls, DateUtils,
  NumEdit, IBStoredProc, UParametrosConfig;

type
  TCPerdas     = class
  Data         : TDateTime;
  Maquina      : Integer;
  Elastico     : Integer;
  NomeElastico : string;
  Comprimento  : Integer;
  PesoBruto    : Double;
  QuantidadeRC : Integer;
  Quantidade   : Integer;
  Primeira     : Double;
  Segunda      : Double;
  Percentual   : Double;
end;
type
  TProduto      = class
  Nome          : string;
  id            : Integer;
end;
type
  TEnrolador      = class
  Nome          : string;
  id            : Integer;

end;
type
  TFrmControlePerdas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    IBTBControlePerdas: TIBTable;
    DSPerdas: TDataSource;
    CDSPerdas: TClientDataSet;
    CDSPerdasData: TDateField;
    CDSPerdasMaquina: TIntegerField;
    CDSPerdasElastico: TStringField;
    CDSPerdasComprimento: TIntegerField;
    CDSPerdasPesoB: TFloatField;
    CDSPerdasQuantidadeRC: TIntegerField;
    CDSPerdasQuantidade: TIntegerField;
    CDSPerdasPrimeira: TFloatField;
    CDSPerdasSegunda: TFloatField;
    CDSPerdasPercentual: TFloatField;
    PNGBNovo: TPNGButton;
    PNGImprimir: TPNGButton;
    PNGButton2: TPNGButton;
    IBTBControlePerdasTBCP_DATA: TDateField;
    IBTBControlePerdasTBCP_MAQUINA: TIntegerField;
    IBTBControlePerdasTBCP_ELASTICO: TIBStringField;
    IBTBControlePerdasTBCP_COMPRIMENTO: TIntegerField;
    IBTBControlePerdasTBCP_PESOB: TFloatField;
    IBTBControlePerdasTBCP_QUANTIDADERC: TIntegerField;
    IBTBControlePerdasTBCP_QUANTIDADE: TIntegerField;
    IBTBControlePerdasTBCP_PRIMEIRA: TFloatField;
    IBTBControlePerdasTBCP_SEGUNDA: TFloatField;
    IBTBControlePerdasTBCP_PERCENTUAL: TFloatField;
    IBTBControlePerdasID_CONTROLEPERDAS: TIntegerField;
    DSProdutos: TDataSource;
    IBQProdutos: TIBQuery;
    IBQProdutosID_PRODUTO: TIntegerField;
    IBQProdutosTBPRD_NOME: TIBStringField;
    IBQProdutosTBPRD_DESCRICAO: TIBStringField;
    IBQProdutosTBPRD_CODIGO: TIBStringField;
    IBTbEstoque: TIBTable;
    IBTbEstoqueID_MOVEESTOQUE: TIntegerField;
    IBTbEstoqueTBMOVE_DATA: TDateField;
    IBTbEstoqueID_ESTOQUE: TIntegerField;
    IBTbEstoqueID_USUARIO: TIntegerField;
    IBTbEstoqueID_PRODUTO: TIntegerField;
    IBTbEstoqueTBMOVE_FORMATO: TIBStringField;
    IBTbEstoqueTBMOVE_HORA: TTimeField;
    IBTbEstoqueTBMOVE_TAMANHO: TIBBCDField;
    IBTbEstoqueTBMOVE_QUANT: TIBBCDField;
    IBTbEstoqueTBMOVE_SALDOANT: TIBBCDField;
    IBTbEstoqueTBMOVE_SOMA: TIBBCDField;
    IBTbEstoqueTBMOVE_TIPO: TIBStringField;
    DSMovEstoque: TDataSource;
    IBQEstoque: TIBQuery;
    IBSQLEstoque: TIBSQL;
    IBUSQLEstoque: TIBUpdateSQL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    IBQElasticos: TIBQuery;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    IBQElasticosID_PRODUTO: TIntegerField;
    IBQElasticosTBPRD_NOME: TIBStringField;
    DSElasticos: TDataSource;
    DTPData: TDateTimePicker;
    PNGButton1: TPNGButton;
    CDSPerdasNomeElastico: TStringField;
    IBQUtil: TIBQuery;
    ComboBoxElastico: TComboBox;
    PNGBSalvar: TPNGButton;
    CDSPerdasCBoxIndex: TIntegerField;
    EditMaquina: TNumEdit;
    EditComprimento: TNumEdit;
    EditPesoBruto: TNumEdit;
    EditQuantidadeRC: TNumEdit;
    EditQuantidade: TNumEdit;
    EditPrimeira: TNumEdit;
    EditSegunda: TNumEdit;
    EditPercentual: TNumEdit;
    CDSPerdasEnrolador: TIntegerField;
    IBTBControlePerdasID_ENROLADOR: TIntegerField;
    ComboBoxEnroladores: TComboBox;
    CDSPerdasNomeEnrolador: TStringField;
    Label11: TLabel;
    CDSPerdasMinimoDesejado: TIntegerField;
    IBQueryEnroladoresCad: TIBQuery;
    CDSPerdasConsolidado: TClientDataSet;
    CDSPerdasConsolidadoData: TDateField;
    CDSPerdasConsolidadoMaquina: TIntegerField;
    CDSPerdasConsolidadoElastico: TStringField;
    CDSPerdasConsolidadoComprimento: TIntegerField;
    CDSPerdasConsolidadoPesoB: TFloatField;
    CDSPerdasConsolidadoQuantidadeRC: TIntegerField;
    CDSPerdasConsolidadoQuantidade: TIntegerField;
    CDSPerdasConsolidadoPrimeira: TFloatField;
    CDSPerdasConsolidadoSegunda: TFloatField;
    CDSPerdasConsolidadoPercentual: TFloatField;
    CDSPerdasConsolidadoNomeElastico: TStringField;
    DSPerdasConsolidado: TDataSource;
    CDSPerdasId: TIntegerField;
    procedure PNGBNovoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGImprimirClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtualizarEstoque;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DTPDataExit(Sender: TObject);
    function  VerificarData(dData:TDate ):Boolean;
    function CalculaAcumuladoMes(sMes, sAno:string):Real;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LimparCampos;
    procedure PNGBSalvarClick(Sender: TObject);
    procedure EditQuantidadeRCExit(Sender: TObject);
    procedure EditMaquinaExit(Sender: TObject);
    procedure ComboBoxElasticoExit(Sender: TObject);
    procedure EditComprimentoExit(Sender: TObject);
    procedure EditPesoBrutoExit(Sender: TObject);
    procedure EditSegundaExit(Sender: TObject);
    procedure ReadOnly;
    procedure DBGrid1DblClick(Sender: TObject);
    function SaldoAnterior(idProduto: Integer):Real ;
    procedure preencherComboboxEnroladores;
    procedure FormCreate(Sender: TObject);
  private
    SN_Visualizar:Boolean;

  public
    { Public declarations }
     SN_UsarCores: Boolean;
  end;

var
   FrmControlePerdas: TFrmControlePerdas;

implementation

uses Math, uMensagens,UImpressaoPerdas, UPrincipal, URelatorioEnroladores,
  UAlterarControledePerdas, UReimpressaoAlterarPerdas;

{$R *.dfm}

procedure TFrmControlePerdas.PNGBNovoClick(Sender: TObject);
begin
  if ComboBoxEnroladores.Items.Count < 1 then
  begin
    tFrmMensagens.Mensagem('Cadastro de enroladores vazia, favor cadastrar' ,'E',[mbOK]);
    Close
  End;
  LimparCampos;

  CDSPerdas.Append;
  ReadOnly;
  EditMaquina.SetFocus;
end;

procedure TFrmControlePerdas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if Column.Field = CDSPerdasPercentual  then
     if CDSPerdasPercentual.AsFloat  > 2 then
     begin
       DBGrid1.Canvas.Font.Style :=
         DBGrid1.Canvas.Font.Style + [fsBold];
       DBGrid1.Canvas.Font.Color := clRed  ;
       DBGrid1.DefaultDrawDataCell(rect,Column.Field,State);
          end
     else
     begin
       DBGrid1.Canvas.Font.Style :=
         DBGrid1.Canvas.Font.Style + [fsBold];
       DBGrid1.Canvas.Font.Color := clGreen ;
       DBGrid1.DefaultDrawDataCell(rect,Column.Field,State);
      end;
end;

procedure TFrmControlePerdas.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmControlePerdas.PNGImprimirClick(Sender: TObject);
Var Mes, Ano: Integer;
    Acumulado,TotalSegunda, SaldoSegunda :Real;
    i, iQuantidade, iTotal:Integer;
    Percentual:Real;

    fTotalSegunda:Real;
begin
  PNGBSalvarClick(self);
  if  tFrmMensagens.Mensagem('Deseja salvar estes lançamentos e adicionar ao estoque?','Q',[mbSIM, mbNAO]) then
  begin
    CDSPerdas.DisableControls;
    //Ordenando a tabela por produto
    with CDSPerdas.IndexDefs.AddIndexDef do
    begin
      Name := 'IdxElastico';
      Fields :='Elastico' ;
      Options := [ixDescending];
    end;
    CDSPerdas.First;
    TotalSegunda:=0;
    try
      IBTBControlePerdas.Open;

      While Not CDSPerdas.Eof Do
      begin

        IBTBControlePerdas.Append;
        IBTBControlePerdasTBCP_DATA.AsDateTime       :=CDSPerdasData.AsDateTime;
        IBTBControlePerdasTBCP_MAQUINA.AsInteger     :=CDSPerdasMaquina.AsInteger;
        IBTBControlePerdasTBCP_ELASTICO.AsString     :=CDSPerdasElastico.AsString;
        IBTBControlePerdasTBCP_COMPRIMENTO.AsInteger :=CDSPerdasComprimento.AsInteger;
        IBTBControlePerdasTBCP_PESOB.AsFloat         :=CDSPerdasPesoB.AsFloat;
        IBTBControlePerdasTBCP_QUANTIDADERC.AsInteger:=CDSPerdasQuantidadeRC.AsInteger;
        IBTBControlePerdasTBCP_QUANTIDADE.AsInteger  :=CDSPerdasQuantidade.AsInteger;
        IBTBControlePerdasTBCP_PRIMEIRA.AsFloat      :=CDSPerdasPrimeira.AsFloat;
        IBTBControlePerdasTBCP_SEGUNDA.AsFloat       :=CDSPerdasSegunda.AsFloat;
        IBTBControlePerdasTBCP_PERCENTUAL.AsFloat    :=CDSPerdasPercentual.AsFloat;
        IBTBControlePerdasID_ENROLADOR.AsInteger     :=CDSPerdasEnrolador.AsInteger;
        IBTBControlePerdas.Post;
        IBQueryEnroladoresCad.Close;
        IBQueryEnroladoresCad.SQL.Clear;
        if not CDSPerdasConsolidado.Locate('Maquina;Elastico',
               VarArrayOf([Trim(CDSPerdasMaquina.AsString),Trim(CDSPerdasElastico.AsString)]),[loPartialKey] ) then
        begin
          CDSPerdasConsolidado.Insert;
          CDSPerdasConsolidadoDATA.AsDateTime       :=CDSPerdasData.AsDateTime;
          CDSPerdasConsolidadoMAQUINA.AsInteger     :=CDSPerdasMaquina.AsInteger;
          CDSPerdasConsolidadoELASTICO.AsString     :=CDSPerdasElastico.AsString;
          CDSPerdasConsolidadoNomeElastico.AsString :=CDSPerdasNomeElastico.AsString;
          CDSPerdasConsolidadoCOMPRIMENTO.AsInteger :=CDSPerdasComprimento.AsInteger;
          CDSPerdasConsolidadoPESOB.AsFloat         :=CDSPerdasPesoB.AsFloat;
          CDSPerdasConsolidadoQUANTIDADERC.AsInteger:=CDSPerdasQuantidadeRC.AsInteger;
          CDSPerdasConsolidadoQUANTIDADE.AsInteger  :=CDSPerdasQuantidade.AsInteger;
          CDSPerdasConsolidadoPRIMEIRA.AsFloat      :=CDSPerdasPrimeira.AsFloat;
          CDSPerdasConsolidadoSEGUNDA.AsFloat       :=CDSPerdasSegunda.AsFloat;
          CDSPerdasConsolidadoPERCENTUAL.AsFloat    :=CDSPerdasPercentual.AsFloat;
          CDSPerdasConsolidado.Post;
        end
        else
        begin
          CDSPerdasConsolidado.Edit;
          CDSPerdasConsolidadoQUANTIDADERC.AsInteger:=CDSPerdasConsolidadoQUANTIDADERC.AsInteger+ CDSPerdasQuantidadeRC.AsInteger;
          CDSPerdasConsolidadoQUANTIDADE.AsInteger  :=CDSPerdasConsolidadoQUANTIDADE.AsInteger+ CDSPerdasQuantidade.AsInteger;
          CDSPerdasConsolidadoPRIMEIRA.AsFloat      :=CDSPerdasConsolidadoPRIMEIRA.AsFloat + CDSPerdasPrimeira.AsFloat;
          CDSPerdasConsolidadoSEGUNDA.AsFloat       :=CDSPerdasConsolidadoSEGUNDA.AsFloat+ CDSPerdasSegunda.AsFloat;
          Percentual:=(CDSPerdasConsolidadoSEGUNDA.AsFloat* 100 ) / CDSPerdasConsolidadoPRIMEIRA.AsFloat;
          CDSPerdasConsolidadoPERCENTUAL.AsFloat    :=Percentual;
          CDSPerdasConsolidado.Post;
        end;



        TotalSegunda:=TotalSegunda+CDSPerdasSegunda.AsFloat;
        AtualizarEstoque;
        Ano := YearOf(DTPData.Date);
        Mes := MonthOf(DTPData.Date);
       //  Mes:=Copy (CDSPerdasData.AsString ,4,2);
       // Ano:=Copy (CDSPerdasData.AsString ,7 ,4);


        CDSPerdas.Next;
      end;

      //Elástico de segunda
      SaldoSegunda:=0;
      IBQEstoque.Close;
      IBQEstoque.SQL.Clear;
      IBQEstoque.SQL.Add('SELECT TBES_QUANTI, '+
                                'ID_ESTOQUE '+
                         'FROM TB_ESTOQUE '+
                         'WHERE ID_PRODUTO=:pProduto ');
       IBQEstoque.ParamByName('pProduto').AsInteger:=78;
       IBQEstoque.Open;
       If not IBQEstoque.IsEmpty then
       begin
         SaldoSegunda :=IBQEstoque.FieldByname('TBES_QUANTI').AsFloat;
         IBSQLEstoque.Close;
         IBSQLEstoque.SQL.Clear;
         IBSQLEstoque.SQL.Add('UPDATE TB_ESTOQUE '+
                              'SET '+
                              'TBES_QUANTI = :TBES_QUANTI '+
                              'WHERE '+
                              'ID_PRODUTO = :pPRODUTO ');
         IBSQLEstoque.ParamByName('TBES_QUANTI').AsFloat :=SaldoSegunda + TotalSegunda;
         IBSQLEstoque.ParamByName('pPRODUTO').AsInteger:=78;
         IBSQLEstoque.ExecQuery;
       end
       Else
       begin
         IBSQLEstoque.Close;
         IBSQLEstoque.SQL.Clear;
         IBSQLEstoque.SQL.Add('INSERT INTO TB_ESTOQUE '+
                              '(ID_PRODUTO, TBES_FORMATO, TBES_QUANTI) '+
                              ' VALUES '+
                              '(:ID_PRODUTO, :TBES_FORMATO, :TBES_QUANTI)');

         IBSQLEstoque.ParamByName('ID_PRODUTO').AsInteger:=78;
         IBSQLEstoque.ParamByName('TBES_FORMATO').AsString := 'METRO';
         IBSQLEstoque.ParamByName('TBES_QUANTI').AsFloat:=TotalSegunda;
         IBSQLEstoque.ExecQuery;
       end;

       CDSPerdas.EnableControls;
       if FrmAlterarControlePerdas = nil then
       begin
         if FrmImpressaoPerdas= nil then
           Application.CreateForm(TFrmImpressaoPerdas, FrmImpressaoPerdas);

         Acumulado:=CalculaAcumuladoMes(IntToStr(Mes),IntToStr(Ano));
         FrmImpressaoPerdas.QRLAcumulado.Caption:=FormatFloat( '#,##0.00' ,Acumulado);
         if Acumulado <= 2 then
         begin
           FrmImpressaoPerdas.QRLAcumulado.Color       :=clGreen;
           FrmImpressaoPerdas.QRDBText3.Color          :=clGreen;
         end
         else
         begin
           FrmImpressaoPerdas.QRLAcumulado.Color       :=clRed;
           FrmImpressaoPerdas.QRDBText3.Color          :=clRed;
         End;
         if SN_Visualizar Then
           FrmImpressaoPerdas.PreviewModal
         else
         FrmImpressaoPerdas.Print;
         Acumulado:=CalculaAcumuladoMes(IntToStr(Mes), intToStr(Ano));
         FreeAndNil(FrmImpressaoPerdas);
       end
       else
       begin
         Application.CreateForm(TFrmImpressaoAlteraPerdas, FrmImpressaoAlteraPerdas);

         Acumulado:=CalculaAcumuladoMes(IntToStr(Mes), IntToStr(Ano));
         FrmImpressaoAlteraPerdas.QRLAcumulado.Caption:=FormatFloat( '#,##0.00' ,Acumulado);
         if Acumulado <= 2 then
         begin
           FrmImpressaoAlteraPerdas.QRLAcumulado.Color       :=clGreen;
           FrmImpressaoAlteraPerdas.QRDBText3.Color          :=clGreen;
         end
         else
         begin
           FrmImpressaoAlteraPerdas.QRLAcumulado.Color       :=clRed;
           FrmImpressaoAlteraPerdas.QRDBText3.Color          :=clRed;
         End;
         if SN_Visualizar Then
           FrmImpressaoAlteraPerdas.PreviewModal
         else
           FrmImpressaoAlteraPerdas.Print;
         Acumulado:=CalculaAcumuladoMes(IntToStr(Mes), IntToStr(Ano));
         FreeAndNil(FrmImpressaoAlteraPerdas);
       end;
       Application.CreateForm(TFormEnroladores, FormEnroladores);
       FormEnroladores.CdsEnroladores.CreateDataSet;
       FormEnroladores.IBQuery1.ParamByName('pData').AsDate:=DTPData.Date;
       FormEnroladores.IBQuery1.Open;
       FormEnroladores.IBQuery1.First;
       while not FormEnroladores.IBQuery1.Eof do
       begin
         FormEnroladores.CdsEnroladores.Append;
         FormEnroladores.CdsEnroladoresData.AsDateTime          :=FormEnroladores.IBQuery1TBCP_DATA.AsDateTime;
         FormEnroladores.CdsEnroladoresMaquina.AsInteger        :=FormEnroladores.IBQuery1TBCP_MAQUINA.AsInteger;
         FormEnroladores.CdsEnroladoresElastico.AsString        :=FormEnroladores.IBQuery1TBCP_ELASTICO.AsString;
         FormEnroladores.CdsEnroladoresComprimento.AsInteger    :=FormEnroladores.IBQuery1TBCP_COMPRIMENTO.AsInteger;
         FormEnroladores.CdsEnroladoresPesoB.AsFloat            :=FormEnroladores.IBQuery1TBCP_PESOB.AsFloat;
         FormEnroladores.CdsEnroladoresQuantidadeRC.AsInteger   :=FormEnroladores.IBQuery1TBCP_QUANTIDADERC.AsInteger;
         FormEnroladores.CdsEnroladoresQuantidade.AsInteger     :=FormEnroladores.IBQuery1TBCP_QUANTIDADE.AsInteger;
         FormEnroladores.CdsEnroladoresPrimeira.AsFloat         :=FormEnroladores.IBQuery1TBCP_PRIMEIRA.AsFloat;
         FormEnroladores.CdsEnroladoresSegunda.AsFloat          :=FormEnroladores.IBQuery1TBCP_SEGUNDA.AsFloat;
         FormEnroladores.CdsEnroladoresPercentual.AsFloat       :=FormEnroladores.IBQuery1TBCP_PERCENTUAL.AsFloat;
         FormEnroladores.CdsEnroladoresControlePerdas.AsInteger :=FormEnroladores.IBQuery1ID_CONTROLEPERDAS.AsInteger;
         FormEnroladores.CdsEnroladoresID_Enrolador.AsInteger   :=FormEnroladores.IBQuery1ID_ENROLADOR.AsInteger;
         FormEnroladores.CdsEnroladoresNome.AsString            :=FormEnroladores.IBQuery1NOME.AsString;
         FormEnroladores.CdsEnroladoresPrd_Nome.AsString        :=FormEnroladores.IBQuery1TBPRD_NOME.AsString;
         FormEnroladores.CdsEnroladoresMinimo.AsInteger         :=FormEnroladores.IBQuery1MINIMO.AsInteger;
         FormEnroladores.CdsEnroladores.Post;
         FormEnroladores.IBQuery1.Next;
       end;
       if SN_Visualizar then
       begin
         FormEnroladores.QuickRepEnroladores.PreviewModal;
       end
       Else
       begin
         FormEnroladores.QuickRepEnroladores.Print;
       end;
       FreeAndNil(FormEnroladores);
       FrmPrincipal.IBTMain.Commit;
       FrmPrincipal.IBDMain.CloseDataSets;
    Except
      on E: EDatabaseError do
      begin
        tFrmMensagens.Mensagem('Erro ao registrar dados ' +'PNGImprimirClick '+ E.message,'E',[mbOK]);
        FrmPrincipal.IBTMain.Rollback;
      end;


    end;
    Close;
  End;


end;

procedure TFrmControlePerdas.DBEdit2Exit(Sender: TObject);
begin
  CDSPerdasData.AsDateTime:=DTPData.Date;
end;

procedure TFrmControlePerdas.FormShow(Sender: TObject);
var Elastico : TProduto;
begin
  IBQElasticos.Open;
  IBQElasticos.First;
// Preencher combobox Elásticos
  while not IBQElasticos.Eof do
  begin
    Elastico        := TProduto.Create;
    Elastico.Nome   := IBQElasticos.FieldByName('TBPRD_NOME').AsString;
    Elastico.id     := IBQElasticos.FieldByName('ID_PRODUTO').AsInteger;
    ComboBoxElastico.AddItem(Elastico.Nome, Elastico);
    IBQElasticos.Next;
  end;
  DTPData.Date := Now-1;
  CDSPerdas.CreateDataSet;
  CDSPerdasConsolidado.CreateDataSet;
  if EditMaquina.CanFocus Then
    EditMaquina.SetFocus;
  preencherComboboxEnroladores;

end;

procedure TFrmControlePerdas.AtualizarEstoque;
Var
    SaldoAtual:Integer;
    IdEstoque:Integer;
    sUnidade:String;
begin
   SaldoAtual:=0;
   IdEstoque:=0;


  Try
     //Verificar qual produto e se unidade é metro ou KG
    IBQUtil.Close;
    IBQUtil.SQL.Clear;
    IBQUtil.SQL.Add('SELECT * FROM TB_PRODUTOS WHERE ID_PRODUTO=:pID_Produto');
    IBQUtil.ParamByName('pID_Produto').AsInteger:=CDSPerdasElastico.AsInteger;
    IBQUtil.Open;
    sUnidade:=Trim(IBQUtil.FieldByName('TBPRD_UNIDADE').AsString);
    //Verificar se já tem entrada estoque e guardar saldo atual
    IBQEstoque.Close;
    IBQEstoque.SQL.Clear;
    IBQEstoque.SQL.Add('SELECT TBES_QUANTI, '+
                              'ID_ESTOQUE '+
                       'FROM TB_ESTOQUE '+
                       'WHERE ID_PRODUTO=:pProduto ');


    IBQEstoque.ParamByName('pProduto').AsInteger :=CDSPerdasElastico.AsInteger;

    IBQEstoque.Open;
    if Not IBQEstoque.IsEmpty then
    begin
      SaldoAtual:=IBQEstoque.FieldbyName('TBES_QUANTI').AsInteger;
      FrmPrincipal.atualizaMovimentacao(CDSPerdasElastico.AsInteger,0,CDSPerdasQuantidade.AsInteger,0,'E','METRO');
      IdEstoque :=IBQEstoque.FieldbyName('ID_ESTOQUE').AsInteger;
      IBSQLEstoque.Close;
      IBSQLEstoque.SQL.Clear;
      IBSQLEstoque.SQL.Add('UPDATE TB_ESTOQUE '+
                           'SET '+
                           'TBES_QUANTI = :TBES_QUANTI '+
                           'WHERE '+
                           'ID_ESTOQUE = :ID_ESTOQUE ');
      if (sUnidade='M') or (sUnidade='METRO') then
        IBSQLEstoque.ParamByName('TBES_QUANTI').AsInteger:=SaldoAtual+CDSPerdasQuantidade.AsInteger;
      if sUnidade='KG' then
        IBSQLEstoque.ParamByName('TBES_QUANTI').AsFloat:=SaldoAtual+CDSPerdasPesoB.AsFloat;
      IBSQLEstoque.ParamByName('ID_ESTOQUE').AsInteger:=IdEstoque;
      IBSQLEstoque.ExecQuery;
    end
    else
    Begin
      SaldoAtual:=0;
      FrmPrincipal.atualizaMovimentacao(CDSPerdasElastico.AsInteger,0,CDSPerdasQuantidade.AsInteger,0,'E','METRO');
      IBSQLEstoque.Close;
      IBSQLEstoque.SQL.Clear;
      IBSQLEstoque.SQL.Add('INSERT INTO TB_ESTOQUE '+
                           '(ID_PRODUTO, TBES_FORMATO, TBES_QUANTI) '+
                           ' VALUES '+
                           '(:ID_PRODUTO, :TBES_FORMATO, :TBES_QUANTI)');

      IBSQLEstoque.ParamByName('ID_PRODUTO').AsInteger:=CDSPerdasElastico.AsInteger;
      IBSQLEstoque.ParamByName('TBES_FORMATO').AsString := 'METRO';
      IBSQLEstoque.ParamByName('TBES_QUANTI').AsInteger:=SaldoAtual+CDSPerdasQuantidade.AsInteger;
      IBSQLEstoque.ExecQuery;

    end;

  except
      tFrmMensagens.Mensagem('Erro ao Atualizar o estoque: ' +'AtualizarEstoque','E',[mbOK]);
      Abort;


  end;


end;

procedure TFrmControlePerdas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if (ActiveControl is TDBGrid) then
      with TDBGrid(ActiveControl) do
        if selectedindex < (fieldcount -1) then
          selectedindex := selectedindex +1
        else
          selectedindex := 0;
end;

procedure TFrmControlePerdas.DTPDataExit(Sender: TObject);
begin
  If VerificarData(DTPData.Date) then
  begin
    tFrmMensagens.Mensagem('Já existem lancamentos para esta data','E',[mbOK]);
    DTPData.SetFocus;
  end;



end;

function TFrmControlePerdas.VerificarData(dData: TDate): Boolean;
begin
  // Verificar se já foi lancado desta data
   Result :=False;
   IBQUtil.Close;
   IBQUtil.SQL.Clear;
   IBQUtil.SQL.Add(' SELECT TBCP_DATA  '+
                   ' FROM  TB_CONTROLE_PERDAS '+
                   ' WHERE TBCP_DATA=:pData');
   IBQUtil.ParamByName('pData').AsDate:= dData;
   IBQUtil.Open;
   If Not IBQUtil.IsEmpty then
     Result :=True;

end;

function TFrmControlePerdas.CalculaAcumuladoMes(sMes, sAno: string): Real;
var SomaPrimeira, SomaSegunda:Real;
    DiasMes:String;
    
begin
   SomaPrimeira:=0.0;
   SomaSegunda:=0.0;
   DiasMes:=IntToStr(DaysInMonth(EncodeDate(StrToInt(sAno), StrToInt(sMes), 15)));
   Result:=0.0;
   IBQUtil.Close;
   IBQUtil.SQL.Clear;
   IBQUtil.SQL.Add(' SELECT TBCP_PRIMEIRA, TBCP_SEGUNDA  '+
                   ' FROM  TB_CONTROLE_PERDAS '+
                   ' WHERE TBCP_DATA BETWEEN :pDataIni AND :pDataFin');
   IBQUtil.ParamByName('pDataIni').AsString:= '01/'+sMes+'/'+sAno;
   IBQUtil.ParamByName('pDataFin').AsString:=  DiasMes+'/'+sMes+'/'+sAno;;
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

procedure TFrmControlePerdas.PNGButton1Click(Sender: TObject);
begin
  if tFrmMensagens.Mensagem('Deseja excluir os dados selecionados?','Q',[mbSIM, mbNAO]) then
     CDSPerdas.Delete;
end;

procedure TFrmControlePerdas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   vk_f4:begin
           PNGBNovoClick(self);
         end;
    vk_f5:PNGBSalvarClick(Self);
    vk_f6:PNGImprimirClick(Self);
  end;
end;

procedure TFrmControlePerdas.DTPDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) or ( key = VK_TAB) then
    EditMaquina.SetFocus;

end;

procedure TFrmControlePerdas.LimparCampos;
begin
  EditMaquina.Text:= '0';
  EditComprimento.Text:= '0';
  EditPesoBruto.Text:= '0';
  EditQuantidadeRC.Text:= '0';
  EditQuantidade.Text:= '0';
  EditPrimeira.Text:= '0';
  EditSegunda.Text:= '0';
  EditPercentual.Text:= '0';
  ComboBoxElastico.ItemIndex := -1;
  ComboBoxEnroladores.ItemIndex := -1;
end;

procedure TFrmControlePerdas.PNGBSalvarClick(Sender: TObject);
begin
 
  if (ComboBoxEnroladores.ItemIndex < 0) and (CDSPerdas.State  in [dsInsert]) Then
  begin
    tFrmMensagens.Mensagem('Favor selecionar um enrolador na lista.' ,'E',[mbOK]);
  
  end
  else
  begin
    if (EditPrimeira.Text='0') or (EditQuantidade.Text='0') then
       EditQuantidadeRCExit(self);
    if (EditPercentual.Text='0')  then
       EditSegundaExit(self);

    if  not (CDSPerdas.State  in [dsInsert]) then
     CDSPerdas.Append;
    if (EditMaquina.Text<>'0') and (EditComprimento.Text<>'0') and
             (EditQuantidadeRC.Text <>'0') and (EditPesoBruto.Text <>'0') and
             (ComboBoxElastico.ItemIndex <> -1 ) then
    begin
      CDSPerdasData.AsDateTime         := DTPData.Date;
      CDSPerdasMaquina.AsInteger       := StrToInt(EditMaquina.Text);
      CDSPerdasElastico.AsInteger      := (ComboBoxElastico.Items.Objects[ComboBoxElastico.ITemIndex] As TProduto).Id;
      CDSPerdasComprimento.AsInteger   := StrToInt(EditComprimento.Text);
      CDSPerdasPesoB.AsFloat           := StrToFloat(EditPesoBruto.Text);
      CDSPerdasQuantidadeRC.AsInteger  := StrToInt( EditQuantidadeRC.Text);
      CDSPerdasQuantidade.AsInteger    := StrToInt(EditQuantidade.Text);
      CDSPerdasPrimeira.AsFloat        := StrToFloat(EditPrimeira.Text);
      CDSPerdasSegunda.AsFloat         := StrToFloat(EditSegunda.Text);
      CDSPerdasPercentual.AsFloat      := StrToFloat(EditPercentual.Text);
      CDSPerdasNomeElastico.AsString   := (ComboBoxElastico.Items.Objects[ComboBoxElastico.ITemIndex] As TProduto).Nome;
      CDSPerdasCBoxIndex.AsInteger     := ComboBoxElastico.ItemIndex;
      CDSPerdasEnrolador.AsInteger     := (ComboBoxEnroladores.Items.Objects[ComboBoxEnroladores.ITemIndex] As TEnrolador).Id;
      CDSPerdasNomeEnrolador.AsString  := (ComboBoxEnroladores.Items.Objects[ComboBoxEnroladores.ITemIndex] As TEnrolador).Nome;
      CDSPerdas.Post;
      LimparCampos;
      ReadOnly;
    end
    else
      tFrmMensagens.Mensagem('Os dados atuais não serão salvos pois existe campo com valor 0','I',[mbOK]);
  end;
end;

procedure TFrmControlePerdas.EditQuantidadeRCExit(Sender: TObject);
begin
  If EditQuantidadeRC.Text = EmptyStr then
    EditQuantidadeRC.SetFocus
  else
  Begin
    EditQuantidade.Text := IntToStr(StrToInt(EditQuantidadeRC.Text)* StrToInt(EditComprimento.Text));
    EditPrimeira.Text   := FloatToStr(StrToFloat(EditPesoBruto.Text)*StrToInt(EditQuantidadeRC.Text));
  End;
end;

procedure TFrmControlePerdas.EditMaquinaExit(Sender: TObject);
begin
  if EditMaquina.Text = '0'  then
    EditMaquina.SetFocus;
end;

procedure TFrmControlePerdas.ComboBoxElasticoExit(Sender: TObject);
begin
  If ComboBoxElastico.Text='0' then
    ComboBoxElastico.SetFocus;
end;

procedure TFrmControlePerdas.EditComprimentoExit(Sender: TObject);
begin
  If EditComprimento.Text = '0' then
     EditComprimento.SetFocus;
end;

procedure TFrmControlePerdas.EditPesoBrutoExit(Sender: TObject);
begin
  if EditPesoBruto.Text = '0' then
    EditPesoBruto.SetFocus;
end;

procedure TFrmControlePerdas.EditSegundaExit(Sender: TObject);
begin
  if EditSegunda.Text <> '0' then
    EditPercentual.Text := FormatFloat( '#,###.00' ,(StrToFloat(EditSegunda.Text)*100/StrToFloat(EditPrimeira.Text)));
end;

procedure TFrmControlePerdas.ReadOnly;
begin
  EditMaquina.ReadOnly            := not EditMaquina.ReadOnly;
  EditComprimento.ReadOnly        := not EditComprimento.ReadOnly;
  EditPesoBruto.ReadOnly          := not EditPesoBruto.ReadOnly;
  EditQuantidadeRC.ReadOnly       := not EditQuantidadeRC.ReadOnly;
  EditQuantidade.ReadOnly         := not EditQuantidade.ReadOnly;
  EditSegunda.ReadOnly            := not EditSegunda.ReadOnly ;
  ComboBoxElastico.Enabled        := not ComboBoxElastico.Enabled ;
  ComboBoxEnroladores.Enabled     := not ComboBoxEnroladores.Enabled ;
end;

procedure TFrmControlePerdas.DBGrid1DblClick(Sender: TObject);
begin
  DTPData.Date                   := CDSPerdasData.AsDateTime ;
  EditMaquina.Text               := IntToStr(CDSPerdasMaquina.AsInteger) ;
  ComboBoxElastico.Text          := CDSPerdasNomeElastico.AsString;
  EditComprimento.Text           := IntToStr(CDSPerdasComprimento.AsInteger);
  EditPesoBruto.Text             := FloatToStr(CDSPerdasPesoB.AsFloat);
  EditQuantidadeRC.Text          := IntToStr(CDSPerdasQuantidadeRC.AsInteger);
  EditQuantidade.Text            := IntToStr(CDSPerdasQuantidade.AsInteger);
  EditPrimeira.Text              := FloatToStr(CDSPerdasPrimeira.AsFloat);
  EditSegunda.Text               := FloatToStr(CDSPerdasSegunda.AsFloat);
  EditPercentual.Text            := FloatToStr(CDSPerdasPercentual.AsFloat);
  ComboBoxElastico.ItemIndex     := CDSPerdasCBoxIndex.AsInteger;
  ComboBoxEnroladores.Text       := CDSPerdasNomeEnrolador.AsString;

  ReadOnly;
  CDSPerdas.Edit;
end;

function TFrmControlePerdas.SaldoAnterior(idProduto: Integer):Real ;
begin
  IBSQLEstoque.Close;
  IBSQLEstoque.SQL.Clear;
  IBSQLEstoque.SQL.Add('SELECT TBES_QUANTI '+
                       'FROM VIEW_ESTOQUES '+
                       'WHERE ID_PRODUTO=:pProduto '+
                       'AND TBES_FORMATO=''METRO''');

  IBSQLEstoque.ParamByName('pProduto').AsInteger :=idProduto;
  IBSQLEstoque.ExecQuery;
  Result :=IBSQLEstoque.FieldByName('TBES_QUANTI').Value;
end;


procedure TFrmControlePerdas.preencherComboboxEnroladores;
var Enrolador:TEnrolador;
begin
  IBQUtil.Close;
  IBQUtil.SQL.Clear;
  IBQUtil.SQL.Add('SELECT ID_ENROLADOR,NOME FROM TB_ENROLADORES WHERE SN_ATIVO=''S''');
  try
    IBQUtil.Open;
    if not IBQUtil.IsEmpty Then
    begin
      while not IBQUtil.Eof do
      begin
        Enrolador:=TEnrolador.Create;
        Enrolador.Nome:=IBQUtil.FieldByName('NOME').AsString;
        Enrolador.id  :=IBQUtil.FieldByName('ID_ENROLADOR').AsInteger;
        ComboBoxEnroladores.AddItem(Enrolador.Nome, Enrolador);
        IBQUtil.Next;
      end;
    end;


  except
    on E: EDatabaseError do
      tFrmMensagens.Mensagem('Erro ao carregar combobox enroladores.' ,'E',[mbOK], E.Message);

  End;

end;

procedure TFrmControlePerdas.FormCreate(Sender: TObject);
var Parametro:TParametros;
begin
  SN_Visualizar:=Parametro.returnValParametro('SN_VISUALIZARRELENROL')='S';
  SN_UsarCores :=Parametro.returnValParametro('SN_UTILIZAR_CORES_RELENROL')='S';
end;

end.
