unit UParamMedicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
   IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  IBDatabase, pngextra;

type
  TFrmCadParamElasticos = class(TForm)
    PnlBottom: TPanel;
    PnlMain: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton7: TPNGButton;
    IBQProdutos: TIBQuery;
    IBTbParamGeral: TIBTable;
    DSParamGeral: TDataSource;
    PanelGrid: TPanel;
    DBGrid1: TDBGrid;
    IBDatabase1: TIBDatabase;
    IBTMain: TIBTransaction;
    IBTbParamGeralRANGEMININF: TIntegerField;
    IBTbParamGeralRANGEMINSUP: TIntegerField;
    IBTbParamIndividual: TIBTable;
    DataSource1: TDataSource;
    IBTbParamIndividualRANGEMININF: TIntegerField;
    IBTbParamIndividualRANGEMINSUP: TIntegerField;
    IBQProdutosID_PRODUTO: TIntegerField;
    IBQProdutosTBPRD_NOME: TIBStringField;
    IBTbParamIndividualID_PRODUTO: TIntegerField;
    IBTbParamIndividualNOMEEL: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadParamElasticos: TFrmCadParamElasticos;

implementation
Uses uMensagens;

{$R *.dfm}

procedure TFrmCadParamElasticos.PNGButton7Click(Sender: TObject);
begin
  try
   if not IBTMain.Active Then
      IBTMain.StartTransaction;
    If  not IBTbParamIndividual.Active then
      IBTbParamIndividual.Open;

    IBTbParamIndividual.Insert;
//    StatusBotoes;

  Except;

  end;

end;

procedure TFrmCadParamElasticos.PNGButton5Click(Sender: TObject);
begin
  if (IBTbParamGeral.State in [dsEdit, dsInsert]) Then
  Begin

    //if (tFrmMensagens.Mensagem('Deseja salvar estes parâmetros?','Q',[mbSim, mbNao])) then
    //begin

      IBTbParamGeral.Post;

  end;
   if (IBTbParamIndividual.State in [dsEdit, dsInsert]) Then
  Begin

    //if (tFrmMensagens.Mensagem('Deseja salvar estes parâmetros?','Q',[mbSim, mbNao])) then
    //begin

      IBTbParamIndividual.Post;

  end;
  IBTMain.Commit;
  IBTbParamIndividual.Open;
  IBTbParamGeral.Open;


end;

procedure TFrmCadParamElasticos.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o usuário mostrado?','Q',[mbSim, mbNao])) then
     IBTbParamIndividual.Delete;

end;

procedure TFrmCadParamElasticos.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadParamElasticos.StatusBotoes;
Var Botao: TPNGButton;
    i:Integer;
begin
   For i:=0 To Self.ComponentCount -1 do
     Begin
       If (Self.Components[i] is TPNGButton) Then
         Begin
           Botao:=(Self.Components[i] as TPNGButton);
           Botao.Enabled := not Botao.Enabled;
         End;
     End;
end;

procedure TFrmCadParamElasticos.PNGButton1Click(Sender: TObject);
begin

 //  StatusBotoes;
end;

procedure TFrmCadParamElasticos.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmCadParamElasticos.FormShow(Sender: TObject);
begin
  IBTbParamIndividual.Open;
  IBTbParamGeral.Open;
  IBQProdutos.Open;
end;

end.
