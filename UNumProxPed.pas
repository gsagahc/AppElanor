unit UNumProxPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngextra, ExtCtrls, DB, IBCustomDataSet, IBTable, StdCtrls,
  Mask, DBCtrls;

type
  TFrmNumProxPed = class(TForm)
    IBTbNumPed: TIBTable;
    Panel1: TPanel;
    PNGButton5: TPNGButton;
    PNGButton4: TPNGButton;
    DsNumPed: TDataSource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNumProxPed: TFrmNumProxPed;

implementation
Uses UPrincipal, UMensagens;

{$R *.dfm}

procedure TFrmNumProxPed.PNGButton4Click(Sender: TObject);
begin
  IBTbNumPed.Cancel;
  If FrmPrincipal.IBTMain.InTransaction  Then
    FrmPrincipal.IBTMain.Rollback;
  Close;
 
end;

procedure TFrmNumProxPed.PNGButton5Click(Sender: TObject);
begin
  if (tFrmMensagens.Mensagem('Deleja alterar o número do próximo pedido?','Q',[mbSim, mbNao])) then
  begin
    IBTbNumPed.Post;
    FrmPrincipal.IBTMain.Commit;
  end;
  Close;
end;

procedure TFrmNumProxPed.FormShow(Sender: TObject);
begin
  IBTbNumPed.Open;
end;

end.
