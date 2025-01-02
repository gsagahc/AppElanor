unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1Exit(Sender: TObject);
var
  n: integer;
  blz: boolean;
begin
  {
  blz := False;
  for n := 1 to Length(TEdit(Sender).Text) do
    if TEdit(Sender).Text[n] = ' ' then
    begin
      blz := True;
      Break;
    end;

  if not blz then
  begin
    ShowMessage(' Preencher com nome completo! ');
    TEdit(Sender).SetFocus;
  end;}
  if (Pos(' ',Edit1.Text) =0) Or (Pos(' ', Edit1.Text) = Length(Edit1.Text))   then
  begin
    ShowMessage(' Preencher com nome completo! ');
    TEdit(Sender).SetFocus;
  end;

end;

end.
