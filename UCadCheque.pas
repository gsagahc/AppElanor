unit UCadCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls;
  

type
  TFrmCadCheque = class(TForm)
    PnlBottom: TPanel;
    PnlMain: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGButtonSalvar: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton7: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    DBEditPedido: TDBEdit;
    IBUSQLCheques: TIBUpdateSQL;
    IBQPCheques: TIBQuery;
    IBTbCheques: TIBTable;
    IBSQLCheques: TIBSQL;
    DSProdutos: TDataSource;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    PNGButton1: TPNGButton;
    DBEditCheque: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    IBTbChequesTBCH_NUMCH: TIBStringField;
    IBTbChequesTBCH_VALCH: TIBBCDField;
    IBTbChequesID_CLIENTE: TIntegerField;
    IBTbChequesID_PEDIDO: TIntegerField;
    IBTbChequesTBCH_BOMPARA: TDateField;
    IBTbChequesTBCH_NUMPED: TIBStringField;
    IBTbChequesID_CHEQUE: TIntegerField;
    PNGButton5: TPNGButton;
    MemoCheque: TMemo;
    DBMemo1: TDBMemo;
    IBTbChequesTBCH_OBS: TMemoField;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGButtonSalvarClick(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditPedidoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure PNGButton5Click(Sender: TObject);
    procedure DBEditChequeExit(Sender: TObject);
  private
    NumCheque:String;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadCheque: TFrmCadCheque;

implementation
Uses UPrincipal, UBuscarProdutos, uMensagens, Math, UBuscarCheque;

{$R *.dfm}

procedure TFrmCadCheque.PNGButton7Click(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbCheques.Active then
      IBTbCheques.Open;

    IBTbCheques.Insert;
    StatusBotoes;
    DBEditCheque.SetFocus;  
  Except;

  end;

end;

procedure TFrmCadCheque.PNGButtonSalvarClick(Sender: TObject);
begin
  If (IBTbCheques.State in [dsEdit, dsInsert]) Then
  Begin
    NumCheque:=IBTbChequesTBCH_NUMCH.AsString;    
    IBTbCheques.Post;
    FrmPrincipal.IBTMain.Commit;
    StatusBotoes;
  End;
end;

procedure TFrmCadCheque.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o produtos mostrado?','Q',[mbSim, mbNao])) then
     IBTbCheques.Delete;
  StatusBotoes;
end;

procedure TFrmCadCheque.PNGButton4Click(Sender: TObject);
begin
  IBTbCheques.Cancel;
  IBTbCheques.Close;
  StatusBotoes;
end;

procedure TFrmCadCheque.PNGButton6Click(Sender: TObject);
begin
  FrmPrincipal.IdCheque:=0;
  Application.CreateForm(TFrmBuscarCheques, FrmBuscarCheques);
  FrmBuscarCheques.ShowModal;
  If Not IBTbCheques.Active Then
    IBTbCheques.Open;

  IBTbCheques.Locate('ID_CHEQUE',IntToStr(FrmPrincipal.IdCheque), [loPartialKey] );
  NumCheque:=IBTbChequesTBCH_NUMCH.AsString;   
  FreeAndNil(FrmBuscarCheques);


end;

procedure TFrmCadCheque.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCheque.StatusBotoes;
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

procedure TFrmCadCheque.PNGButton1Click(Sender: TObject);
begin
   IBTbCheques.edit;
end;

procedure TFrmCadCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if (not (ActiveControl is TDBGrid)) and   (not (ActiveControl is TDBMemo)) then
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

procedure TFrmCadCheque.DBEditPedidoExit(Sender: TObject);
begin
    If Trim(DBEditPedido.Text)<>EmptyStr Then
    Begin
      IBSQLCheques.Close;
      IBSQLCheques.Sql.Clear;
      IBSQLCheques.Sql.Add('SELECT TBPED_NUMPED '+
                                 ' ID_PEDIDO '+
                             'FROM TB_PEDIDOS '+
                            'WHERE TBPED_NUMPED=:pNumPed');

      IBSQLCheques.ParamByName('pNumPed').AsString :=DBEditPedido.Text;
      IBSQLCheques.ExecQuery;

      If IBSQLCheques.Eof Then
      Begin
        PNGButtonSalvar.Enabled :=False;
        tFrmMensagens.Mensagem('Pedido inválido ou inexistente, favor verificar ou cancelar','E',[mbOK]);
        IBTbChequesID_PEDIDO.Clear;
        DBEditPedido.Clear;
      End
      Else
        PNGButtonSalvar.Enabled :=True;
    End;
end;
procedure TFrmCadCheque.FormShow(Sender: TObject);
begin
  DBEditCheque.SetFocus;
end;

procedure TFrmCadCheque.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
   Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmCadCheque.PNGButton5Click(Sender: TObject);
begin
  If  not IBTbCheques.Active then
  Begin
     IBTbCheques.Open;
     IBTbCheques.Locate('TBCH_NUMCH', NumCheque, [loPartialKey ] );
  End;
  MemoCheque.Lines.Add(IBTbChequesTBCH_NUMPED.AsString);
  If  tFrmMensagens.Mensagem('Deseja imprimir também o conteúdo do campo OBS?','Q',[mbSim, MbNao]) Then
  Begin
    MemoCheque.Lines.Add( IBTbChequesTBCH_OBS.AsString);
  End;
  tFrmMensagens.Mensagem('Favor posicionar o cheque na bandeja','I',[mbOK]);
  FrmPrincipal.Memo_Print(MemoCheque.Lines);
end;

procedure TFrmCadCheque.DBEditChequeExit(Sender: TObject);
begin
    If Trim(DBEditCheque.Text)<> EmptyStr Then
    begin
      IBSQLCheques.Close;
      IBSQLCheques.Sql.Clear;
      IBSQLCheques.Sql.Add('SELECT TBCH_NUMCH '+
                             'FROM TB_CHEQUES '+
                            'WHERE TBCH_NUMCH=:pNumCheque');

      IBSQLCheques.ParamByName('pNumCheque').AsString :=DBEditCheque.Text;
      IBSQLCheques.ExecQuery;

      If Not IBSQLCheques.Eof Then
      Begin
        PNGButtonSalvar.Enabled :=False;
        tFrmMensagens.Mensagem('Cheque já cadastrado, favor verificar ou cancelar','E',[mbOK]);
        IBTbChequesTBCH_NUMCH.Clear;
        DBEditCheque.Clear;
      End
      Else
        PNGButtonSalvar.Enabled :=True;
    End;
end;

end.
