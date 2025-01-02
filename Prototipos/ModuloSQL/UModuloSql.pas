unit UModuloSql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, pngextra,
  IBDatabase, StdCtrls, ExtCtrls;

type
  TFormConsultaSQL = class(TForm)
    IBDMain: TIBDatabase;
    IBTMain: TIBTransaction;
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
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGButton5: TPNGButton;
    PNGButton6: TPNGButton;
    PNGButton8: TPNGButton;
    PNGButton7: TPNGButton;
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure MemoSQLKeyPress(Sender: TObject; var Key: Char);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton8Click(Sender: TObject);
    procedure PNGButton7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaSQL: TFormConsultaSQL;

implementation

uses Math, UMensagens;

{$R *.dfm}

procedure TFormConsultaSQL.PNGButton1Click(Sender: TObject);
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

procedure TFormConsultaSQL.PNGButton2Click(Sender: TObject);
begin
  IBQCampos.Close;
  IBQCampos.Sql.Clear;
  IBQCampos.Sql.Add('SELECT RF.RDB$FIELD_NAME  '+
                     ' FROM RDB$RELATIONS R '+
                    ' INNER JOIN RDB$RELATION_FIELDS RF ON RF.RDB$RELATION_NAME = R.RDB$RELATION_NAME '+
                    ' WHERE R.RDB$SYSTEM_FLAG = 0 AND R.RDB$RELATION_TYPE = 0  '+
                      ' AND R.RDB$RELATION_NAME = '''+Trim(IBQTabelas.FieldByName('RDB$RELATION_NAME').AsString) +'''' +
                    ' ORDER BY RF.RDB$RELATION_NAME, RF.RDB$FIELD_POSITION ');

  try
    begin
      IBQCampos.Open;
    end;
  except
  end;
end;

procedure TFormConsultaSQL.PNGButton3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
     MemoSQL.Lines.LoadFromFile(OpenDialog1.FileName);    
end;

procedure TFormConsultaSQL.MemoSQLKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFormConsultaSQL.PNGButton4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    MemoSQL.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TFormConsultaSQL.PNGButton5Click(Sender: TObject);
begin

  If MemoSQL.Lines.Text <> EmptyStr then
    If (Pos('UPDATE', MemoSQL.Lines.Text)>0) OR (Pos('ALTER', MemoSQL.Lines.Text)>0) then
       tFrmMensagens.Mensagem('NÃO SÃO PERMITIDOS OS COMANDOS UPDATE OU ALTER','E',[mbOK])
    else
    begin
      IBQUtil.Close;
      IBQUtil.Sql.Clear;
      IBQUtil.Sql.Add(MemoSQL.Lines.Text );
      try
        IBQUtil.Open;
      except
        on E: EDatabaseError do
          tFrmMensagens.Mensagem('SQL contém erros, consulta retornou erro com seguinte mensagem: " '+ E.Message +' "','E',[mbOK]);

      End;
    End;
end;

procedure TFormConsultaSQL.PNGButton6Click(Sender: TObject);
begin
  Close;
end;

procedure TFormConsultaSQL.PNGButton8Click(Sender: TObject);
begin
  If IBQUtil.Active Then
    IBQUtil.First;
end;

procedure TFormConsultaSQL.PNGButton7Click(Sender: TObject);
begin
  If IBQUtil.Active Then
    IBQUtil.Last;
end;

procedure TFormConsultaSQL.DBGrid1DblClick(Sender: TObject);
begin
  if IBQTabelas.Active then
    MemoSQL.Lines.Add(Trim(IBQTabelas.FieldByName('RDB$RELATION_NAME').AsString));
end;

procedure TFormConsultaSQL.DBGrid2DblClick(Sender: TObject);
begin
    if IBQCampos.Active then
    Begin
      With MemoSQL do
        SelStart := Perform(EM_LINEINDEX, EM_LINEINDEX, 0);
      MemoSQL.Lines.Add(Trim(DBGrid2.Columns.Items[DBGrid2.SelectedIndex].Field.Text));
    end;
end;

end.
