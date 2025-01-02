unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, pngextra,
  IBDatabase, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    IBQTabelas: TIBQuery;
    DsTabelas: TDataSource;
    IBQCampos: TIBQuery;
    DSCampos: TDataSource;
    IBQUtil: TIBQuery;
    DSUtil: TDataSource;
    Panel1: TPanel;
    PNGButton1: TPNGButton;
    DBGrid1: TDBGrid;
    PNGButton2: TPNGButton;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    MemoSQL: TMemo;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    PNGButton3: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    PNGButton4: TPNGButton;
    PNGButton5: TPNGButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    IBDMain: TIBDatabase;
    IBTMain: TIBTransaction;
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure MemoSQLKeyPress(Sender: TObject; var Key: Char);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Math,UPrincipal;

{$R *.dfm}

procedure TForm1.PNGButton1Click(Sender: TObject);
begin
  IBQTabelas.Close;
  IBQTabelas.Sql.Clear;
  IBQTabelas.Sql.Add('SELECT RDB$RELATION_NAME FROM RDB$RELATIONS '+
                  ' WHERE RDB$SYSTEM_FLAG = 0 '+
                  '   AND RDB$RELATION_TYPE=0 ' +
                  ' ORDER BY RDB$RELATION_NAME ');
  try
    begin
      IBQTabelas.Open;
      PNGButton2.Enabled:= True;
    end;
  except
  end;
end;

procedure TForm1.PNGButton2Click(Sender: TObject);
begin
  IBQCampos.Close;
  IBQCampos.Sql.Clear;
  IBQCampos.Sql.Add('SELECT RF.RDB$FIELD_NAME  '+
                     ' FROM RDB$RELATIONS R '+
                    ' INNER JOIN RDB$RELATION_FIELDS RF ON RF.RDB$RELATION_NAME = R.RDB$RELATION_NAME '+
                    ' WHERE R.RDB$SYSTEM_FLAG = 0 AND R.RDB$RELATION_TYPE = 0  '+
                      ' AND R.RDB$RELATION_NAME = '''+IBQTabelas.FieldByName('RDB$RELATION_NAME').AsString +'''' +
                    ' ORDER BY RF.RDB$RELATION_NAME, RF.RDB$FIELD_POSITION ');

  try
    begin
      IBQCampos.Open;
    end;
  except
  end;
end;

procedure TForm1.PNGButton3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
     MemoSQL.Lines.LoadFromFile(OpenDialog1.FileName);    
end;

procedure TForm1.MemoSQLKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TForm1.PNGButton4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    MemoSQL.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.PNGButton5Click(Sender: TObject);
begin
  If MemoSQL.Lines.Text <> EmptyStr then
  begin
    IBQUtil.Close;
    IBQUtil.Sql.Clear;
    IBQUtil.Sql.Add(MemoSQL.Lines.Text );
    try
      IBQUtil.Open;
    except
      on E: EDatabaseError do
        ShowMessage(E.Message);

    End;
  End;
end;

end.
