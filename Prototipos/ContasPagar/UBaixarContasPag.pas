unit UBaixarContasPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBSQL, DB, IBCustomDataSet, IBQuery, pngextra, Grids,
  DBGrids, ExtCtrls, IBUpdateSQL, IBTable, ComCtrls;

type
  TFrmBaixarContasPag = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    PNGButton1: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton4: TPNGButton;
    DsContasPag: TDataSource;
    PanelViewPedido: TPanel;
    Panel3: TPanel;
    EditNota: TEdit;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    IBQContasPag: TIBQuery;
    IBSQLUTIL: TIBSQL;
    IBUpdateSQL1: TIBUpdateSQL;
    IBQContasPagID_CONTASPAGAR: TIntegerField;
    IBQContasPagTBCONT_NUMNOTA: TIBStringField;
    IBQContasPagTBCONT_EMISSAO: TDateField;
    IBQContasPagTBCONT_VALORNOTA: TIBBCDField;
    IBQContasPagTBCONT_VENCIMENTO: TDateField;
    IBQContasPagTBCONT_VALOR: TIBBCDField;
    IBQContasPagTBFOR_NOME: TIBStringField;
    IBQContasPagTBCONT_DATAPAG: TDateField;
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure MemoMotivoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaixarContasPag: TFrmBaixarContasPag;

implementation
Uses UPrincipal, UMensagens, Math;

{$R *.dfm}

procedure TFrmBaixarContasPag.PNGButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBaixarContasPag.PNGButton1Click(Sender: TObject);
begin

  IBQContasPag.Close;
  If Trim(EditNota.Text)<> EmptyStr Then
  Begin
    IBQContasPag.ParamByName('pNumNota').AsString :=EditNota.Text;
    IBQContasPag.Open;
    if not IBQContasPag.IsEmpty then
      PNGButton5.Enabled:=True
    Else
    begin
      PNGButton5.Enabled:=False;
      IBSQLUTIL.Close;
      IBSQLUTIL.SQL.Clear;
      IBSQLUTIL.SQL.Add('SELECT   ID_CONTASPAGAR, '+
                                ' TBCONT_NUMNOTA, '+
                                ' TBCONT_STATUS, '+
                                ' TBCONT_DATAPAG '+
                        '  FROM TB_CONTASPAGAR '+
                        ' WHERE TBCONT_NUMNOTA=:pNumNota '+
                        ' AND TBCONT_STATUS=:pStatus');
      IBSQLUTIL.ParamByName('pStatus').AsString:='PG';
      IBSQLUTIL.ParamByName('pNumNota').AsString:=EditNota.Text;
      IBSQLUTIL.ExecQuery;
      If not IBSQLUTIL.Eof then
        tFrmMensagens.Mensagem('Esta nota foi paga em: '+IBSQLUTIL.FieldByName('TBCONT_DATAPAG').AsString,'I',[mbOK])
      Else
        tFrmMensagens.Mensagem('Nota não localizada,  favor verificar!','I',[mbOK]);
    end;
  end;

  End;


procedure TFrmBaixarContasPag.PNGButton5Click(Sender: TObject);
begin
  if  (tFrmMensagens.Mensagem('Confirma o pagamento deste título em:  '+
                               FormatDateTime('dd/mm/yyyy',DateTimePicker1.Date)+' ?' ,'Q',[mbSim, mbNao])) Then
  Begin
     IBSQLUTIL.ParamByName('pDataPag').AsDate  :=DateTimePicker1.Date;
     IBSQLUTIL.ParamByName('pStatus').AsString :='PG';
     IBSQLUTIL.ParamByName('pIDCONTASPAGAR').AsString :=IBQContasPagID_CONTASPAGAR.AsString;
     IBSQLUTIL.ExecQuery;
     FrmPrincipal.IBTMain.Commit;
     FrmPrincipal.TViewContas.Items.Clear;
     FrmPrincipal.atualizarTreeView;
     Close;
  End;
end;



procedure TFrmBaixarContasPag.MemoMotivoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmBaixarContasPag.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date :=Now(); 
end;

end.
