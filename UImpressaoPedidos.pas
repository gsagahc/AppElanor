unit UImpressaoPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  DBClient;

type
  TFrmImprePedidos = class(TForm)
    IBQImpressaoPed: TIBQuery;
    DSImpressaoPed: TDataSource;
    IBQImpressaoPedID_PEDIDO: TIntegerField;
    IBQImpressaoPedTBPED_DATA: TDateField;
    IBQImpressaoPedID_CLIENTE: TIntegerField;
    IBQImpressaoPedTBPED_NOME: TIBStringField;
    IBQImpressaoPedTBPED_ENDERECO: TIBStringField;
    IBQImpressaoPedTBPED_CIDADE: TIBStringField;
    IBQImpressaoPedTBPED_TELEFONE: TIBStringField;
    IBQImpressaoPedID_PRAZO: TIntegerField;
    IBQImpressaoPedTBPED_VALTOTAL: TIBBCDField;
    IBQImpressaoPedTBPED_VENC01: TDateField;
    IBQImpressaoPedTBPED_VENC02: TDateField;
    IBQImpressaoPedTBPED_VENC03: TDateField;
    IBQImpressaoPedID_USUARIO: TIntegerField;
    IBQImpressaoPedTBPED_BAIRRO: TIBStringField;
    IBQImpressaoPedTBPED_CNPJ: TIBStringField;
    IBQImpressaoPedTBITPED_UNIDADE: TIBStringField;
    IBQImpressaoPedTBPRD_NOME: TIBStringField;
    IBQImpressaoPedID_PRODUTO: TIntegerField;
    IBQImpressaoPedID_PRODUTO1: TIntegerField;
    IBQImpressaoPedTBPRZ_NOME: TIBStringField;
    IBQImpressaoPedTBPED_NUMPED: TIBStringField;
    IBQImpressaoPedTBPED_ESTADO: TIBStringField;
    IBQImpressaoPedTBITPED_VALUNI: TIBBCDField;
    IBQImpressaoPedTBITPED_VALTOT: TIBBCDField;
    IBQImpressaoPedTBPED_CEP: TIBStringField;
    IBQImpressaoPedTBITPED_TAMANHO: TIBBCDField;
    IBQImpressaoPedTBPED_CANCELADO: TIBStringField;
    IBQImpressaoPedTBITPED_QUANT: TIBBCDField;
    CDsPedido: TClientDataSet;
    CDsPedidoTBPED_DATA: TDateField;
    CDsPedidoTBPED_NOME: TStringField;
    CDsPedidoTBPED_ENDERECO: TStringField;
    CDsPedidoTBPED_CIDADE: TStringField;
    CDsPedidoTBPED_ESTADO: TStringField;
    CDsPedidoTBPED_TELEFONE: TStringField;
    CDsPedidoTBPRZ_NOME: TStringField;
    CDsPedidoTBPED_VALTOTAL: TCurrencyField;
    CDsPedidoTBPED_VENC01: TDateField;
    CDsPedidoTBPED_VENC02: TDateField;
    CDsPedidoTBPED_VENC03: TDateField;
    CDsPedidoTBPED_BAIRRO: TStringField;
    CDsPedidoTBPED_CNPJ: TStringField;
    CDsPedidoTBPED_NUMPED: TStringField;
    CDsPedidoTBPED_CEP: TStringField;
    CDsPedidoTBPED_CANCELADO: TStringField;
    CDsPedidoTBITPED_QUANT1: TBCDField;
    CDsPedidoTBITPED_VALUNI1: TCurrencyField;
    CDsPedidoTBITPED_VALTOT1: TCurrencyField;
    CDsPedidoTBITPED_UNIDADE1: TStringField;
    CDsPedidoTBITPED_TAMANHO1: TBCDField;
    CDsPedidoTBPRD_NOME1: TStringField;
    CDsPedidoTBITPED_QUANT2: TBCDField;
    CDsPedidoTBITPED_VALUNI2: TCurrencyField;
    CDsPedidoTBITPED_VALTOT2: TCurrencyField;
    CDsPedidoTBITPED_UNIDADE2: TStringField;
    CDsPedidoTBITPED_TAMANHO2: TStringField;
    CDsPedidoTBPRD_NOME2: TStringField;
    CDsPedidoTBITPED_QUANT3: TBCDField;
    CDsPedidoTBITPED_VALUNI3: TCurrencyField;
    CDsPedidoTBITPED_VALTOT3: TCurrencyField;
    CDsPedidoTBITPED_UNIDADE3: TStringField;
    CDsPedidoTBITPED_TAMANHO3: TStringField;
    CDsPedidoTBPRD_NOME3: TStringField;
    CDsPedidoTBITPED_QUANT0: TBCDField;
    CDsPedidoTBITPED_VALUNI0: TCurrencyField;
    CDsPedidoTBITPED_VALTOT0: TCurrencyField;
    CDsPedidoTBITPED_UNIDADE0: TStringField;
    CDsPedidoTBITPED_TAMANHO0: TStringField;
    CDsPedidoTBPRD_NOME0: TStringField;
    CDsPedidoTBITPED_QUANT4: TBCDField;
    CDsPedidoTBITPED_VALUNI4: TCurrencyField;
    CDsPedidoTBITPED_VALTOT4: TCurrencyField;
    CDsPedidoTBITPED_UNIDADE4: TStringField;
    CDsPedidoTBITPED_TAMANHO4: TStringField;
    CDsPedidoTBPRD_NOME4: TStringField;
    CDsPedidoTBITPED_QUANT5: TBCDField;
    CDsPedidoTBITPED_VALUNI5: TCurrencyField;
    CDsPedidoTBITPED_VALTOT5: TCurrencyField;
    CDsPedidoTBITPED_UNIDADE5: TStringField;
    CDsPedidoTBITPED_TAMANHO5: TStringField;
    CDsPedidoTBPRD_NOME5: TStringField;
    QuickRepEmpresa: TQuickRep;
    QRBand1: TQRBand;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRImage2: TQRImage;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText22: TQRDBText;
    QRShape15: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText23: TQRDBText;
    QRShape16: TQRShape;
    QRLabel34: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText29: TQRDBText;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel40: TQRLabel;
    QRDBText30: TQRDBText;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel41: TQRLabel;
    QRDBText31: TQRDBText;
    QRShape23: TQRShape;
    QRLabel42: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRLabel51: TQRLabel;
    QRLabelCancelado: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel55: TQRLabel;
    QRShape24: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    CDsPedidoTEXTOVIA: TStringField;
    QRDBText2: TQRDBText;
    IBQImpressaoPedTBPED_MOTIVOCANCEL: TIBStringField;
    CDsPedidoTBPED_MOTIVOCANCEL: TStringField;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    CDsPedidoTBITPED_QUANT6: TBCDField;
    CDsPedidoTBITPED_VALUNI6: TCurrencyField;
    CDsPedidoTBITPED_VALTOT6: TCurrencyField;
    CDsPedidoTBITPED_UNIDADE6: TStringField;
    CDsPedidoTBITPED_TAMANHO6: TStringField;
    CDsPedidoTBPRD_NOME6: TStringField;
    CDsPedidoOBS: TStringField;
    IBQImpressaoPedOBS: TIBStringField;
    procedure IBQImpressaoPedAfterOpen(DataSet: TDataSet);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    count:Integer;
    { Private declarations }
  public
    procedure MontarCDs;
    { Public declarations }
  end;

var
  FrmImprePedidos: TFrmImprePedidos;

implementation
Uses UPrincipal, UMensagens, Math;

{$R *.dfm}

procedure TFrmImprePedidos.IBQImpressaoPedAfterOpen(DataSet: TDataSet);
begin
   if FrmImprePedidos.IBQImpressaoPed.FieldByName('TBPED_CANCELADO').AsString= 'S' Then
    Begin
      FrmImprePedidos.QRLabelCancelado.Caption:='CANCELADO';

    End
    Else
    Begin
      FrmImprePedidos.QRLabelCancelado.Caption:='';

    End;
end;

procedure TFrmImprePedidos.MontarCDs;
Var I:Integer;
    NumeroCampo:Integer;
begin
    CDsPedido.CreateDataSet;
    CDsPedido.Open;
    count:=0;
    //Criar 2 registros no dataset
    For I:=0 to 1 do
    Begin
      NumeroCampo:=0;
      IBQImpressaoPed.First;
      CDsPedido.Append;
      //Alimentando cabeçalho
      CDsPedidoTBPED_DATA.AsDateTime       :=  IBQImpressaoPed.FieldByName('TBPED_DATA').AsDateTime;
      CDsPedidoTBPED_NOME.AsString         :=  IBQImpressaoPed.FieldByName('TBPED_NOME').AsString;
      CDsPedidoTBPED_ENDERECO.AsString     :=  IBQImpressaoPed.FieldByName('TBPED_ENDERECO').AsString;
      CDsPedidoTBPED_CIDADE.AsString       :=  IBQImpressaoPed.FieldByName('TBPED_CIDADE').AsString;
      CDsPedidoTBPED_ESTADO.AsString       :=  IBQImpressaoPed.FieldByName('TBPED_ESTADO').AsString;
      CDsPedidoTBPED_BAIRRO.AsString       :=  IBQImpressaoPed.FieldByName('TBPED_BAIRRO').AsString;
      CDsPedidoTBPED_CNPJ.AsString         :=  IBQImpressaoPed.FieldByName('TBPED_CNPJ').AsString;
      CDsPedidoTBPED_NUMPED.AsString       :=  IBQImpressaoPed.FieldByName('TBPED_NUMPED').AsString;
      CDsPedidoTBPED_CEP.AsString          :=  IBQImpressaoPed.FieldByName('TBPED_CEP').AsString;
      CDsPedidoTBPED_VALTOTAL.AsString     :=  IBQImpressaoPed.FieldByName('TBPED_VALTOTAL').AsString;
      CDsPedidoTBPED_CANCELADO.AsString    :=  IBQImpressaoPed.FieldByName('TBPED_CANCELADO').AsString;
      CDsPedidoTBPRZ_NOME.AsString         :=  IBQImpressaoPed.FieldByName('TBPRZ_NOME').AsString;
      CDsPedidoTBPED_MOTIVOCANCEL.AsString :=  IBQImpressaoPed.FieldByName('TBPED_MOTIVOCANCEL').AsString;
      CDsPedidoOBS.AsString                :=  IBQImpressaoPed.FieldByName('OBS').AsString;
      //Vencimentos
      if Not IBQImpressaoPed.FieldByName('TBPED_VENC01').IsNull   Then
        CDsPedidoTBPED_VENC01.AsDateTime  :=  IBQImpressaoPed.FieldByName('TBPED_VENC01').AsDateTime ;
      if not IBQImpressaoPed.FieldByName('TBPED_VENC02').IsNull  Then
        CDsPedidoTBPED_VENC02.AsDateTime  :=  IBQImpressaoPed.FieldByName('TBPED_VENC02').AsDateTime ;
      if Not IBQImpressaoPed.FieldByName('TBPED_VENC03').IsNull  Then
        CDsPedidoTBPED_VENC03.AsDateTime  :=  IBQImpressaoPed.FieldByName('TBPED_VENC03').AsDateTime ;
      //Alimentando Itens Pedido
         //Produto 1       ]
      while Not IBQImpressaoPed.Eof do
      Begin
        CDsPedido.FieldByName('TBITPED_QUANT'+IntToStr(NumeroCampo)).Value     :=  IBQImpressaoPed.FieldByName('TBITPED_QUANT').Value;
        CDsPedido.FieldByName('TBITPED_VALUNI'+IntToStr(NumeroCampo)).AsCurrency  :=  IBQImpressaoPed.FieldByName('TBITPED_VALUNI').AsCurrency;
        CDsPedido.FieldByName('TBITPED_VALTOT'+IntToStr(NumeroCampo)).AsCurrency  :=  IBQImpressaoPed.FieldByName('TBITPED_VALTOT').AsCurrency;
        CDsPedido.FieldByName('TBITPED_UNIDADE'+IntToStr(NumeroCampo)).AsString   :=  IBQImpressaoPed.FieldByName('TBITPED_UNIDADE').AsString;
        CDsPedido.FieldByName('TBPRD_NOME'+IntToStr(NumeroCampo)).AsString        :=  IBQImpressaoPed.FieldByName('TBPRD_NOME').AsString;
        NumeroCampo:=NumeroCampo+1;
        IBQImpressaoPed.Next;
      end;
      if I = 0 Then
        CDsPedidoTEXTOVIA.AsString := 'Primeira via : Cliente';
      If I = 1 then
        CDsPedidoTEXTOVIA.AsString := 'Segunda via : Elanor';


      CDsPedido.Post;
    end;


     CDsPedido.First;
end;

procedure TFrmImprePedidos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRImage2.Picture.LoadFromFile('C:\AppElanor\novo-2.jpg');
  { If Count= 1 then
      QRLabel56.Caption :='Segunda via : Elanor';

   count:=count+1;}
   
end;

end.
