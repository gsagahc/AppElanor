unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
Uses UPedido;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmImprePedidos,FrmImprePedidos);
  FrmImprePedidos.CDsPedido.CreateDataSet;
  FrmImprePedidos.CDsPedido.Append;
  FrmImprePedidos.CDsPedidoTEXTOVIA.Text := 'Primeira Via: Cliente';
  FrmImprePedidos.CDsPedido.Append;
  FrmImprePedidos.CDsPedidoTEXTOVIA.Text := 'Segunda Via: Elanor';
  FrmImprePedidos.CDsPedido.Post;
  FrmImprePedidos.QuickRepEmpresa.PreviewModal;
  FrmImprePedidos.Free;
end;

end.
