unit UConsultarContaRecPaga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, IBUpdateSQL, IBSQL;

type
  TFrmConsultarContaRecPaga = class(TForm)
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
    IBUpdateSQL1: TIBUpdateSQL;
    IBQContaRecIDPEDIDO: TIntegerField;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarContaRecPaga: TFrmConsultarContaRecPaga;

implementation
Uses UPrincipal, UMensagens,UImpressaoPedidos, Math;
Var Pedido:TPedido;

{$R *.dfm}

procedure TFrmConsultarContaRecPaga.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarContaRecPaga.PNGButton1Click(Sender: TObject);
begin
  IBQContaRec.Close;
  IBQContaRec.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
  IBQContaRec.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
  IBQContaRec.Open;
  
 
end;

procedure TFrmConsultarContaRecPaga.FormShow(Sender: TObject);
begin
  DTPickerIni.Date:=Now -5;
  DTPickerFin.Date:=Now;
end;

end.
