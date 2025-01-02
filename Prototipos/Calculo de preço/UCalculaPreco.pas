unit UCalculaPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBDatabase, IBCustomDataSet,
  IBQuery, ComCtrls, Mask;
type
  TProduto = class
  Nome:string;
  Id  :Integer;
  Preco:Currency;
end;
type
  TTrama = class
  peso:Real ;
  precofio:Currency;
end;
type
  TUrdume = class
  peso:Real;
  precofio:Currency;
end;
type
  TBorracha = class
  peso:Real;
  preco:Currency;
end;
type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBTMain: TIBTransaction;
    IBDMain: TIBDatabase;
    IBQUtil: TIBQuery;
    ListBoxProdutos: TListBox;
    Produtos: TLabel;
    EditPeso: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditPreco150: TEdit;
    Label3: TLabel;
    EditPreco100: TEdit;
    Label4: TLabel;
    EditPrecoBorracha: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    EditProduto: TEdit;
    LabeledEPrecoAtual: TLabeledEdit;
    LabeledEPercentual: TLabeledEdit;
    LabeledEPrecoSug: TLabeledEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPesoKeyPress(Sender: TObject; var Key: Char);
    procedure EditPreco150KeyPress(Sender: TObject; var Key: Char);
    procedure EditPreco100KeyPress(Sender: TObject; var Key: Char);
    procedure EditPrecoBorrachaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure ListBoxProdutosClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Math;

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IBDMain.Open;
end;

procedure TForm1.FormShow(Sender: TObject);
var Produto:TProduto;
begin
  IBQUtil.Close;
  IBQUtil.SQL.Clear;
  IBQUtil.Sql.Add('SELECT ID_PRODUTO, '+
                        ' TBPRD_NOME,' +
                        ' TBPRD_PRECOVENDA '+
                  ' FROM   TB_PRODUTOS');
  IBQUtil.Open;
  if not IBQUtil.IsEmpty then
    While Not IBQUtil.Eof do
    begin
     if (Copy (IBQUtil.FieldByName('TBPRD_NOME').AsString, 1, 8) = 'ELÁSTICO') Or
        (Copy (IBQUtil.FieldByName('TBPRD_NOME').AsString, 1, 8)= 'ELASTICO')  Then
      Begin
        Produto:=TProduto.Create;
        Produto.Nome :=IBQUtil.FieldByName('TBPRD_NOME').AsString;
        Produto.Id   :=IBQUtil.FieldByName('ID_PRODUTO').AsInteger;
        Produto.Preco:=IBQUtil.FieldByName('TBPRD_PRECOVENDA').AsCurrency ;
        ListBoxProdutos.AddItem(Produto.Nome, Produto);
      end;
      IBQUtil.Next;
    End

end;

procedure TForm1.EditPesoKeyPress(Sender: TObject; var Key: Char);
begin
   // Restringir Apenas números no edit
  if (not (key in ['0'..'9',#8, ','])) then key := #0;

end;

procedure TForm1.EditPreco150KeyPress(Sender: TObject; var Key: Char);
begin
  if (not (key in ['0'..'9',#8, ',', '.'])) then key := #0;
end;

procedure TForm1.EditPreco100KeyPress(Sender: TObject; var Key: Char);
begin
  if (not (key in ['0'..'9',#8, ',', '.'])) then key := #0;
end;

procedure TForm1.EditPrecoBorrachaKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (key in ['0'..'9',#8, ',', '.'])) then key := #0;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  Trama:  TTrama;
  Urdume: TUrdume;
  Borracha:TBorracha;
  Indice: Integer;
  Edit: TEdit;
  PrecoMaTeria:Currency;
  PrecoTotal:Currency;
begin

  for  indice:=0 To Form1.ComponentCount -1 do
    if Form1.Components[Indice] is TEdit then
      begin
        Edit:=Form1.Components[Indice] as TEdit;
        If (Trim(Edit.Text)= EmptyStr) And (Edit.Name <> 'EditProduto')  then
          Exit;

      end;
  Trama:=TTrama.Create;
  Trama.peso:= (StrToFloat(EditPeso.Text)/100)* 0.35;
  Trama.precofio:=StrToCurr(EditPreco150.Text);
  Borracha:=TBorracha.Create;
  Borracha.peso := (StrToFloat (EditPeso.Text)/100)* 0.35;
  Borracha.preco:=StrToCurr(EditPrecoBorracha.Text);
  Urdume:=TUrdume.Create;
  Urdume.peso:= (StrToFloat (EditPeso.Text)/100)* 0.30;
  Urdume.precofio:= StrToCurr(EditPreco100.Text);
  PrecoMaTeria:=(Trama.peso*Trama.precofio)+ (Borracha.peso*Borracha.preco)+
                (Urdume.peso*Urdume.precofio);
  PrecoTotal:=(PrecoMaTeria*100)/40;
  LabeledEPrecoSug.Text := 'R$ '+ CurrToStr(PrecoTotal);
end;

procedure TForm1.ListBoxProdutosClick(Sender: TObject);
begin
  ListBoxProdutos.Enabled :=False;
  EditProduto.Text   :=(ListBoxProdutos.Items.Objects[ListBoxProdutos.ItemIndex] as TProduto).Nome;
  LabeledEPrecoAtual.Text :='R$ '+ CurrToStr((ListBoxProdutos.Items.Objects[ListBoxProdutos.ItemIndex] as TProduto).Preco);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  ListBoxProdutos.Enabled :=True;
  EditProduto.Clear;

end;

end.
