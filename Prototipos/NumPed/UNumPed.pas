unit UNumPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NumEdit, NumPed;

type
  TFrmNumPed = class(TForm)
    BtnOK: TButton;
    NumPed1: TNumPed;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure NumEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure NumEdtQuantExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNumPed: TFrmNumPed;

implementation

uses Math;

{$R *.dfm}

procedure TFrmNumPed.BtnOKClick(Sender: TObject);
begin
  if NumPed1.Text=EmptyStr then
    NumPed1.Text:='0';
  Close;
end;

procedure TFrmNumPed.FormShow(Sender: TObject);
begin
  NumPed1.SetFocus;
  NumPed1.SelStart := Length( NumPed1.Text );
end;

procedure TFrmNumPed.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key =#27) Or (key = #13) then
  Begin
    If NumPed1.Text = EmptyStr Then
      NumPed1.Text:='0';
    Close;
  End;

end;

procedure TFrmNumPed.NumEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key =#27) Or (key = #13) then
  Begin
    If NumPed1.Text = EmptyStr Then
      NumPed1.Text:='0';
    Close;
  End;
 
end;

procedure TFrmNumPed.NumEdtQuantExit(Sender: TObject);
begin
   If NumPed1.Text = EmptyStr Then
      NumPed1.Text:='0';
end;

end.
