unit UConsultarContaREC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, IBUpdateSQL, IBSQL;

type
  TFrmConsultarContaRec = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    PNGButton2: TPNGButton;
    PNGButton1: TPNGButton;
    Label2: TLabel;
    IBQContaRec: TIBQuery;
    DsContaRec: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    IBQContaRecTOTAL: TIBBCDField;
    IBQContaRecVALOR: TIBBCDField;
    IBQContaRecVENCIMENTO: TDateField;
    IBQContaRecSTATUS: TIBStringField;
    IBQContaRecEMISSAO: TDateField;
    IBQContaRecCLIENTE: TIBStringField;
    IBQContaRecPEDIDO: TIBStringField;
    PNGButton3: TPNGButton;
    IBSQLContaRec: TIBSQL;
    IBUpdateSQL1: TIBUpdateSQL;
    IBQContaRecIDPEDIDO: TIntegerField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarContaRec: TFrmConsultarContaRec;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmConsultarContaRec.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarContaRec.PNGButton1Click(Sender: TObject);
begin
  IBQContaRec.Close;
  IBQContaRec.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQContaRec.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQContaRec.Open;
  if Not IBQContaRec.IsEmpty then
     PNGButton3.Enabled :=True
  Else
     PNGButton3.Enabled :=False;
 
end;

procedure TFrmConsultarContaRec.FormShow(Sender: TObject);
begin
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
end;

procedure TFrmConsultarContaRec.PNGButton3Click(Sender: TObject);
begin
   If tFrmMensagens.Mensagem('Deseja confirmar o pagamento do pedido:  '+IBQContaRecPEDIDO.AsString +'  ?' ,'Q',[mbSim, mbNao]) then
   begin
      if not FrmPrincipal.IBTMain.Active Then
         FrmPrincipal.IBTMain.StartTransaction;
      IBSQLContaRec.Close ;
      IBSQLContaRec.ParamByName('pVENCIMENTO').AsDate  :=IBQContaRecVENCIMENTO.AsDateTime  ;
      IBSQLContaRec.ParamByName('pIDPEDIDO').AsInteger     :=IBQContaRecIDPEDIDO.ASInteger ;
      IBSQLContaRec.ParamByName('pSTATUS').AsString    :='PG';
      IBSQLContaRec.ParamByName('pDataPag').AsString      :=FormatDateTime('dd/mm/yyyy', Now());

      try
        IBSQLContaRec.ExecQuery;
        FrmPrincipal.IBTMain.Commit;
        FrmPrincipal.AtualizarTvContaRec;  
      eXCEPT
         frmMensagens.Mensagem('Erro ao baixar pedido:'+IBQContaRecPEDIDO.AsString +'?' ,'E',[mbOK]);
      end;

   end;

end;

end.
