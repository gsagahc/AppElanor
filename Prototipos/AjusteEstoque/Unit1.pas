unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, IBDatabase,
  IBUpdateSQL, IBTable, IniFiles;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQueryProdutos: TIBQuery;
    IBQueryUtil: TIBQuery;
    BitBtn1: TBitBtn;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBTableProdutos: TIBTable;
    IBQueryProdutosID_PRODUTO: TIntegerField;
    IBQueryProdutosTBES_QUANTI: TIBBCDField;
    IBQueryProdutosTBES_FORMATO: TIBStringField;
    IBQueryProdutosTBES_TAMANHO: TIBBCDField;
    IBQueryProdutosID_ESTOQUE: TIntegerField;
    IBTableProdutosID_ESTOQUE: TIntegerField;
    IBTableProdutosID_PRODUTO: TIntegerField;
    IBTableProdutosTBES_QUANTI: TIBBCDField;
    IBTableProdutosTBES_FORMATO: TIBStringField;
    IBTableProdutosTBES_TAMANHO: TIBBCDField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Lerini;
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

  try
    IBTableProdutos.Open;

    if not IBTableProdutos.IsEmpty then
    begin
      IBTableProdutos.First;
      while not IBTableProdutos.Eof do
      begin
        IBQueryUtil.Close;
        IBQueryUtil.SQL.Clear;
        IBQueryUtil.SQL.add('SELECT * FROM '+
                                  '   TB_ESTOQUE '+
                            ' WHERE  ID_PRODUTO='''+IBTableProdutos.FieldByName('ID_PRODUTO').AsString+'''' +
                            '   AND  TBES_FORMATO<>''ENFESTADO'' '+
                            '   AND  TBES_FORMATO<>''CARRETEL'' ' +
                            '   AND  TBES_QUANTI > 0 ');
        IBQueryUtil.Open;
         if not IBQueryUtil.IsEmpty then
         begin
           IBQueryUtil.First;
           while not IBQueryUtil.Eof do
             begin
               IBTableProdutos.Edit;
               IBTableProdutos.FieldByName('TBES_QUANTI').AsInteger:=
               IBTableProdutos.FieldByName('TBES_QUANTI').AsInteger+
               IBQueryUtil.FieldByName('TBES_QUANTI').AsInteger;
               IBTableProdutos.Post;
            
               IBQueryUtil.Next;
             end;
         end;
        IBTableProdutos.Next;
      end;
    end;
    IBQueryUtil.Close;
    IBQueryUtil.SQL.Clear;
    IBQueryUtil.SQL.add('DELETE FROM '+
                             '   TB_ESTOQUE '+
                            ' WHERE  TBES_FORMATO =''ROLO'' ');
    IBQueryUtil.ExecSQL;

    IBQueryUtil.Close;
    IBQueryUtil.SQL.Clear;
    IBQueryUtil.SQL.add('DELETE FROM '+
                             '   TB_ESTOQUE '+
                            ' WHERE TRIM(TBES_FORMATO) ='''' ');
    IBQueryUtil.ExecSQL;

    IBQueryUtil.Close;
    IBQueryUtil.SQL.Clear;
    IBQueryUtil.SQL.add('UPDATE TB_ESTOQUE SET '+
                             '  TBES_FORMATO=''METRO''  '+
                        ' WHERE  TBES_FORMATO =''ENFESTADO'' OR' +
                        '        TBES_FORMATO =''CARRETEL''' );
    IBQueryUtil.ExecSQL;


    IBQueryUtil.Close;
    IBQueryUtil.SQL.Clear;
    IBQueryUtil.SQL.add('UPDATE TB_ESTOQUE SET '+
                             '  TBES_FORMATO=''UNIDADE''  '+
                        ' WHERE  TBES_FORMATO =''COM PONTEIRA''');

    IBQueryUtil.ExecSQL;

    IBQueryUtil.Close;
    IBQueryUtil.SQL.Clear;
    IBQueryUtil.SQL.add('DELETE FROM TB_ESTOQUE '+

                        ' WHERE  TBES_QUANTI = 0 ');

    IBQueryUtil.ExecSQL;
    //Remover duplicidades

    IBQueryUtil.Close;
    IBQueryUtil.SQL.Clear;
    IBQueryUtil.SQL.add(' Select ID_PRODUTO, count(*) '+
                        ' from TB_ESTOQUE'+
                        ' group by ID_PRODUTO' +
                        ' having count(*) > 1; ');
    IBQueryUtil.Open;
    IBQueryUtil.First;
    while not IBQueryUtil.Eof do
    begin
      IBQueryProdutos.Close;
      IBQueryProdutos.SQL.Clear;
      IBQueryProdutos.SQL.add('DELETE FROM TB_ESTOQUE '+
                              ' WHERE  ID_PRODUTO =''' +IBQueryUtil.FieldByName('ID_PRODUTO').AsString + ''''+
                              '   AND ID_ESTOQUE=(SELECT MAX(ID_ESTOQUE) FROM TB_ESTOQUE WHERE ID_PRODUTO='''+IBQueryUtil.FieldByName('ID_PRODUTO').AsString+''')');

      IBQueryProdutos.ExecSQL;
      IBQueryUtil.Next;
    end;
    //
    IBTransaction1.Commit;
    ShowMessage('FIM !');
  except

  end;


end;

procedure TForm1.Lerini;
Var ArqIni: TIniFile;
    caminho:string;
    BancoDados:String;
begin
  caminho:=Application.ExeName;
  caminho:=Copy(caminho,1, pos('Project1.exe',caminho)-1);
  ArqIni := TIniFile.Create(caminho+'Config.ini');
  try
    IBDatabase1.Connected:=False;

    IBDatabase1.DatabaseName := ArqIni.ReadString('Configuracoes', 'DATABASE', BancoDados);
    IBDatabase1.Connected:=True;
  finally
    ArqIni.Free;
  end;
end;
procedure TForm1.FormShow(Sender: TObject);
begin
  Lerini;
end;

end.
