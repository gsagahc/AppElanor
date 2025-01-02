unit UCadUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TFrmCadUser = class(TForm)
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
    Label2: TLabel;
    DBEdit2: TDBEdit;
    IBUSQLUser: TIBUpdateSQL;
    IBQUser: TIBQuery;
    IBTbUser: TIBTable;
    IBSQLUser: TIBSQL;
    DSUser: TDataSource;
    Label5: TLabel;
    DBEditSenha: TDBEdit;
    PNGButton1: TPNGButton;
    DBEdit1: TDBEdit;
    IBTbUserTBUSR_NOME: TIBStringField;
    IBTbUserTBUSR_SENHA: TIBStringField;
    IBTbUserTBUSR_LOGIN: TIBStringField;
    IBTbUserID_USUARIO: TIntegerField;
    DBCheckBox1: TDBCheckBox;
    IBTbUserTBUSR_ADM: TIBStringField;
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
    { Public declarations }
  end;

var
  FrmCadUser: TFrmCadUser;

implementation
Uses UPrincipal, UBuscarProdutos, uMensagens, UBuscarUser, Math, criptografia;

{$R *.dfm}

procedure TFrmCadUser.PNGButton7Click(Sender: TObject);
begin
  try
   if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbuser.Active then
      IBTbuser.Open;

    IBTbuser.Insert;
    StatusBotoes;
     
  Except;

  end;

end;

procedure TFrmCadUser.PNGButton5Click(Sender: TObject);
begin
  if (IBTbUser.State in [dsEdit, dsInsert]) Then
  Begin
    FrmPrincipal.criptografia1.Chave :=16854;
    if (tFrmMensagens.Mensagem('Deleja salvar este usuário?','Q',[mbSim, mbNao])) then
    begin
      IBTbUserTBUSR_SENHA.AsString :=FrmPrincipal.criptografia1.Criptografar (DBEditSenha.Text);
      IBTbUser.Post;
      FrmPrincipal.IBTMain.Commit;

    end;
    StatusBotoes;
    IBTbUser.Open;
  end;
end;

procedure TFrmCadUser.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o usuário mostrado?','Q',[mbSim, mbNao])) then
     IBTbUser.Delete;
  StatusBotoes;
end;

procedure TFrmCadUser.PNGButton4Click(Sender: TObject);
begin
  IBTbUser.Cancel;
  FrmPrincipal.IBTMain.Rollback; 
  StatusBotoes;
end;

procedure TFrmCadUser.PNGButton6Click(Sender: TObject);
begin
  Application.CreateForm(TFrmBuscarUser, FrmBuscarUser);
  FrmBuscarUser.ShowModal;
  If Not IBTbUser.Active Then
    IBTbUser.Open; 
  if IBTbUser.Locate('ID_USUARIO', FrmBuscarUser.IBQUser.Fieldbyname('ID_USUARIO').AsString,[loCaseInsensitive, loPartialKey]) Then
    StatusBotoes;
  FreeAndNil(FrmBuscarUser);
end;

procedure TFrmCadUser.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUser.StatusBotoes;
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

procedure TFrmCadUser.PNGButton1Click(Sender: TObject);
begin
   IBTbUser.edit;
 //  StatusBotoes;
end;

procedure TFrmCadUser.FormKeyPress(Sender: TObject; var Key: Char);
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
