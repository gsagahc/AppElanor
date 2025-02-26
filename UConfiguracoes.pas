unit UConfiguracoes;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, DBCtrls, IBCustomDataSet, IBUpdateSQL, DB,
  IBQuery, Mask, pngextra, Grids, DBGrids, IBTable,Messages;

type
  TFrmConfiguracoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PgControlConfigura: TPageControl;
    TabSheet1: TTabSheet;
    OKBtn: TButton;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    IBQConfiguracoes: TIBQuery;
    DSConfiguracoes: TDataSource;
    IBUpdateConfiguracoes: TIBUpdateSQL;
    IBQConfiguracoesSN_GERACONTASREC: TIBStringField;
    IBQConfiguracoesSN_VISUALIZAIMPRESSAO: TIBStringField;
    TabSheetEnroladores: TTabSheet;
    PanelGrid: TPanel;
    DBGrid1: TDBGrid;
    PnlBotoes: TPanel;
    PNGButton3: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton7: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    IBTbParamIndividual: TIBTable;
    IBTbParamIndividualNOMEEL: TStringField;
    IBTbParamIndividualID_PRODUTO: TIntegerField;
    IBTbParamIndividualMINIMO: TIntegerField;
    DsParamExpecificos: TDataSource;
    IBQProdutos: TIBQuery;
    IBQProdutosID_PRODUTO: TIntegerField;
    IBQProdutosTBPRD_NOME: TIBStringField;
    DBCheckBox4: TDBCheckBox;
    IBQConfiguracoesMINIMO: TIntegerField;
    IBQConfiguracoesSNVISUALIZARRELENROL: TIBStringField;
    IBQConfiguracoesSN_USARCORESRELENROL: TIBStringField;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
    IBQConfiguracoes.ApplyUpdates;

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
begin
  IBQConfiguracoes.Open;
  IBTbParamIndividual.Open;
  
  IBQProdutos.Open;
  if IBQConfiguracoes.FieldByName('SNVISUALIZARRELENROL').AsString='S' then
    DBCheckBox1.Checked := True
  else
    DBCheckBox1.Checked:= False;
  TabSheet1.PageControl.ActivePageIndex:=0;  
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

end.

