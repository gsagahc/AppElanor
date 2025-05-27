unit UImpressaoEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngextra, StdCtrls, Mask, DBCtrls, DB, DBClient, ExtCtrls,
  QuickRpt, pngimage,HTTPApp, WinInet, QRCtrls, 
  IBCustomDataSet, IBQuery, IBSQL, IBTable, UPrincipal ;

type
  TFrmImpEtiquetas = class(TForm)
    Panel1: TPanel;
    DSEtiquetas: TDataSource;
    CDSEtiqueta: TClientDataSet;
    CDSEtiquetaNFE: TStringField;
    CDSEtiquetaCLIENTE: TStringField;
    CDSEtiquetaENDERECO: TStringField;
    CDSEtiquetaCIDADE: TStringField;
    CDSEtiquetaPRODUTO: TStringField;
    CDSEtiquetaQUANTIDADE: TStringField;
    CDSEtiquetaPESOL: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEditQuantidade: TDBEdit;
    Label7: TLabel;
    DBEditNumLote: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    PNGButton4: TPNGButton;
    PNGButton2: TPNGButton;
    CDSEtiquetaESTADO: TStringField;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    PNGButton3: TPNGButton;
    CDSEtiquetaTAMANHO: TStringField;
    Label10: TLabel;
    DBEditTamanho: TDBEdit;
    CDSEtiquetaIMAGEM: TGraphicField;
    PNGBImprimir: TPNGButton;
    EditPedido: TEdit;
    Label11: TLabel;
    dbedtCliente: TDBEdit;
    IBQueryUtil: TIBQuery;
    ComboBoxUnidade: TComboBox;
    IBQEstoque: TIBQuery;
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
    CDSEtiquetaNUMLOTE: TStringField;
    IBSQL1: TIBSQL;
    Label12: TLabel;
    CDSEtiquetaRomaneio: TIntegerField;
    EdtRomaneio: TEdit;
    CDSEtiquetaNome_abreviado: TStringField;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGBImprimirClick(Sender: TObject);
    procedure EditPedidoExit(Sender: TObject);
    procedure DBEditQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtClienteExit(Sender: TObject);
    function GerarNumLote: String;
    function VerificaLote:Boolean;
    function LocalizarPedido:Boolean;



  private
    Count:Integer;
    DataLote:String;
    sUsaLote:String ;
    { Private declarations }
  public
    Produto:TProduto;
    { Public declarations }
  end;

var
  FrmImpEtiquetas: TFrmImpEtiquetas;

implementation
uses UQRepEtiquetas, UMensagens, UBuscarCliente,
  UBuscarProdutos, Math;
{$R *.dfm}

procedure TFrmImpEtiquetas.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmImpEtiquetas.FormShow(Sender: TObject);
begin
  CDSEtiqueta.CreateDataSet;
  CDSEtiqueta.Open;
  CDSEtiqueta.Append;
  Count:=0;
end;

procedure TFrmImpEtiquetas.PNGButton3Click(Sender: TObject);
begin
  FrmPrincipal.IdProduto  :=0;
  Application.CreateForm(TFrmBuscarPrd, FrmBuscarPrd);
  FrmBuscarPrd.Caption := 'Localizar produto';
  FrmBuscarPrd.ShowModal;
  If  FrmPrincipal.IdProduto<>0 Then
  begin
     Produto:=TProduto.Create;
     IBSQL1.Close;
     IBSQL1.SQL.Clear;
     IBSQL1.SQL.Add ('SELECT  ID_PRODUTO,'+
                            ' TBPRD_NOME,'+
                            ' TBPRD_PRECOCUSTO,'+
                            ' TBPRD_PRECOVENDA,'+
                            ' TBPRD_DESCRICAO, '+
                            ' TBPRD_UNIDADE, '+
                            ' NOME_ABREVIADO '+
                     'FROM TB_PRODUTOS '+
                     'WHERE  ID_PRODUTO='+IntToStr(FrmPrincipal.IdProduto));
     IBSQL1.ExecQuery;
     Produto.Nome:=Trim(IBSQL1.FieldByName('TBPRD_NOME').AsString);
     Produto.Unidade:=Trim(IBSQL1.FieldByName('TBPRD_UNIDADE').AsString);
     CDSEtiqueta.Edit;
     CDSEtiquetaPRODUTO.AsString       := IBSQL1.FieldByName('TBPRD_NOME').AsString;
     CDSEtiquetaNome_abreviado.AsString:= IBSQL1.FieldByName('NOME_ABREVIADO').AsString;
     Produto.Id :=IBSQL1.FieldByName('ID_PRODUTO').AsInteger;
     if Produto.Unidade ='M' then
       ComboBoxUnidade.ItemIndex := 0;
     if Produto.Unidade ='UN' then
       ComboBoxUnidade.ItemIndex := 1;
     if Produto.Unidade ='KG' then
       ComboBoxUnidade.ItemIndex := 2;
    
  End;
  If CDSEtiquetaCLIENTE.AsString = 'ESTOQUE' Then
  Begin
    CDSEtiquetaNUMLOTE.AsString   :=GerarNumLote;
  end;
    FrmBuscarPrd.Free;
end;

procedure TFrmImpEtiquetas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
    
end;

procedure TFrmImpEtiquetas.PNGButton4Click(Sender: TObject);
begin
  CDSEtiqueta.Close;
  CDSEtiqueta.CreateDataSet;
  CDSEtiqueta.Open;
  CDSEtiqueta.Append;
  EditPedido.SetFocus;
end;

procedure TFrmImpEtiquetas.PNGBImprimirClick(Sender: TObject);
var sTexto:string;
begin
  try
    If CDSEtiquetaCLIENTE.AsString = 'ESTOQUE' Then
    Begin
      //inserir lote
      IBQueryUtil.Close;
      IBQueryUtil.SQL.Clear;
      IBQueryUtil.SQL.Add('INSERT INTO TB_LOTE '+
                          '            (TBL_NUMLOTE, '+
                                      ' TBL_DATA, '+
                                      ' TBL_ID_PRODUTO) '+
                         ' VALUES  '+
                                     '(:TBL_NUMLOTE, '+
                                     ' :TBL_DATA, '+
                                     ' :TBL_ID_PRODUTO)');


      IBQueryUtil.ParamByName('TBL_NUMLOTE').AsString      := CDSEtiquetaNUMLOTE.AsString;
      IBQueryUtil.ParamByName('TBL_DATA').AsDate           := Now;
      IBQueryUtil.ParamByName('TBL_ID_PRODUTO').AsInteger  :=  FrmPrincipal.IdProduto ;
      IBQueryUtil.ExecSQL;
    end
    else
    begin
      if (not VerificaLote) or (not LocalizarPedido)  then
      begin
        Exit;
      end;
       //inserir número de pedido em TB_lote
      IBQueryUtil.Close;
      IBQueryUtil.SQL.Clear;
      IBQueryUtil.SQL.Add('INSERT INTO TB_LOTEPEDIDO '+
                           '           (TBLTPED_NUMPED,  '+
                                      ' TBLTPED_NUMLOTE) '+
                         ' VALUES                       '+
                         '             (:pNUM_PEDIDO, '+
                         '              :pNUMLOTE)');

      IBQueryUtil.ParamByName('pNUM_PEDIDO').AsString       := EditPedido.Text;
      IBQueryUtil.ParamByName('pNUMLOTE').AsString          := DBEditNumLote.Text ;
      IBQueryUtil.ExecSQL;
    end;
    If  (CDSEtiqueta.State  in [dsEdit, DsInsert]) Then
    Begin
      CDSEtiquetaIMAGEM.LoadFromFile('C:\AppElanor\Logo_Elanor.bmp');
      DBEditQuantidade.Text:=DBEditQuantidade.Text;
      CDSEtiqueta.Post;
    End;
    sTexto:= IntToStr(Produto.Id)+';'+Produto.Nome+';'+Produto.Unidade+';'+ DBEditQuantidade.Field.Value +';'+FormatDateTime('DD/MM/YYYY HH:NN', Now);
    CDSEtiqueta.DisableControls;
    CDSEtiqueta.First;
    IBQueryUtil.Close;
    IBQueryUtil.SQL.Clear;
    IBQueryUtil.SQL.Add('INSERT INTO TB_ETIQUETAS(ETIQUETA)  '+
                        ' VALUES    (:pEtiqueta) ');

    IBQueryUtil.ParamByName('pEtiqueta').AsString  := sTexto;
    IBQueryUtil.ExecSQL;
    IBQueryUtil.Close;
    IBQueryUtil.SQL.Clear;
    IBQueryUtil.SQL.Add('SELECT MAX(PK_ETIQUETA)PK FROM TB_ETIQUETAS ');
    IBQueryUtil.Open;
    Application.CreateForm(TFrmQrepEtiquetas, FrmQrepEtiquetas);
    //QRCode1.Barcode:=IBQueryUtil.FieldByName('PK').AsString+';'+sTexto;
    //QRCode1.Image:=FrmQrepEtiquetas.QRQCode;
    FrmQrepEtiquetas.QRLabelUnidade.Caption  :=ComboBoxUnidade.Text;
    FrmQrepEtiquetas.QRLabelPedido.Caption   := 'PEDIDO: ' + EditPedido.Text;
    FrmQrepEtiquetas.QRLabelMensagem.Caption := FrmQrepEtiquetas.QRLabelMensagem.Caption + 'Embalado em: '+ DataLote + ' Validade: 3 anos';
    if Trim(EdtRomaneio.Text)<> EmptyStr then
      FrmQrepEtiquetas.QLbRomaneio.Caption:='N:' + EdtRomaneio.Text
    else
      FrmQrepEtiquetas.QLbRomaneio.Caption:='';
    FrmQrepEtiquetas.QuickRep1.Print;
    //QRCode1.Image:=nil;
    FreeAndNil(FrmQrepEtiquetas);
    CDSEtiqueta.EnableControls;
  except
       on  E: EDatabaseError do
       begin
         tFrmMensagens.Mensagem('Erro na impressão de etiqueta, ' +'PNGBImprimirClick','E',[mbOK], E.Message);

       end;
  end;
end;

procedure TFrmImpEtiquetas.EditPedidoExit(Sender: TObject);
begin
  LocalizarPedido;
end;

procedure TFrmImpEtiquetas.DBEditQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Restringir Apenas números no edit
  if (not (key in ['0'..'9',#8, 'X','x','=', '.'])) then key := #0;

end;

procedure TFrmImpEtiquetas.dbedtClienteExit(Sender: TObject);
begin
  IBQueryUtil.Close;
  IBQueryUtil.SQL.Clear;
  IBQueryUtil.SQL.Add('SELECT TBCLI_NOME, '+
                            ' TBCLI_ENDERECO, '+
                            ' TBCLI_BAIRRO, '+
                            ' TBCLI_CIDADE, '+
                            ' TBCLI_ESTADO '+
                     'FROM    TB_CLIENTES '+
                    ' WHERE TBCLI_NOME LIKE ''%'+dbedtCliente.Text+'%''');

   IBQueryUtil.Open;
   If Not IBQueryUtil.IsEmpty Then
     begin
       CDSEtiquetaCLIENTE.AsString  := IBQueryUtil.FieldByname('TBCLI_NOME').AsString;
       CDSEtiquetaENDERECO.AsString :=IBQueryUtil.FieldByname('TBCLI_ENDERECO').AsString;
       CDSEtiquetaCIDADE.AsString   :=IBQueryUtil.FieldByname('TBCLI_CIDADE').AsString;
       CDSEtiquetaESTADO.AsString   :=IBQueryUtil.FieldByname('TBCLI_ESTADO').AsString;
     end
     Else
     begin
       CDSEtiquetaENDERECO.Clear; 
       CDSEtiquetaCIDADE.Clear;
       CDSEtiquetaESTADO.Clear;

     end;

end;


function TFrmImpEtiquetas.GerarNumLote: String;
Var NumLote:String;
begin
  NumLote:='';
  try
    IBQueryUtil.Close;
    IBQueryUtil.Sql.Clear;
    IBQueryUtil.Sql.Add('SELECT ID_LOTE '+
                        'FROM TB_LOTE ' );

    IBQueryUtil.Open;
    IBQueryUtil.Last;
    NumLote:= IntToStr(IBQueryUtil.FieldByName('ID_LOTE').AsInteger +1);
    NumLote:=NumLote + IntToStr(FrmPrincipal.IdProduto) + FormatDateTime('ddMMYYYYHHmm', (Now)) ;
    Result :=NumLote;
  except
   on  E: EDatabaseError do
   begin
     tFrmMensagens.Mensagem('Erro na impressão de etiquetas, ' +'GerarNumLote','E',[mbOK], E.Message);

   end;
  end;
end;



function TFrmImpEtiquetas.VerificaLote: Boolean;
begin
  if sUsaLote='S' Then
  begin
    try
      Result :=False;
      IBQueryUtil.Close;
      IBQueryUtil.SQL.Clear;
      IBQueryUtil.SQL.Add('SELECT TBL_NUMLOTE, '+
                           ' TBL_ID_PRODUTO, '+
                           ' TBL_DATA '+
                           ' FROM TB_LOTE '+
                           ' WHERE TBL_NUMLOTE=:pNumLote');
      IBQueryUtil.ParamByName('pNumLote').AsString:=DBEditNumLote.Text;
      IBQueryUtil.Open;
      If (Not IBQueryUtil.IsEmpty) And (IBQueryUtil.FieldByName('TBL_ID_PRODUTO').AsInteger=Produto.Id)   then
      begin
        DataLote:=IBQueryUtil.FieldByName('TBL_DATA').AsString;
        Result:=True
      end
      Else
      begin
        tFrmMensagens.Mensagem('Número de lote inexistente ou não corresponde ao produto selecionado.','E',[mbOK]);
        Result:=False;
      end;
    except
       on  E: EDatabaseError do
       begin
         tFrmMensagens.Mensagem('Erro na verificação de lote, ' +'VerificaLote','E',[mbOK], E.Message);

       end;
    end;
  end
  else
    Result:=True;
end;

function TFrmImpEtiquetas.LocalizarPedido: Boolean;
begin
  Result:=False;
  try
    If Trim(EditPedido.Text)<>EmptyStr then
      Begin

       //Verifica Cliente usa Lote
        IBQueryUtil.Close;
        IBQueryUtil.SQL.Clear;
        IBQueryUtil.SQL.Add('SELECT TBPED_NOME, '+
                                 ' TBPED_ENDERECO, '+
                                 ' TBPED_CIDADE, '+
                                 ' TBPED_ESTADO, '+
                                 ' TBPED_NUMPED, '+
                                 ' TBPED_VALTOTAL, '+
                                 ' TB_CLIENTES.TBCLI_SNLOTE AS USALOTE'+
                                 ' FROM TB_PEDIDOS '+
                                 ' INNER JOIN TB_CLIENTES '+
                                 ' ON TB_CLIENTES.TBCLI_NOME = TB_PEDIDOS.TBPED_NOME '+
                                 ' WHERE TBPED_NUMPED=:PNUMPED');
        IBQueryUtil.ParamByName('PNUMPED').AsString :=Trim(EditPedido.text);
        IBQueryUtil.Open;
        If Not IBQueryUtil.IsEmpty Then
        begin
          sUsaLote:=   IBQueryUtil.FieldByname('USALOTE').AsString;
        end
        Else
          sUsaLote:='N';
        //Carregando dados do pedido  
        IBQueryUtil.Close;
        IBQueryUtil.SQL.Clear;
        IBQueryUtil.SQL.Add('SELECT TBPED_NOME, '+
                                  ' TBPED_ENDERECO, '+
                                  ' TBPED_CIDADE, '+
                                  ' TBPED_ESTADO, '+
                                  ' TBPED_NUMPED, '+
                                  ' TBPED_VALTOTAL '+
                                  ' FROM TB_PEDIDOS '+
                                  ' WHERE TBPED_NUMPED=:PNUMPED');
         IBQueryUtil.ParamByName('PNUMPED').AsString :=Trim(EditPedido.text);
         IBQueryUtil.Open;
         If Not IBQueryUtil.IsEmpty Then
         begin

           If (CDSEtiqueta.State  in [dsEdit, DsInsert]) then
           Begin
             CDSEtiquetaCLIENTE.AsString  := IBQueryUtil.FieldByname('TBPED_NOME').AsString;
             CDSEtiquetaENDERECO.AsString := IBQueryUtil.FieldByname('TBPED_ENDERECO').AsString;
             CDSEtiquetaCIDADE.AsString   := IBQueryUtil.FieldByname('TBPED_CIDADE').AsString;
             CDSEtiquetaESTADO.AsString   := IBQueryUtil.FieldByname('TBPED_ESTADO').AsString;
           end;
             Result:=True;
         end
         else
         begin
           tFrmMensagens.Mensagem('Favor digitar corretamente número de pedido ou deixe em branco para estoque','E',[mbOK]);
           EditPedido.SetFocus;
           Result :=False;
         end;
      end
    else
    begin
      CDSEtiquetaCLIENTE.AsString  :='ESTOQUE';
      CDSEtiquetaENDERECO.AsString :='RUA GENERAL ABREU E LIMA, 154 C';
      CDSEtiquetaCIDADE.AsString   :='JABOATÃO DOS GUARARAPES';
      CDSEtiquetaESTADO.AsString   :='PE';
    end;
  except
   on  E: EDatabaseError do
   begin
     tFrmMensagens.Mensagem('Erro na impressão de etiquetas, ' +'LocalizarPedido','E',[mbOK], E.Message);

   end;
  end;
end;

end.
