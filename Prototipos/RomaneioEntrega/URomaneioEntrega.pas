unit URomaneioEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, pngextra, ComCtrls, IBCustomDataSet, IBQuery, DBClient,
  Grids, DBGrids, ExtCtrls, IBDatabase, StdCtrls, DBCtrls, ImgList,
  QRCtrls, jpeg, QuickRpt, pngimage;

type
  TFrmRomaneioEntrega = class(TForm)
    Panel1: TPanel;
    CDSPedidos: TClientDataSet;
    DSPedidos: TDataSource;
    DSRomaneio: TDataSource;
    IBQPedidos: TIBQuery;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    PNGBCarregar: TPNGButton;
    PNGBProximo: TPNGButton;
    PNGBImprimir: TPNGButton;
    PNGBVoltar: TPNGButton;
    CDSPedidosPedido: TStringField;
    CDSPedidosData: TDateField;
    CDSPedidosCliente: TStringField;
    CDSPedidosValor: TCurrencyField;
    CDSPedidosSelecao: TBooleanField;
    PNGBOrdenar: TPNGButton;
    ImageList1: TImageList;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBCheckBox1: TDBCheckBox;
    Panel3: TPanel;
    Image1: TImage;
    DBGrid2: TDBGrid;
    CDSRomaneio: TClientDataSet;
    CDSRomaneioOrdem: TIntegerField;
    CDSRomaneioPedido: TStringField;
    CDSRomaneioData: TDateField;
    CDSRomaneioCliente: TStringField;
    CDSRomaneioQuant: TIntegerField;
    CDSRomaneioValor: TCurrencyField;
    CDSRomaneioImagem: TGraphicField;
    CDSRomaneioNum: TStringField;
    IBQRomaneio: TIBQuery;
    CDSPedidosIDpedido: TIntegerField;
    CDSRomaneioIdPedido: TIntegerField;
    procedure PNGBVoltarClick(Sender: TObject);
    procedure PNGBCarregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PNGBProximoClick(Sender: TObject);
    procedure PNGBOrdenarClick(Sender: TObject);
    procedure PNGBImprimirClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DTPickerFinExit(Sender: TObject);
    procedure salvarRomaneioBanco;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRomaneioEntrega: TFrmRomaneioEntrega;

implementation

uses Math, UPrincipal, uMensagens, UPrintRomaneio;

{$R *.dfm}

procedure TFrmRomaneioEntrega.PNGBVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRomaneioEntrega.PNGBCarregarClick(Sender: TObject);
begin
  DBCheckBox1.DataSource := DSPedidos;
  DBCheckBox1.DataField :='Selecao';
  if DTPickerIni.Date > DTPickerFin.Date then
  begin
    tFrmMensagens.Mensagem('A data final não pode ser menor de que a inicial','E',[mbOK]);
    DTPickerIni.SetFocus;
    Exit;
  end
  Else
  Begin
    IBQPedidos.Close;
    IBQPedidos.SQL.Clear;
    IBQPedidos.Sql.Add(' SELECT   PED.ID_PEDIDO, '+
                                ' PED.TBPED_DATA,           '+
                                ' PED.TBPED_NOME,'+
                                ' PED.TBPED_VALTOTAL,       '+
                                ' PED.TBPED_NUMPED         '+
                      ' FROM TB_PEDIDOS PED                '+
                      ' WHERE PED.TBPED_DATA BETWEEN       '+
                                ' :pDataIni AND :pDataFin '+
                     ' AND (PED.TBPED_CANCELADO IS NULL or PED.TBPED_CANCELADO<>''S'')'+
                     ' AND NOT EXISTS (SELECT FK_PEDIDO FROM TB_ITENS_ROMANEIO TIR WHERE FK_PEDIDO = PED.ID_PEDIDO) '+
                     '  ORDER BY PED.TBPED_NUMPED DESC       ');

    IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
    IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
    IBQPedidos.Open;
    If not IBQPedidos.IsEmpty Then
    Begin
      IBQPedidos.First;
      CDSPedidos.Close;
      CDSPedidos.CreateDataSet;
      CDSPedidos.DisableControls;
      CDSPedidos.Open;

      While not IBQPedidos.Eof Do
      begin
        CDSPedidos.Insert;
        CDSPedidosPedido.AsString   := IBQPedidos.FieldByName('TBPED_NUMPED').AsString;
        CDSPedidosData.AsDateTime   := IBQPedidos.FieldByName('TBPED_DATA').AsDateTime;
        CDSPedidosCliente.AsString  := IBQPedidos.FieldByName('TBPED_NOME').AsString;
        CDSPedidosValor.AsCurrency  := IBQPedidos.FieldByName('TBPED_VALTOTAL').AsCurrency;
        CDSPedidosIDpedido.AsInteger:= IBQPedidos.FieldByName('ID_PEDIDO').AsInteger;
        CDSPedidosSelecao.AsBoolean :=False;
        CDSPedidos.Post;
        IBQPedidos.Next;
      end;
      CDSPedidos.EnableControls;

    End;
    IBQPedidos.Close;
  end;
end;

procedure TFrmRomaneioEntrega.FormCreate(Sender: TObject);
begin
 
  DBCheckBox1.Visible := False;
  DBCheckBox1.Color := DBGrid1.Color;
  DBCheckBox1.Caption := '';
  DBCheckBox1.AllowGrayed  :=  False ;
  DBCheckBox1.State   :=  cbUnchecked;
  DTPickerFin.Date :=Now();
  DTPickerIni.Date :=Now()-5;
  PNGBCarregarClick(Self);
end;

procedure TFrmRomaneioEntrega.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
       (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
 var
   DrawState: Integer;
   DrawRect: TRect;
begin
   if (gdFocused in State) then
   begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
      DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 2;
      DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;
      Column.Title.Caption:='';
      DBCheckBox1.Visible := True;
     end
   end
   else
   begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
       DrawRect:=Rect;
       Column.Title.Caption:='';
       InflateRect(DrawRect,-1,-1);
       DrawState := ISChecked[Column.Field.AsBoolean];
       DBGrid1.Canvas.FillRect(Rect);
       DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
         DFC_BUTTON, DrawState);
     end;
   end;
end;

procedure TFrmRomaneioEntrega.PNGBProximoClick(Sender: TObject);
Var Contar:Integer;
    ImagemMemory: TMemoryStream;
begin
  If CDSPedidos.State in [dsEdit, dsInsert] Then
    CDSPedidos.Post;
  CDSPedidos.DisableControls;
  CDSPedidos.First;
  Contar :=0;
  ImagemMemory:= TMemoryStream.Create;
  Image1.Picture.Graphic.SaveToStream(ImagemMemory);
  While not CDSPedidos.Eof do
  begin
    If CDSPedidosSelecao.AsBoolean =True Then
    begin
      Contar :=Contar +1;
      If Contar = 1 then
      begin
        CDSRomaneio.Close;
        CDSRomaneio.CreateDataSet;
        CDSRomaneio.DisableControls;
        CDSRomaneio.Open;
      end;

      CDSRomaneio.Insert;
      CDSRomaneioPedido.AsString   := CDSPedidosPedido.AsString;
      CDSRomaneioData.AsDateTime   := CDSPedidosData.AsDateTime;
      CDSRomaneioCliente.AsString  := CDSPedidosCliente.AsString;
      CDSRomaneioImagem.LoadFromStream(ImagemMemory);
      CDSRomaneioValor.AsCurrency  :=CDSPedidosValor.AsCurrency;
      CDSRomaneioIdPedido.AsInteger:=CDSPedidosIDpedido.AsInteger;
      CDSRomaneio.Post

    end;
    CDSPedidos.Next;
  End;

  CDSPedidos.First;
  CDSPedidos.EnableControls;
  CDSRomaneio.EnableControls;
  Panel2.Visible :=False;
  Panel3.Visible :=True;
  PNGBCarregar.Enabled :=False;
  PNGBProximo.Enabled  :=False;
  PNGBOrdenar.Enabled  :=True;
end;

procedure TFrmRomaneioEntrega.PNGBOrdenarClick(Sender: TObject);
var Repetido: string;
begin

 if DSRomaneio.State in [dsEdit, dsInsert] then
   CDSRomaneio.Post;
 CDSRomaneio.DisableControls;
 CDSRomaneio.First;
 While not CDSRomaneio.Eof do
 begin
    if CDSRomaneioOrdem.AsString='' then
    begin
        if (tFrmMensagens.Mensagem('Favor colocar um número diferente para cada cliente','I',[mbOK])) then
        Exit;
    end;
    CDSRomaneio.Next;
 end;
 CDSRomaneio.IndexFieldNames:='Ordem';
 CDSRomaneio.EnableControls;
 PNGBOrdenar.Enabled :=False;
 PNGBImprimir.Enabled:=True;
 
end;

procedure TFrmRomaneioEntrega.PNGBImprimirClick(Sender: TObject);
Var Branco:Boolean;
    Caixas:Integer;
    Indice:Integer;
    Numero: Integer;
    StringNumeros:string;
begin
  if DSRomaneio.State in [dsEdit, dsInsert] then
   CDSRomaneio.Post;
  // Verificar se colocou quantidade de caixas.
  CDSRomaneio.DisableControls;
  CDSRomaneio.First;
  Branco:=False;
  while Not CDSRomaneio.Eof do
  begin
    If  CDSRomaneio.FieldByName('Quant').AsInteger=0  Then
      Branco :=True;
    CDSRomaneio.Next;
  End;
  if Branco=True then
  Begin
    tFrmMensagens.Mensagem('Favor informar a quantidade de caixa','I',[mbOK]);
    CDSRomaneio.EnableControls;
    CDSRomaneio.Edit;
    Exit;
  End
  else
  begin
     Numero:=0;
     Caixas:=0;
     CDSRomaneio.First;
     while Not CDSRomaneio.EOf do
     begin
       Caixas := CDSRomaneio.FieldByName('Quant').AsInteger;
       Numero:= Numero + 1;
       for Indice :=0 To Caixas -1 do
       Begin
         StringNumeros:= StringNumeros+IntToStr(Numero) + ' ';
       end;
       CDSRomaneio.Edit;
       CDSRomaneioNum.AsString :=StringNumeros;
       StringNumeros:='';
       CDSRomaneio.Post;
       CDSRomaneio.Next;
     End;
  end;
  Application.CreateForm(TFrmPrintRomaneio,FrmPrintRomaneio);
  FrmPrintRomaneio.QuickRep1.Preview;
  FrmPrintRomaneio.Free;
  salvarRomaneioBanco;
  Close;
end;

procedure TFrmRomaneioEntrega.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if Column.Field = CDSRomaneioImagem Then
   begin
     TDBGrid(Sender).Canvas.FillRect(Rect);
     ImageList1.Draw(TDBGrid(Sender).Canvas, Rect.Left +1,Rect.Top + 1, 0);
     
   end;
end;

procedure TFrmRomaneioEntrega.DTPickerFinExit(Sender: TObject);
begin
  if DTPickerFin.Date < DTPickerIni.Date then
  begin
    tFrmMensagens.Mensagem('A data final não pode ser menor de que a inicial','E',[mbOK]);
    DTPickerIni.SetFocus;
  end;
end;

procedure TFrmRomaneioEntrega.salvarRomaneioBanco;
var fk_romaneio:string;
begin
  try

    IBQRomaneio.SQL.Clear;
    IBQRomaneio.SQL.Add('INSERT INTO TB_ROMANEIO (DATA) '+
                        'VALUES (:pData) ');
    IBQRomaneio.ParamByName('pData').AsString:=FormatDateTime('DD/MM/YYYY',Now());
    IBQRomaneio.ExecSQL;
    IBQRomaneio.SQL.Clear;
    IBQRomaneio.SQL.Add('SELECT MAX(ID_ROMANEIO) AS FK FROM TB_ROMANEIO');
    IBQRomaneio.Open;
    fk_romaneio:=IBQRomaneio.FieldByname('FK').AsString;
    CDSRomaneio.DisableControls;
    CDSRomaneio.First;
    while Not CDSRomaneio.EOf do
    begin
      IBQRomaneio.SQL.Clear;
      IBQRomaneio.SQL.Add('INSERT INTO  TB_ITENS_ROMANEIO (FK_ROMANEIO, '+
                                                          'QUANTIDADE, '+
                                                          'CLIENTE, '+
                                                          'ORDEM,  '+
                                                          'FK_PEDIDO, '+
                                                          'CAIXAS) '+

                           'VALUES (:pFK, :pQuantidade, :pFk_cliente,:pOrdem, :pPedido, :pCaixas)');

      IBQRomaneio.ParamByName('pFK').AsString:=fk_romaneio;
      IBQRomaneio.ParamByName('pQuantidade').AsString:=CDSRomaneio.FieldByName('Quant').AsString;
      IBQRomaneio.ParamByName('pFk_cliente').AsString:=CDSRomaneioCliente.AsString;
      IBQRomaneio.ParamByName('pOrdem').AsString:=CDSRomaneioOrdem.AsString;
      IBQRomaneio.ParamByName('pPedido').AsString:=CDSRomaneioIdPedido.AsString;
      IBQRomaneio.ParamByName('pCaixas').AsString:=CDSRomaneioNum.AsString;
      IBQRomaneio.ExecSQL;


      CDSRomaneio.Next;
    End;
    FrmPrincipal.IBTMain.Commit;
    FrmPrincipal.IBDMain.CloseDataSets;
  except
   on  E: EDatabaseError do
   begin
     tFrmMensagens.Mensagem('Erro ao gerar romaneio no banco ','E',[mbOK]);
     FrmPrincipal.IBTMain.Rollback;
   end;
  end;
end;

end.
