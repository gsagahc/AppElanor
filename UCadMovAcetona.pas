unit UCadMovAcetona;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, DBClient;

type
  TFrmCadMovAcetona = class(TForm)
    PnlBottom: TPanel;
    PnlBotoes: TPanel;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGBSalvar: TPNGButton;
    PNGButton7: TPNGButton;
    IBUSQLProdutos: TIBUpdateSQL;
    IBQProdutos: TIBQuery;
    IBTbMovAcetona: TIBTable;
    IBSQLProdutos: TIBSQL;
    DSMovAcetona: TDataSource;
    PNGButton1: TPNGButton;
    PnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    PNGButton6: TPNGButton;
    IBTbMovAcetonaDATA: TDateField;
    IBTbMovAcetonaENTRADA_SAIDA: TIBStringField;
    IBTbMovAcetonaQUANTIDADE: TIntegerField;
    IBTbMovAcetonaFABRICANTE: TIBStringField;
    IBTbMovAcetonaDANFE: TIntegerField;
    IBTbMovAcetonaESTOQUE_ANTERIOR: TIntegerField;
    IBTbMovAcetonaESTOQUE_APOS: TIntegerField;
    ComboBoxEntradaSaida: TComboBox;
    IBQueryUtil: TIBQuery;
    procedure PNGButton7Click(Sender: TObject);
    procedure PNGBSalvarClick(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure PNGButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function VerificaProdutoUsado(id:string):Boolean;
    function retornaEstoque:Integer;
    procedure DBEdit5Exit(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadMovAcetona: TFrmCadMovAcetona;

implementation
Uses UPrincipal, UBuscarProdutos, uMensagens, Math,
  UBuscarMovimentacao;

{$R *.dfm}

procedure TFrmCadMovAcetona.PNGButton7Click(Sender: TObject);
begin
  try
    if not FrmPrincipal.IBTMain.Active Then
      FrmPrincipal.IBTMain.StartTransaction;
    If  not IBTbMovAcetona.Active then
      IBTbMovAcetona.Open;

    IBTbMovAcetona.Insert;
    IBTbMovAcetonaESTOQUE_ANTERIOR.AsInteger:=retornaEstoque;
    StatusBotoes;
   
  Except
    on  E: EDatabaseError do
    begin
     tFrmMensagens.Mensagem('Erro ao Incluir movimentação.: PNGButton7Click ','E',[mbOK], E.Message);

    end;
  end;

end;

procedure TFrmCadMovAcetona.PNGBSalvarClick(Sender: TObject);
begin
  If (IBTbMovAcetona.State in [dsEdit, dsInsert]) Then
  Begin
    try
      if ComboBoxEntradaSaida.ItemIndex=0 then
        IBTbMovAcetonaENTRADA_SAIDA.AsString:='E'
      else
      if ComboBoxEntradaSaida.ItemIndex=1 then
        IBTbMovAcetonaENTRADA_SAIDA.AsString:='S'
      else
      begin
        tFrmMensagens.Mensagem('Selecione entrada ou saída' ,'E',[mbOK]);
        ComboBoxEntradaSaida.SetFocus;
        Abort;
      end;
      if IBTbMovAcetonaQUANTIDADE.AsInteger<= 0 then
      begin
        tFrmMensagens.Mensagem('A quantidade precisa ser um valor maior que 0(zero)' ,'E',[mbOK]);
        DBEdit5.SetFocus;
        Abort;
      End;
      IBTbMovAcetona.Post;
      FrmPrincipal.IBTMain.Commit;
      FrmPrincipal.IBDMain.CloseDataSets;
    Except
     on  E: EDatabaseError do
     begin
       tFrmMensagens.Mensagem('Erro ao Salvar produto no banco.: PNGBSalvarClick ' ,'E',[mbOK], E.Message);

     end;

    End;
    StatusBotoes;
  End;
end;

procedure TFrmCadMovAcetona.PNGButton3Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja deletar a movimentação mostrada?','Q',[mbSim, mbNao])) then
  begin
    IBTbMovAcetona.Delete;
    FrmPrincipal.IBTMain.Commit;
  end;


  StatusBotoes;
end;

procedure TFrmCadMovAcetona.PNGButton4Click(Sender: TObject);
begin
  IBTbMovAcetona.Cancel;
  IBTbMovAcetona.Close;
  StatusBotoes;
end;

procedure TFrmCadMovAcetona.PNGButton6Click(Sender: TObject);
begin
  FrmPrincipal.IdProduto  :=0;
  Application.CreateForm(TFrmBuscarMovimentacao, FrmBuscarMovimentacao);
  FrmBuscarMovimentacao.Caption := 'Localizar movimentação';
  FrmBuscarMovimentacao.ShowModal;
  If  FrmPrincipal.IdProduto<>0 Then
  begin
    IBTbMovAcetona.Open;
    if IBTbMovAcetona.Locate('ID_MOV',  FrmPrincipal.IdProduto ,[loCaseInsensitive, loPartialKey]) Then
    begin
      if IBTbMovAcetonaENTRADA_SAIDA.AsString='E' then
        ComboBoxEntradaSaida.ItemIndex:=0
      else
        ComboBoxEntradaSaida.ItemIndex:=1;  
      StatusBotoes;
    end;
  End;
  FrmBuscarPrd.Free;
end;

procedure TFrmCadMovAcetona.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadMovAcetona.StatusBotoes;
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
  ComboBoxEntradaSaida.ItemIndex:=-1;   
end;

procedure TFrmCadMovAcetona.PNGButton1Click(Sender: TObject);
begin
   IBTbMovAcetona.edit;
  // StatusBotoes;
end;

procedure TFrmCadMovAcetona.FormKeyPress(Sender: TObject; var Key: Char);
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

function TFrmCadMovAcetona.VerificaProdutoUsado(id: string): Boolean;
begin
  Result:=False;
  IBSQLProdutos.Close;
  IBSQLProdutos.SQL.Clear;
  IBSQLProdutos.SQL.Add('SELECT ID_PRODUTO FROM TB_ITENSPEDIDO '+
                         'WHERE ID_PRODUTO=:pId_produto');


  IBSQLProdutos.ParamByName('pId_produto').AsString :=id;
  IBSQLProdutos.ExecQuery;
  If Not IBSQLProdutos.Eof then
    Result:=True;

end;

function TFrmCadMovAcetona.retornaEstoque: Integer;
begin
  IBQueryUtil.Close;
  IBQueryUtil.SQL.Clear;
  IBQueryUtil.SQL.Add('SELECT QUANTIDADE FROM TB_ESTOQUE_ACETONA');
  try
    IBQueryUtil.Open;
    Result:=IBQueryUtil.FieldByName('QUANTIDADE').AsInteger;
  except
    on  E: EDatabaseError do
     begin
       tFrmMensagens.Mensagem('Ao realizar consulta do estoque atual "retornaEstoque"' ,'E',[mbOK], E.Message);

     end;

  end;
end;

procedure TFrmCadMovAcetona.DBEdit5Exit(Sender: TObject);
begin
  if IBTbMovAcetonaQUANTIDADE.AsInteger>0 then
  begin
    if ComboBoxEntradaSaida.ItemIndex= 0 then
      IBTbMovAcetonaESTOQUE_APOS.AsInteger:=IBTbMovAcetonaESTOQUE_ANTERIOR.AsInteger+
                                            IBTbMovAcetonaQUANTIDADE.AsInteger;

    if ComboBoxEntradaSaida.ItemIndex= 1 then
      IBTbMovAcetonaESTOQUE_APOS.AsInteger:=IBTbMovAcetonaESTOQUE_ANTERIOR.AsInteger-
                                            IBTbMovAcetonaQUANTIDADE.AsInteger ;

  end
  else
  begin
    tFrmMensagens.Mensagem('A quantidade precisa ser um valor maior que 0(zero)' ,'E',[mbOK]);
    DBEdit5.SetFocus;
  end;
end;

end.
