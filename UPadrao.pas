unit UPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, Buttons, ExtCtrls,
  pngextra, IBSQL, IBUpdateSQL;

type
  TFrmPadrao = class(TForm)
    PnlBottom: TPanel;
    PnlMain: TPanel;
    PnlBotoes: TPanel;
    IBTable1: TIBTable;
    IBQuery1: TIBQuery;
    PNGBVoltar: TPNGButton;
    PNGBDeletar: TPNGButton;
    PNGBCancelar: TPNGButton;
    PNGBSalvar: TPNGButton;
    PNGBLocaliza: TPNGButton;
    PNGBNovo: TPNGButton;
    IBUpdateSQL1: TIBUpdateSQL;
    IBSQL1: TIBSQL;
    PNGBAlterar: TPNGButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure StatusBotoes ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

procedure TFrmPadrao.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPadrao.PNGButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPadrao.StatusBotoes;
Var Botao: TPNGButton;
    i:Integer;
begin
   For i:=0 To Self.ComponentCount -1 do
     Begin
       If (Self.Components[i] is TPNGButton) Then
         Begin
           Botao:=(Self.Components[i] as TPNGButton);
           Botao.Enabled := not Botao.Enabled;
         End;
     End;
end;

end.
