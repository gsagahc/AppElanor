unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Contnrs;

type
  TPessoa = class
  private
    nome : String;
    idade: Integer;
  public
    procedure setNome(nome: string);
    procedure setIdade(idade:Integer);
    function getNome(p:TPessoa):string;
    function getIdade(p:TPessoa):Integer;
end;

type
  TForm1 = class(TForm)

    Panel1: TPanel;
    Panel2: TPanel;
    UpDown1: TUpDown;
    Button1: TButton;
    Button2: TButton;
    lstPilha: TListBox;
    lbedNome: TLabeledEdit;
    stbAutor: TStatusBar;
    edtIdade: TEdit;
    Label1: TLabel;
    btnInserir: TButton;
    btnQtde: TButton;
    btnRemover: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnQtdeClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  Form1: TForm1;
  pessoa: TPessoa;
  pilha: TObjectStack;
implementation

{$R *.dfm}

{ TPessoa }


function TPessoa.getIdade(p: TPessoa): Integer;
begin
  result:=p.idade;
end;

function TPessoa.getNome(p: TPessoa): string;
begin
  result:=p.nome;
end;

procedure TPessoa.setIdade(idade: Integer);
begin
  Pessoa.idade:=idade;
end;

procedure TPessoa.setNome(nome: string);
begin
  Pessoa.nome:= nome;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  pilha := TObjectStack.Create;
end;

procedure TForm1.btnInserirClick(Sender: TObject);
begin
  if(edtIdade.Text <> '0') and (lbedNome.Text <>'') then
  begin
    {Cria um nova instância do objeto pessoa.}
    pessoa := TPessoa.Create;
    pessoa.setNome(lbedNome.Text);
    pessoa.setIdade(StrToInt(edtIdade.text));
    {Adiciona à pilha}
    pilha.Push(pessoa);
  end
  else
    ShowMessage('Digite um Nome e uma Idade diferente de Zero!');
end;


procedure TForm1.btnQtdeClick(Sender: TObject);
begin
 if(pilha.Count > 0) then
   ShowMessage(IntToStr(pilha.count) + ' Objeto(s)')
 else
   ShowMessage('Pilha vazia!');
end;

procedure TForm1.btnRemoverClick(Sender: TObject);
begin
  if(pilha.Count > 0) then
    pilha.Pop
  else
    ShowMessage('Pilha vazia!');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  aux: TPessoa;
  i: integer;
begin
  for i:=1 to pilha.Count do
  begin
    aux := TPessoa(pilha.Pop);
    lstpilha.Items.Add(IntToStr(i) + '- Nome: ' + aux.getNome(aux) +
                          ', Idade: ' + IntToStr(aux.getIdade(aux)));
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  lbedNome.Clear;
  edtIdade.text := '0';
  lstpilha.Clear;
  lbedNome.SetFocus;
  pilha.Free;
  FormCreate(Self);
end;

end.
