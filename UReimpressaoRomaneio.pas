unit UReimpressaoRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URomaneioEntrega, DB, ImgList, IBCustomDataSet, IBQuery,
  DBClient, pngimage, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids,
  ComCtrls, pngextra;

type
  TFrmReimpressaoRomaneio = class(TFrmRomaneioEntrega)
    procedure PNGBCarregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGBImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReimpressaoRomaneio: TFrmReimpressaoRomaneio;

implementation
uses uMensagens, URelReimpressaoRomaneio;
{$R *.dfm}

procedure TFrmReimpressaoRomaneio.PNGBCarregarClick(Sender: TObject);
var   ImagemMemory: TMemoryStream;
begin
  try
    IBQRomaneio.Close;
    IBQRomaneio.SQL.Clear;
    IBQRomaneio.Sql.Add('SELECT TR.*,  '+
                                'IT.*,  '+
                                'TP.id_pedido,  '+
                                'TP.tbped_numped,  '+
                                'TP.TBPED_VALTOTAL '+
                         'FROM   tb_romaneio TR, '+
                                'tb_itens_romaneio IT,  '+
                                'tb_pedidos tp  '+
                         'WHERE  TR.id_romaneio = IT.fk_romaneio   '+
                                'AND TP.id_pedido = IT.fk_pedido '+
                                'AND TR.data =:pData '+
                                'ORDER BY ORDEM DESC');


    IBQRomaneio.ParamByName('pData').AsDate:=DTPickerIni.Date ;
    IBQRomaneio.Open;
    if not IBQRomaneio.IsEmpty then
    begin
      PNGBImprimir.Enabled:= True;
      CDSRomaneio.Close;
      CDSRomaneio.CreateDataSet;
      CDSRomaneio.Open;
      ImagemMemory:= TMemoryStream.Create;
      Image1.Picture.Graphic.SaveToStream(ImagemMemory);
      while not IBQRomaneio.Eof do
      begin
        CDSRomaneio.Insert;
        CDSRomaneioPedido.AsString         := IBQRomaneio.FieldByname('TBPED_NUMPED').AsString;
        CDSRomaneioData.AsDateTime         := IBQRomaneio.FieldByname('DATA').AsDateTime;
        CDSRomaneioCliente.AsString        := IBQRomaneio.FieldByname('CLIENTE').AsString;
        CDSRomaneioImagem.LoadFromStream(ImagemMemory);
        CDSRomaneioValor.AsCurrency        :=IBQRomaneio.FieldByname('TBPED_VALTOTAL').AsCurrency;
        CDSRomaneioIdPedido.AsInteger      :=IBQRomaneio.FieldByname('ID_PEDIDO').AsInteger;
        CDSRomaneioNum.AsString            :=IBQRomaneio.FieldByname('CAIXAS').AsString;
        CDSRomaneioQuant.AsInteger :=IBQRomaneio.FieldByname('QUANTIDADE').AsInteger;
        CDSRomaneioOrdem.AsString          :=IBQRomaneio.FieldByname('ORDEM').AsString;

        CDSRomaneio.Post ;
        IBQRomaneio.Next;
      end;
      CDSRomaneio.EnableControls;


    end;

  except
   on  E: EDatabaseError do
   begin
     tFrmMensagens.Mensagem('Erro ao consultar romaneio no banco ','E',[mbOK]);
  
   end;
  end;


end;

procedure TFrmReimpressaoRomaneio.FormShow(Sender: TObject);
begin
  inherited;
  DBGrid2.Visible:=True;
  DTPickerIni.Enabled:= True;
end;

procedure TFrmReimpressaoRomaneio.PNGBImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TFrmPrintRomaneio1,FrmPrintRomaneio1);
  FrmPrintRomaneio1.QuickRep1.Preview;
  FrmPrintRomaneio1.Free;


end;

end.
