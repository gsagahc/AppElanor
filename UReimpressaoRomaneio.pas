unit UReimpressaoRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URomaneioEntrega, DB, ImgList, IBCustomDataSet, IBQuery,
  DBClient, pngimage, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids,
  ComCtrls, pngextra, Menus, IBSQL;


type
  TFrmReimpressaoRomaneio = class(TFrmRomaneioEntrega)
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    CDSRomaneioIdItemRomaneio: TIntegerField;
    IBSQL1: TIBSQL;
    IBQueryUtil: TIBQuery;
    PNGButtonDeletar: TPNGButton;
    CDSRomaneioidRomaneio: TIntegerField;
    procedure PNGBCarregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGBImprimirClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure CDSRomaneioOrdemChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure PNGButtonDeletarClick(Sender: TObject);

  private


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReimpressaoRomaneio: TFrmReimpressaoRomaneio;

implementation
uses uMensagens, URelReimpressaoRomaneio, Math, UPrincipal, DateUtils;
{$R *.dfm}

procedure TFrmReimpressaoRomaneio.PNGBCarregarClick(Sender: TObject);
var   ImagemMemory: TMemoryStream;
begin
  try
    CDSRomaneio.Close;
    IBQRomaneio.Close;
    IBQRomaneio.SQL.Clear;
    IBQRomaneio.Sql.Add('SELECT  TR.*,  '+
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
      if DTPickerIni.Date > Now-6 then
      begin
        PNGButtonDeletar.Enabled:=True;
        Excluir1.Visible:=True;
      end
      else
      begin
        PNGButtonDeletar.Enabled:=False;
        Excluir1.Visible:=False;
      end;
      PNGBImprimir.Enabled:= True;
      PNGBOrdenar.Enabled:= True;
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
        CDSRomaneioQuant.AsInteger         :=IBQRomaneio.FieldByname('QUANTIDADE').AsInteger;
        CDSRomaneioOrdem.AsString          :=IBQRomaneio.FieldByname('ORDEM').AsString;
        CDSRomaneioIdItemRomaneio.AsInteger:=IBQRomaneio.FieldByname('ID_ITENS').AsInteger;
        CDSRomaneioidRomaneio.AsInteger    :=IBQRomaneio.FieldByName('ID_ROMANEIO').AsInteger;
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
  DTPickerIni.Enabled:=True;

end;

procedure TFrmReimpressaoRomaneio.PNGBImprimirClick(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    CDSRomaneio.DisableControls;
    CDSRomaneio.First;
    while Not CDSRomaneio.EOf do
    begin
      IBQRomaneio.SQL.Clear;
      IBQRomaneio.SQL.Add('UPDATE  TB_ITENS_ROMANEIO SET QUANTIDADE=:pQuantidade, '+
                                                          'ORDEM=:pOrdem,'+
                                                          'CAIXAS=:pCaixas '+
                          'WHERE ID_ITENS = :pItens ');

      IBQRomaneio.ParamByName('pQuantidade').AsString:=CDSRomaneio.FieldByName('Quant').AsString;
      IBQRomaneio.ParamByName('pOrdem').AsString:=CDSRomaneioOrdem.AsString;
      IBQRomaneio.ParamByName('pCaixas').AsString:=CDSRomaneioNum.AsString;
      IBQRomaneio.ParamByName('pItens').AsInteger:=CDSRomaneioIdItemRomaneio.AsInteger;
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
  Application.CreateForm(TFrmPrintRomaneio1,FrmPrintRomaneio1);
  FrmPrintRomaneio1.QuickRep1.Preview;
  FrmPrintRomaneio1.Free;


end;

procedure TFrmReimpressaoRomaneio.Excluir1Click(Sender: TObject);
begin
  inherited;
// Código para excluir o registro selecionado
  if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      if not FrmPrincipal.IBTMain.Active Then
        FrmPrincipal.IBTMain.StartTransaction;
      IBSQL1.Close;
      IBSQL1.SQL.Clear;
      IBSQL1.SQL.Add('DELETE FROM TB_ITENS_ROMANEIO WHERE ID_ITENS=:pITENS');
      IBSQL1.ParamByName('pITENS').AsInteger:=DBGrid2.DataSource.DataSet.FieldByname('IdItemRomaneio').AsInteger;
      IBSQL1.Prepare;
      IBSQL1.ExecQuery;
      DBGrid2.DataSource.DataSet.Delete;
      FrmPrincipal.IBTMain.Commit;
      FrmPrincipal.IBDMain.CloseDataSets;
    except

    end;
  end;

end;

procedure TFrmReimpressaoRomaneio.CDSRomaneioOrdemChange(Sender: TField);
begin

  CDSRomaneioNum.AsString:=CDSRomaneioOrdem.AsString;
end;

procedure TFrmReimpressaoRomaneio.FormCreate(Sender: TObject);
begin
  inherited;
  DBGrid2.Visible:=True;
  DTPickerIni.Enabled:=True;
end;



procedure TFrmReimpressaoRomaneio.PNGButtonDeletarClick(Sender: TObject);
var idRomaneio:Integer;
begin
  inherited;
  // Código para excluir o romaneio
  if MessageDlg('Deseja realmente excluir este romaneio e seus itens?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      if not FrmPrincipal.IBTMain.Active Then
        FrmPrincipal.IBTMain.StartTransaction;
      idRomaneio:=CDSRomaneioidRomaneio.AsInteger;
      IBSQL1.Close;
      IBSQL1.SQL.Clear;
      IBSQL1.SQL.Add('DELETE FROM TB_ITENS_ROMANEIO WHERE FK_ROMANEIO=:pidRomaneio');
      IBSQL1.ParamByName('pidRomaneio').AsInteger:=idRomaneio;
      IBSQL1.Prepare;
      IBSQL1.ExecQuery;
      IBSQL1.Close;
      IBSQL1.SQL.Clear;
      IBSQL1.SQL.Add('DELETE FROM TB_ROMANEIO WHERE ID_ROMANEIO=:pidRomaneio');
      IBSQL1.ParamByName('pidRomaneio').AsInteger:=idRomaneio;
      IBSQL1.Prepare;
      IBSQL1.ExecQuery;
      CDSRomaneio.Close;
      FrmPrincipal.IBTMain.Commit;
      FrmPrincipal.IBDMain.CloseDataSets;
      PNGButtonDeletar.Enabled:=False;
    except

    end;
  end;
end;

end.
