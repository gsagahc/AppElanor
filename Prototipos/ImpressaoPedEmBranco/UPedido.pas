unit UPedido;

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
    QRShape13: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    CDsPedidoTEXTOVIA: TStringField;
    IBQImpressaoPedTBPED_MOTIVOCANCEL: TIBStringField;
    CDsPedidoTBPED_MOTIVOCANCEL: TStringField;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape7: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape10: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape11: TQRShape;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText105: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText106: TQRDBText;
    QRDBText107: TQRDBText;
    QRDBText108: TQRDBText;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);

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
   QRImage1.Picture.LoadFromFile('C:\AppElanor\novo-2.jpg');
  { If Count= 1 then
      QRLabel56.Caption :='Segunda via : Elanor';

   count:=count+1;}
   
end;

procedure TFrmImprePedidos.FormCreate(Sender: TObject);
begin
  FrmImprePedidos.CDsPedido.CreateDataSet;
  FrmImprePedidos.CDsPedido.Append;
  FrmImprePedidos.CDsPedidoTEXTOVIA.Text := 'Primeira Via: Cliente';
  FrmImprePedidos.CDsPedido.Append;
  FrmImprePedidos.CDsPedidoTEXTOVIA.Text := 'Segunda Via: Elanor';
  FrmImprePedidos.CDsPedido.Post;
  FrmImprePedidos.QuickRepEmpresa.PreviewModal;
  Application.Terminate; 
end;

end.
