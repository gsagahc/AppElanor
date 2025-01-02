unit UCancelpedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBSQL, DB, IBCustomDataSet, IBQuery, pngextra, Grids,
  DBGrids, ExtCtrls, IBUpdateSQL;

type
  TFrmCancelPedidos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    PNGButton1: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton4: TPNGButton;
    DsPedidos: TDataSource;
    Panel2: TPanel;
    PanelViewPedido: TPanel;
    Panel3: TPanel;
    EditPedido: TEdit;
    IBQPedido: TIBQuery;
    IBSQLPedido: TIBSQL;
    MemoMotivo: TMemo;
    Label1: TLabel;
    IBSQLItensPed: TIBSQL;
    IBSQLEstoque: TIBSQL;
    IBSQLCONTAREC: TIBSQL;
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure MemoMotivoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancelPedidos: TFrmCancelPedidos;

implementation
Uses UPrincipal, UMensagens, Math;

{$R *.dfm}

procedure TFrmCancelPedidos.PNGButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCancelPedidos.PNGButton1Click(Sender: TObject);
begin
  If Trim(EditPedido.Text)<> EmptyStr Then
  Begin
    IBQPedido.Close;
    IBQPedido.ParamByName('pNumPed').AsString:=EditPedido.Text;
    IBQPedido.Open;
    If IBQPedido.IsEmpty Then
      tFrmMensagens.Mensagem('Pedido não localizado, favor verificar número digitado','I',[mbOK])
  {  If (IBQPedido.FieldByName('TBPED_DATA').AsDateTime +1)< Now() then
    begin
      PNGButton5.Enabled :=False;
      tFrmMensagens.Mensagem('O prazo para cancelamento deste pedido está expirado','I',[mbOK]);
    end }
    else
      PNGButton5.Enabled :=True;
  End;
end;

procedure TFrmCancelPedidos.PNGButton5Click(Sender: TObject);
begin
  if  (tFrmMensagens.Mensagem('Confirma o cancelamento?','Q',[mbSim, mbNao])) Then
  Begin
    If (Trim(MemoMotivo.Text)<> EmptyStr) And (Length(Trim(MemoMotivo.Text))>15)Then
    Begin
    //Retornar produtos para estoque
      IBSQLItensPed.Close;
      IBSQLItensPed.SQL.Clear;
      IBSQLItensPed.Sql.Add('SELECT ID_PRODUTO,  '+
                                  ' TBITPED_QUANT, '+
                                  ' ID_PEDIDO, '+
                                  ' TBITPED_QUANT, '+
                                  ' TBITPED_TIPO, '+
                                  ' TBITPED_TAMANHO '+
                              'FROM TB_ITENSPEDIDO '+
                             'WHERE ID_PEDIDO=:pIDPedido');

      IBSQLItensPed.ParamByName('pIDPedido').AsInteger := IBQPedido.FieldByName('ID_PEDIDO').AsInteger;
      IBSQLItensPed.ExecQuery;
      while  not IBSQLItensPed.Eof Do
      Begin
        IBSQLEstoque.Close;
        IBSQLEstoque.ParamByName('pIDProduto').AsInteger :=IBSQLItensPed.FieldByName('ID_PRODUTO').AsInteger;
        IBSQLEstoque.ParamByName('pQuant').Value         :=IBSQLItensPed.FieldByName('TBITPED_QUANT').Value;
        IBSQLEstoque.ParamByName('pFormato').AsString    :=IBSQLItensPed.FieldByName('TBITPED_TIPO').AsString;
        IBSQLEstoque.ParamByName('pTamanho').Value       :=IBSQLItensPed.FieldByName('TBITPED_TAMANHO').Value ;
        IBSQLEstoque.ExecQuery; 
        IBSQLItensPed.Next;
      End;
      IBSQLPedido.Close;
      IBSQLPedido.ParamByName('pCancelado').AsString:='S';
      IBSQLPedido.ParamByName('pMotivo').AsString:='CANCELADO POR:'+ FrmPrincipal.Usuario +
                                                   ' - DATA: '+FormatDateTime('dd/mm/yyyy', now)+
                                                   ' - MOTIVO:' + MemoMotivo.Lines.Text;
      IBSQLPedido.ParamByName('pNumPed').AsString:=IBQPedido.FieldByName('TBPED_NUMPED').AsString;
      IBSQLCONTAREC.ParamByName('pPEDIDO').AsInteger :=   IBQPedido.FieldByName('ID_PEDIDO').AsInteger;
      try
        IBSQLPedido.ExecQuery;
        IBSQLCONTAREC.ExecQuery; 

      Finally
        tFrmMensagens.Mensagem('Pedido cancelado com sucesso','I',[mbOK]);
        FrmPrincipal.AtualizarTvContaRec;  
        FrmPrincipal.IBTMain.Commit ;
        Close;
      end;
    End
    Else
    begin
       tFrmMensagens.Mensagem('Favor digitar o motivo','E',[mbOK]);
       MemoMotivo.Clear;  
    end;
  End;
end;



procedure TFrmCancelPedidos.MemoMotivoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

end.
