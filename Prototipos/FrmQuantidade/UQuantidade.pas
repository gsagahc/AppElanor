unit UQuantidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NumEdit;

type
  TFrmQuantidade = class(TForm)
    BtnOK: TButton;
    NumEdtQuant: TNumEdit;
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
  FrmQuantidade: TFrmQuantidade;

implementation

uses Math;

{$R *.dfm}

procedure TFrmQuantidade.BtnOKClick(Sender: TObject);
begin
  if NumEdtQuant.Text=EmptyStr then
    NumEdtQuant.Text:='0';
  Close;
end;

procedure TFrmQuantidade.FormShow(Sender: TObject);
begin
  NumEdtQuant.SetFocus;
end;

procedure TFrmQuantidade.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key =#27) Or (key = #13) then
  Begin
    If NumEdtQuant.Text = EmptyStr Then
      NumEdtQuant.Text:='0';
    Close;
  End;

end;

procedure TFrmQuantidade.NumEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key =#27) Or (key = #13) then
  Begin
    If NumEdtQuant.Text = EmptyStr Then
      NumEdtQuant.Text:='0';
    Close;
  End;
 
end;

procedure TFrmQuantidade.NumEdtQuantExit(Sender: TObject);
begin
   If NumEdtQuant.Text = EmptyStr Then
      NumEdtQuant.Text:='0';
end;

end.
