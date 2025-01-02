unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngextra, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  IBDatabase, pngimage;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    EditLogin: TEdit;
    EditSenha: TEdit;
    Panel2: TPanel;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    IBQUsuario: TIBQuery;
    IBTMain: TIBTransaction;
    imgCapsLock: TImage;
    LabelCapsLock: TLabel;
    procedure PNGButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     vTentativas:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation
Uses UMensagens, criptografia, UPrincipal;

{$R *.dfm}

procedure TFrmLogin.PNGButton6Click(Sender: TObject);
Var Senha:String;

begin
 FrmPrincipal.Usuario:= 'MASTER';
 Close;
{  if vTentativas<=4 Then
  Begin
    IBQUsuario.Close;
    IBQUsuario.ParambyName('PUSUARIO').AsString:=EditLogin.Text;
    IBQUsuario.Open;
    If IBQUsuario.IsEmpty Then
      (tFrmMensagens.Mensagem('Usuário não encontrado!','I',[mbOK]))
    Else
      Begin
         Senha:=  FrmPrincipal.criptografia1.Criptografar(Trim(IBQUsuario.FieldByname('TBUSR_SENHA').AsString));
           If Trim(Senha) =Trim(EditSenha.Text)   Then
           Begin
             FrmPrincipal.Usuario:= EditLogin.Text;
             FrmPrincipal.StatusBar1.Panels.Items[0].Text:='Login: ' + EditLogin.Text;
             FrmPrincipal.UserAdm:=IBQUsuario.FieldByname('TBUSR_ADM').AsString;
             FrmPrincipal.IdUsuario:=IBQUsuario.FieldByname('ID_USUARIO').AsInteger;
             FrmPrincipal.AtualizarTvContaRec;
             FrmPrincipal.atualizarTreeView;
             If IBQUsuario.FieldByname('TBUSR_ADM').AsString ='S' then
             Begin
               FrmPrincipal.Usurios1.Enabled   :=True;
               FrmPrincipal.PNGButton5.Enabled := True;
               FrmPrincipal.Financeiro1.Enabled:=True;
             end
             Else
             begin
               FrmPrincipal.Usurios1.Enabled   :=False;
               FrmPrincipal.PNGButton5.Enabled := False;
               FrmPrincipal.Financeiro1.Enabled:=False;
             end;
             Close;
           End
           Else
           Begin
             (tFrmMensagens.Mensagem('Senha incorreta!','I',[mbOK])) ;
             EditSenha.Clear;
           End;
      End;
      vTentativas:=vTentativas+1;
  End
  Else
    Application.Terminate;}
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  vTentativas:=0;
end;

procedure TFrmLogin.PNGButton2Click(Sender: TObject);
begin
  Application.Terminate; 
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      If  (EditLogin.Text <> EmptyStr) And (EditSenha.Text<>EmptyStr) then
        PNGButton6.OnClick(Self);      
    end
    else if (ActiveControl is TDBGrid) then
      with TDBGrid(ActiveControl) do
        if selectedindex < (fieldcount -1) then
          selectedindex := selectedindex +1
        else
          selectedindex := 0;

end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if odd (GetKeyState(VK_CAPITAL)) then
  Begin
    imgCapsLock.Visible   :=True;
    LabelCapsLock.Visible :=True;
  End
  else
  Begin
    imgCapsLock.Visible   :=False;
    LabelCapsLock.Visible :=False;
  End;
end;

end.
