unit UCadEnrolador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TFrmCadEnrolador = class(TForm)
    PnlBottom: TPanel;
    PnlMain: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton7: TPNGButton;
    Label1: TLabel;
    IBUSQLEnrolador: TIBUpdateSQL;
    IBQEnrolador: TIBQuery;
    IBTbEnrolador: TIBTable;
    IBSQLUser: TIBSQL;
    DSEnrolador: TDataSource;
    PNGButton1: TPNGButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    IBTbEnroladorNOME: TIBStringField;
    IBTbEnroladorCPF: TIBStringField;
    IBTbEnroladorSN_ATIVO: TIBStringField;
    DBChBoxSNAtivo: TDBCheckBox;
    IBTbEnroladorID_ENROLADOR: TIntegerField;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    idEnrolador:String;
    { Public declarations }
  end;

var
  FrmCadEnrolador: TFrmCadEnrolador;

implementation
Uses UPrincipal, UBuscarProdutos, uMensagens, UBuscarEnrolador, Math, criptografia,
  UBuscarUser;

{$R *.dfm}

procedure TFrmCadEnrolador.PNGButton7Click(Sender: TObject);
begin
  try
   if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbEnrolador.Active then
      IBTbEnrolador.Open;

    IBTbEnrolador.Insert;
    DBChBoxSNAtivo.Checked:=True;
    StatusBotoes;
     
  Except;

  end;

end;

procedure TFrmCadEnrolador.PNGButton5Click(Sender: TObject);
begin
  if (IBTbEnrolador.State in [dsEdit, dsInsert]) Then
  Begin
    if (tFrmMensagens.Mensagem('Deleja salvar este enrolador?','Q',[mbSim, mbNao])) then
    begin
      try
        IBTbEnroladorSN_ATIVO.AsString:='S';
        IBTbEnrolador.Post;
        FrmPrincipal.IBTMain.Commit;
        FrmPrincipal.IBDMain.CloseDataSets;
        StatusBotoes;
      except
        on E: EDatabaseError do
          tFrmMensagens.Mensagem('Erro ao cadastrar enrolador.' ,'E',[mbOK], E.Message);
      end;
    end;
  end;
end;

procedure TFrmCadEnrolador.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o enrolador selecionado?','Q',[mbSim, mbNao])) then
     IBTbEnrolador.Delete;
  StatusBotoes;
end;

procedure TFrmCadEnrolador.PNGButton4Click(Sender: TObject);
begin
  IBTbEnrolador.Cancel;
  FrmPrincipal.IBTMain.Rollback; 
  StatusBotoes;
end;

procedure TFrmCadEnrolador.PNGButton6Click(Sender: TObject);
begin
  idEnrolador:=EmptyStr;
  Application.CreateForm(TFrmBuscarEnrolador, FrmBuscarEnrolador);
  FrmBuscarEnrolador.ShowModal;
  If Not IBTbEnrolador.Active Then
    IBTbEnrolador.Open;
  if idEnrolador <> EmptyStr Then
    if IBTbEnrolador.Locate('ID_ENROLADOR', idEnrolador,[loPartialKey]) Then
      StatusBotoes;
  FreeAndNil(FrmBuscarEnrolador);
end;

procedure TFrmCadEnrolador.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadEnrolador.StatusBotoes;
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

procedure TFrmCadEnrolador.PNGButton1Click(Sender: TObject);
begin
   IBTbEnrolador.edit;
 //  StatusBotoes;
end;

procedure TFrmCadEnrolador.FormKeyPress(Sender: TObject; var Key: Char);
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
