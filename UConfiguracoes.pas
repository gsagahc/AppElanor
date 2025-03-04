unit UConfiguracoes;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, DBCtrls, IBCustomDataSet, IBUpdateSQL, DB,
  IBQuery, Mask, pngextra, Grids, DBGrids, IBTable,Messages, DBClient,UParametrosConfig,Dialogs,
  NumEdit;

type
  TFrmConfiguracoes = class(TForm)
    PanelMain: TPanel;
    PanelOK: TPanel;
    PgControlConfigura: TPageControl;
    TabSheetConfiguracoes: TTabSheet;
    OKBtn: TButton;
    TabSheetEnroladores: TTabSheet;
    PanelGrid: TPanel;
    DBGridElasticos: TDBGrid;
    PnlBotoes: TPanel;
    PNGButton3: TPNGButton;
    PNGButton5: TPNGButton;
    IBTbParamIndividual: TIBTable;
    IBTbParamIndividualNOMEEL: TStringField;
    IBTbParamIndividualID_PRODUTO: TIntegerField;
    IBTbParamIndividualMINIMO: TIntegerField;
    DsParamExpecificos: TDataSource;
    IBQProdutos: TIBQuery;
    IBQProdutosID_PRODUTO: TIntegerField;
    IBQProdutosTBPRD_NOME: TIBStringField;
    PNGButton7: TPNGButton;
    IBQueryConfig: TIBQuery;
    IBUpdateConfig: TIBUpdateSQL;
    DSConfig: TDataSource;
    DBGrid1: TDBGrid;
    IBQueryConfigDESC_PARAMETRO: TIBStringField;
    IBQueryConfigVAL_PARAMETRO: TIBStringField;
    IBQueryConfigID_CONFIGURACAO: TIntegerField;
    IBQueryConfigTIPO_PARAMETRO: TIBStringField;
    PanelValores: TPanel;
    NumEditMin: TNumEdit;
    ComboBoxSimNao: TComboBox;
    LabelValores: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PNGButton5Click(Sender: TObject);
    procedure IBQueryConfigAfterScroll(DataSet: TDataSet);
    procedure ComboBoxSimNaoExit(Sender: TObject);
    procedure NumEditMinExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfiguracoes: TFrmConfiguracoes;

implementation
uses UPrincipal, uMensagens;
{$R *.dfm}

procedure TFrmConfiguracoes.OKBtnClick(Sender: TObject);
begin
  try
    IBQueryConfig.ApplyUpdates;
    FrmPrincipal.IBTMain.Commit;
    FrmPrincipal.IBDMain.CloseDataSets;


  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao salvar configurações no banco :' +'OKBtnClick '+ E.message,'E',[mbOK]);
      FrmPrincipal.IBTMain.Rollback;
    end;

  end;
  Close;
end;

procedure TFrmConfiguracoes.FormCreate(Sender: TObject);
var i:Integer;

begin
  try
    IBTbParamIndividual.Open;
    IBQProdutos.Open;
    TabSheetConfiguracoes.PageControl.ActivePageIndex:=0;
    IBQueryConfig.Open;

  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao ler configurações no banco :' +'OKBtnClick '+ E.message,'E',[mbOK]);

    end;
  end;

end;

procedure TFrmConfiguracoes.PNGButton7Click(Sender: TObject);
begin
  try
   if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbParamIndividual.Active then
      IBTbParamIndividual.Open;

    IBTbParamIndividual.Insert;


  Except;

  end;
end;

procedure TFrmConfiguracoes.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o usuário mostrado?','Q',[mbSim, mbNao])) then
    IBTbParamIndividual.Delete;
end;

procedure TFrmConfiguracoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if (ActiveControl is TDBGrid) then
      with TDBGrid(ActiveControl) do
        if selectedindex < (fieldcount -1) then
          selectedindex := selectedindex +1
        else
          selectedindex := 0;

end;

procedure TFrmConfiguracoes.PNGButton5Click(Sender: TObject);
begin
  try
    IBTbParamIndividual.Post;
  Except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao salvar configurações no banco :' +'OKBtnClick '+ E.message,'E',[mbOK]);
      FrmPrincipal.IBTMain.Rollback;
    end;
  end;
end;

procedure TFrmConfiguracoes.IBQueryConfigAfterScroll(DataSet: TDataSet);
begin
  if IBQueryConfig.FieldByName('TIPO_PARAMETRO').AsString='I'then
  begin
    ComboBoxSimNao.Visible:=False;
    NumEditMin.Visible:=True;
    NumEditMin.Text:= IBQueryConfig.FieldByName('VAL_PARAMETRO').AsString;
  end;
  if IBQueryConfig.FieldByName('TIPO_PARAMETRO').AsString='C'then
  begin
    ComboBoxSimNao.Visible:=True;
    NumEditMin.Visible:=False;
    ComboBoxSimNao.ItemIndex:=ComboBoxSimNao.Items.IndexOf(Trim(IBQueryConfig.FieldByName('VAL_PARAMETRO').AsString));
  end;
end;

procedure TFrmConfiguracoes.ComboBoxSimNaoExit(Sender: TObject);
begin
  IBQueryConfig.Edit;
  IBQueryConfigVAL_PARAMETRO.AsString:=ComboBoxSimNao.Text;
  IBQueryConfig.Post;
end;

procedure TFrmConfiguracoes.NumEditMinExit(Sender: TObject);
begin
  IBQueryConfig.Edit;
  IBQueryConfigVAL_PARAMETRO.AsString:=Trim(NumEditMin.Text);
  IBQueryConfig.Post;
end;

end.

