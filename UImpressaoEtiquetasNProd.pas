unit UImpressaoEtiquetasNProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngextra, StdCtrls, Mask, DBCtrls, DB, DBClient, ExtCtrls,
  QuickRpt, Grids, DBGrids, IBCustomDataSet, IBQuery;

type
  TFrmImpEtiquetasNProd = class(TForm)
    Panel1: TPanel;
    DSEtiquetas: TDataSource;
    CDSEtiqueta: TClientDataSet;
    CDSEtiquetaNFE: TStringField;
    CDSEtiquetaCLIENTE: TStringField;
    CDSEtiquetaENDERECO: TStringField;
    CDSEtiquetaCIDADE: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    CDSEtiquetaESTADO: TStringField;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    PNGButton3: TPNGButton;
    Panel2: TPanel;
    PNGButton5: TPNGButton;
    PNGBImprimir: TPNGButton;
    PNGButton4: TPNGButton;
    PNGButton2: TPNGButton;
    DBGrid1: TDBGrid;
    CDsProdutos: TClientDataSet;
    DsProdutos: TDataSource;
    CDsProdutosPRODUTO: TStringField;
    CDsProdutosTAMANHO: TStringField;
    CDsProdutosQUANTIDADE: TStringField;
    CDSFinal: TClientDataSet;
    CDSFinalCLIENTE: TStringField;
    CDSFinalENDERECO: TStringField;
    CDSFinalCIDADE: TStringField;
    CDSFinalPRODUTO: TStringField;
    CDSFinalQUANTIDADE: TStringField;
    CDSFinalTAMANHO: TStringField;
    DsFinal: TDataSource;
    Label5: TLabel;
    EditPedido: TEdit;
    IBQueryUtil: TIBQuery;
    IBQueryUtilTBPED_NOME: TIBStringField;
    IBQueryUtilTBPED_ENDERECO: TIBStringField;
    IBQueryUtilTBPED_CIDADE: TIBStringField;
    IBQueryUtilTBPED_ESTADO: TIBStringField;
    IBQueryUtilTBPED_NUMPED: TIBStringField;
    IBQueryUtilTBPED_VALTOTAL: TIBBCDField;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGBImprimirClick(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure EditPedidoExit(Sender: TObject);
  private
    Count:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpEtiquetasNProd: TFrmImpEtiquetasNProd;

implementation
uses UQRepEtiquetas, UPrincipal, UMensagens, UBuscarCliente,
  UBuscarProdutos, Math, UImpressaoEtiquetasNProdpas;

{$R *.dfm}

procedure TFrmImpEtiquetasNProd.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmImpEtiquetasNProd.FormShow(Sender: TObject);
var
  KeyState: TKeyboardState;
begin
// Ativando CapsLock
  GetKeyboardState(KeyState);
  if(KeyState[VK_CAPITAL] = 0) then
  begin
    Keybd_Event(VK_CAPITAL, 1, KEYEVENTF_EXTENDEDKEY or 0, 0);
    Keybd_Event(VK_CAPITAL, 1, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
  CDSEtiqueta.CreateDataSet;
  CDSEtiqueta.Open;
  CDSEtiqueta.Append;
  CDsProdutos.CreateDataSet;
  CDsProdutos.Open;  
  Count:=0;
  EditPedido.SetFocus;  
end;

procedure TFrmImpEtiquetasNProd.PNGBImprimirClick(Sender: TObject);
begin
   If  (CDSEtiqueta.State  in [dsEdit, DsInsert]) Then
  Begin
    CDSEtiquetaCIDADE.AsString :=   CDSEtiquetaCIDADE.AsString+ ' - ' + CDSEtiquetaESTADO.AsString;
    CDSEtiqueta.Post;
    CDsProdutos.Post;
  End;

  CDSEtiqueta.First;
  CDsProdutos.First; 
  Application.CreateForm(TFrmQrepEtiquetasNProd, FrmQrepEtiquetasNProd);
  CDSFinal.CreateDataSet;
  CDSFinal.Open;
  While Not CDsProdutos.Eof Do
  Begin
    CDSFinal.Append;
    CDSFinalCLIENTE.AsString   :=CDSEtiquetaCLIENTE.AsString;
    CDSFinalENDERECO.AsString  :=CDSEtiquetaENDERECO.AsString;
    CDSFinalCIDADE.AsString    :=CDSEtiquetaCIDADE.AsString;
    CDSFinalPRODUTO.AsString   :=CDsProdutosPRODUTO.AsString;
    CDSFinalQUANTIDADE.AsString:=CDsProdutosQUANTIDADE.AsString;
    CDSFinalTAMANHO.AsString   :=CDsProdutosTAMANHO.AsString ;
    if CDSFinal.State in [dsInsert, DSEdit]then
      CDSFinal.Post;
    CDsProdutos.Next;
  End;
  CDSFinal.First;
  FrmQrepEtiquetasNProd.QRQCode.Picture.LoadFromFile('C:\AppElanor\qrcodeinstagram.jpg');
  FrmQrepEtiquetasNProd.QRImageLogo.Picture.LoadFromFile('C:\AppElanor\Logo_Elanor.bmp');
  FrmQrepEtiquetasNProd.QRLabelPedido.Caption:= FrmQrepEtiquetasNProd.QRLabelPedido.Caption + EditPedido.Text;
  FrmQrepEtiquetasNProd.QuickRep1.Print;
  FreeAndNil(FrmQrepEtiquetasNProd);
  Close;
end;

procedure TFrmImpEtiquetasNProd.PNGButton3Click(Sender: TObject);
begin

  FrmPrincipal.IdProduto  :=0;
  Application.CreateForm(TFrmBuscarPrd, FrmBuscarPrd);
  FrmBuscarPrd.Caption := 'Localizar produto';
  FrmBuscarPrd.ShowModal;
  If  FrmPrincipal.IdProduto<>0 Then
  begin
    CDsProdutos.Append;
    CDsProdutosPRODUTO.AsString := FrmPrincipal.NomeProduto;
  End;
  FrmBuscarPrd.Free;
end;

procedure TFrmImpEtiquetasNProd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
    
end;

procedure TFrmImpEtiquetasNProd.PNGButton5Click(Sender: TObject);
begin
 If  (CDSEtiqueta.State  in [dsEdit, DsInsert]) Then
  Begin
    CDSEtiquetaCIDADE.AsString :=   CDSEtiquetaCIDADE.AsString+ ' - ' + CDSEtiquetaESTADO.AsString;
    CDSEtiqueta.Post;
    CDsProdutos.Post;
  End;
  CDSEtiqueta.DisableControls;
  CDSEtiqueta.First;
  CDsProdutos.First; 
  Application.CreateForm(TFrmQrepEtiquetasNProd, FrmQrepEtiquetasNProd);
  CDSFinal.CreateDataSet;
  CDSFinal.Open;
  While Not CDsProdutos.Eof Do
  Begin
    CDSFinal.Append;
    CDSFinalCLIENTE.AsString   :=CDSEtiquetaCLIENTE.AsString;
    CDSFinalENDERECO.AsString  :=CDSEtiquetaENDERECO.AsString;
    CDSFinalCIDADE.AsString    :=CDSEtiquetaCIDADE.AsString;
    CDSFinalPRODUTO.AsString   :=CDsProdutosPRODUTO.AsString;
    CDSFinalQUANTIDADE.AsString:=CDsProdutosQUANTIDADE.AsString;
    CDSFinalTAMANHO.AsString   :=CDsProdutosTAMANHO.AsString ;
    CDSFinal.Post;              
    CDsProdutos.Next;
  End;
  CDSFinal.First;
  FrmQrepEtiquetasNProd.QRQCode.Picture.LoadFromFile('C:\AppElanor\qrcodeinstagram.jpg');
  FrmQrepEtiquetasNProd.QRImageLogo.Picture.LoadFromFile('C:\AppElanor\Logo_Elanor.bmp');
  FrmQrepEtiquetasNProd.QRLabelPedido.Caption:= FrmQrepEtiquetasNProd.QRLabelPedido.Caption + EditPedido.Text;
  FrmQrepEtiquetasNProd.QuickRep1.PreviewModal;
  FreeAndNil(FrmQrepEtiquetasNProd);
  Close;
end;

procedure TFrmImpEtiquetasNProd.PNGButton4Click(Sender: TObject);
begin
  CDSEtiqueta.EmptyDataSet;
  CDSEtiqueta.Close;
  CDSEtiqueta.CreateDataSet;
  CDSEtiqueta.Open;
  CDSEtiqueta.Append;
end;

procedure TFrmImpEtiquetasNProd.EditPedidoExit(Sender: TObject);
begin
  If EditPedido.Text<> EmptyStr Then
  Begin
    If Trim(EditPedido.Text)<>EmptyStr then
      Begin
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
             CDSEtiquetaCLIENTE.AsString  := IBQueryUtil.FieldByname('TBPED_NOME').AsString;
             CDSEtiquetaENDERECO.AsString :=IBQueryUtil.FieldByname('TBPED_ENDERECO').AsString;
             CDSEtiquetaCIDADE.AsString   :=IBQueryUtil.FieldByname('TBPED_CIDADE').AsString;
             CDSEtiquetaESTADO.AsString   :=IBQueryUtil.FieldByname('TBPED_ESTADO').AsString;
           end;
      end;
  end
  Else
  begin
    tFrmMensagens.Mensagem('Favor digitar o número do pedido','E',[mbOK]);
    DBEdit1.Clear;
    DBEdit2.Clear;
    DBEdit3.Clear;
    DBEdit4.Clear;
    DBEdit9.Clear;
    EditPedido.SetFocus;  
  end;
end;

end.
