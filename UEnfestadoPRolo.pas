unit UEnfestadoPRolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngextra, StdCtrls, ExtCtrls, IBSQL, DB, IBCustomDataSet,
  IBQuery;

type
  TFrmEnfestadoPRolo = class(TForm)
    Panel1: TPanel;
    EditQuantidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PNGButton6: TPNGButton;
    PNGButton2: TPNGButton;
    PNGButton5: TPNGButton;
    LstBoxEstoque: TListBox;
    IBQEstoque: TIBQuery;
    IBQUtil: TIBQuery;
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure EditQuantidadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEnfestadoPRolo: TFrmEnfestadoPRolo;

implementation

uses USelecionaProdestoque, UPrincipal, UMensagens, Math;

{$R *.dfm}

procedure TFrmEnfestadoPRolo.PNGButton6Click(Sender: TObject);
begin
  Application.CreateForm(TFrmSelecionarProdEstoque,FrmSelecionarProdEstoque);
  FrmSelecionarProdEstoque.ShowModal;
  FrmSelecionarProdEstoque.Free;
  If LstBoxEstoque.Items.Count >0 Then
    PNGButton5.Enabled:=True;   
end;

procedure TFrmEnfestadoPRolo.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEnfestadoPRolo.PNGButton5Click(Sender: TObject);
var quantidade:Integer;
begin
  if (tFrmMensagens.Mensagem('Confirma a transferencia de:'+EditQuantidade.Text+
                             'metros de enfestado para rolo?','Q',[mbSim, mbNao])) then
  begin
    // Comparar se maior que estoque
    quantidade:=0;
    If (LstBoxEstoque.Items.Objects[0] As TEstoque).Quantidade >=StrToInt(EditQuantidade.Text) Then
    Begin
      //Dar baixa no estoque
      IBQEstoque.Close;
      IBQEstoque.Sql.Clear;
      IBQEstoque.Sql.Add('UPDATE TB_ESTOQUE '+
                           ' SET '+
                           'TBES_QUANTI = :pTBES_QUANTI '+
                            'WHERE '+
                           'ID_PRODUTO = :pOLD_ID_PRODUTO and '+
                           'TBES_FORMATO = :pOLD_TBES_FORMATO ');
      IBQEstoque.ParamByName('pOLD_ID_PRODUTO').AsInteger :=(LstBoxEstoque.Items.Objects[0] As TEstoque).id_produto ;
      IBQEstoque.ParamByName('pOLD_TBES_FORMATO').AsString:=Trim((LstBoxEstoque.Items.Objects[0] As TEstoque).Formato);
      IBQEstoque.ParamByName('pTBES_QUANTI').AsFloat:=(LstBoxEstoque.Items.Objects[0] As TEstoque).Quantidade -StrToFloat (EditQuantidade.Text);
      IBQEstoque.ExecSQL;
      //criar estoque como rolo
          //Verificar se já existe estoque criado.
      IBQUtil.Close;
      IBQUtil.Sql.Clear;
      IBQUtil.Sql.add('SELECT ID_ESTOQUE, '+
                            ' TBES_QUANTI '+
                       ' FROM TB_ESTOQUE  '+
                        'WHERE ID_PRODUTO=:pProduto '+
                        '  AND TBES_FORMATO=:pFormato');
      IBQUtil.ParamByName('pProduto').AsInteger:=(LstBoxEstoque.Items.Objects[0] As TEstoque).id_produto;
      IBQUtil.ParamByName('pFormato').AsString:='ROLO';
      IBQUtil.Open;
      quantidade:= IBQUtil.FieldByName('TBES_QUANTI').AsInteger;
      If IBQUtil.IsEmpty Then
      Begin
        IBQEstoque.Close;
        IBQEstoque.SQL.Clear;
        IBQEstoque.Sql.Add('INSERT INTO TB_ESTOQUE '+
                                         '(ID_PRODUTO,'+
                                         'TBES_FORMATO, '+
                                         'TBES_QUANTI) '+
                             ' VALUES '+
                             ' (:pID_PRODUTO, '+
                             ' :pTBES_FORMATO,'+
                             ' :pTBES_QUANTI)');
         IBQEstoque.ParamByName('pID_PRODUTO').AsInteger := (LstBoxEstoque.Items.Objects[0] As TEstoque).id_produto;
         IBQEstoque.ParamByName('pTBES_FORMATO').AsString:='ROLO';
         IBQEstoque.ParamByName('pTBES_QUANTI').AsInteger:=quantidade +StrToInt(EditQuantidade.Text) ;
         IBQEstoque.ExecSQL;

      End
      Else
      Begin
       IBQEstoque.Close;
       IBQEstoque.SQL.Clear;
       IBQEstoque.Sql.Add('UPDATE TB_ESTOQUE '+
                           ' SET '+
                           'TBES_QUANTI = :pTBES_QUANTI '+
                            'WHERE '+
                           'ID_PRODUTO = :pOLD_ID_PRODUTO and '+
                           'TBES_FORMATO = :pOLD_TBES_FORMATO ');
       IBQEstoque.ParamByName('pOLD_ID_PRODUTO').AsInteger := (LstBoxEstoque.Items.Objects[0] As TEstoque).id_produto;
       IBQEstoque.ParamByName('pOLD_TBES_FORMATO').AsString:='ROLO';
       IBQEstoque.ParamByName('pTBES_QUANTI').AsInteger:=quantidade + StrToInt(EditQuantidade.Text);
       IBQEstoque.ExecSQL;

      End;


      End
    Else
      tFrmMensagens.Mensagem('A quantidade precisa ser menor ou igual a existente '+
                             ' em estoque','E',[mbOK]);

  end;
  Close;
end;

procedure TFrmEnfestadoPRolo.EditQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

end.
