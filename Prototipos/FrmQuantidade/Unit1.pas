unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NumEdit;

type
  TForm1 = class(TForm)
    Button1: TButton;
    NumEdit1: TNumEdit;
    procedure Button1Click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  if NumEdit1.Text=EmptyStr then
    NumEdit1.Text:='0';  
  Close;
end;

end.
