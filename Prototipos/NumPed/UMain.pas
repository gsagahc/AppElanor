unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UNumPed;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmQuantidade, FrmQuantidade);
  FrmQuantidade.ShowModal;
  Edit1.Text:=FrmQuantidade.NumPed1.Text;  
end;

end.
