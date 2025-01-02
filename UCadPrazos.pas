unit UCadPrazos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TFrmCadPrazos = class(TForm)
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
    IBUSQLPrazos: TIBUpdateSQL;
    IBQPrazos: TIBQuery;
    IBTbPrazos: TIBTable;
    IBSQLPrazos: TIBSQL;
    DSPrazos: TDataSource;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    PNGButton1: TPNGButton;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    IBTbPrazosTBPRZ_PRAZO01: TIntegerField;
    IBTbPrazosTBPRZ_PRAZO02: TIntegerField;
    IBTbPrazosTBPRZ_PRAZO03: TIntegerField;
    IBTbPrazosTBPRZ_NOME: TIBStringField;
    IBQPrazosID_PRAZO: TIntegerField;
    IBQPrazosTBPRZ_PRAZO01: TIntegerField;
    IBQPrazosTBPRZ_PRAZO02: TIntegerField;
    IBQPrazosTBPRZ_PRAZO03: TIntegerField;
    IBQPrazosTBPRZ_NOME: TIBStringField;
    IBTbPrazosID_PRAZO: TIntegerField;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function VerificaPrazoUtilizado(id:String):Boolean;
  private
    { Private declarations }
  public
     IdPrazo:Integer;
    { Public declarations }
  end;

var
  FrmCadPrazos: TFrmCadPrazos;

implementation
Uses UPrincipal, UBuscarProdutos, uMensagens, Math, UBuscarPrazos;

{$R *.dfm}

procedure TFrmCadPrazos.PNGButton7Click(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbPrazos.Active then
      IBTbPrazos.Open;
    IBTbPrazos.Insert;
    StatusBotoes;

  Except;

  end;

end;

procedure TFrmCadPrazos.PNGButton5Click(Sender: TObject);
begin
  If  (IBTbPrazos.State in [dsEdit, dsInsert]) Then
  begin
    If (DBEdit2.Text = EmptyStr ) and (DBEdit5.Text =EmptyStr ) and (DBEdit6.Text =EmptyStr ) then
      Begin
        (tFrmMensagens.Mensagem('Não é possivel cadastrar mais de um prazo "A Vista"','I',[mbOK]));
        IBTbPrazos.Cancel; 
        StatusBotoes; 
      End
    else
    Begin
      IBTbPrazos.Post;
      FrmPrincipal.IBTMain.Commit ;
      StatusBotoes;
      IBTbPrazos.Open;
    end;
  End;
end;

procedure TFrmCadPrazos.PNGButton3Click(Sender: TObject);
begin
  If IBTbPrazosID_PRAZO.AsInteger <>6 Then
  Begin
    if (tFrmMensagens.Mensagem('Deleja deletar o produtos mostrado?','Q',[mbSim, mbNao])) then
    begin
       If Not VerificaPrazoUtilizado(IBTbPrazosID_PRAZO.AsString) Then
       begin
         IBTbPrazos.Delete;
         FrmPrincipal.IBTMain.Commit;
       end
       Else
        tFrmMensagens.Mensagem('Não é possível deletar este prazo, '+
                              'pois o mesmo já foi utilizado' ,'I',[mbOK]);
    end;
  End
  Else
     tFrmMensagens.Mensagem('Não é possível deletar este prazo, '+
                                'pois o mesmo é padrão do sistema' ,'I',[mbOK]);

  StatusBotoes;
end;

procedure TFrmCadPrazos.PNGButton4Click(Sender: TObject);
begin
  IBTbPrazos.Cancel;
  FrmPrincipal.IBTMain.Rollback; 
  StatusBotoes;
end;

procedure TFrmCadPrazos.PNGButton6Click(Sender: TObject);
begin
  IdPrazo  :=0;
  If Not IBQPrazos.Active Then
    IBQPrazos.Open;
  If Not IBTbPrazos.Active Then
    IBTbPrazos.Open;  
  Application.CreateForm(TFrmBuscaPrazos, FrmBuscaPrazos);
  FrmBuscaPrazos.ShowModal;
  
  If  (IdPrazo<>0) and (IdPrazo<>6)  Then
  begin
    if IBTbPrazos.Locate('ID_PRAZO', IdPrazo ,[loCaseInsensitive, loPartialKey]) Then
    StatusBotoes;
  end;  
  FreeAndNil(FrmBuscaPrazos);
end;

procedure TFrmCadPrazos.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPrazos.StatusBotoes;
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

procedure TFrmCadPrazos.PNGButton1Click(Sender: TObject);
begin
   IBTbPrazos.edit;
 //  StatusBotoes;
end;

procedure TFrmCadPrazos.FormKeyPress(Sender: TObject; var Key: Char);
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

function TFrmCadPrazos.VerificaPrazoUtilizado(id:String): Boolean;
begin
  Result:= False;
  IBSQLPrazos.Close;
  IBSQLPrazos.SQL.Clear;
  IBSQLPrazos.SQL.Add('SELECT ID_PRAZO FROM TB_PEDIDOS  '+
                       'WHERE ID_PRAZO=:pIdPrazo ');
  IBSQLPrazos.ParamByName('pIdPrazo').AsString :=id;
  IBSQLPrazos.ExecQuery;
  If Not IBSQLPrazos.Eof then
    Result:=True;

end;

end.
