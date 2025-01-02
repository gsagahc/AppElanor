unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ToolWin, ComCtrls, IBDatabase, DB, criptografia, ImgList,
  pngextra, IBSQL, jpeg, ExtCtrls, IniFiles, IdBaseComponent, IdComponent,
  IdTCPServer, IdCustomHTTPServer, IdHTTPServer, IdTCPConnection,
  IdTCPClient, IdHTTP, InvokeRegistry, Rio, SOAPHTTPClient;

Type TProduto= class
     public
     Nome:String;
     Id:Integer;
     Preco:currency;
end;

Type TCliente= class
     public
     Nome:String;
     Id:Integer;
end;

Type TPedido = Class
     public
     NomeCli:String;
     Id_pedido:Integer;
     Id_produto:Integer;
     id_itenspedido:integer;
     NomeProd:String;
End;
Type TPrazos = Class
     public
     Nome:String;
     Id_prazo:Integer;
     Prazo1:TDate;
     Prazo2:TDate;
     Prazo3:TDate;
End;
Type TEstoque = Class
     Public
     Nome:String;
     Id_estoque:Integer;
     Quantidade:Integer;
     id_produto:Integer;
     Formato:String;
End;
Type TEndereco = Class
      Public
      Rua:String;
      Bairro:String;
      Cidade:String;
      Estado:String;

End;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Cadastros1: TMenuItem;
    Estoque1: TMenuItem;
    Pedidos1: TMenuItem;
    Produtos1: TMenuItem;
    IBDMain: TIBDatabase;
    IBTMain: TIBTransaction;
    Entrada1: TMenuItem;
    criptografia1: Tcriptografia;
    Usurios1: TMenuItem;
    Consultar1: TMenuItem;
    Novo1: TMenuItem;
    Consultar2: TMenuItem;
    Relatrios1: TMenuItem;
    ImageList1: TImageList;
    Clientes1: TMenuItem;
    Prazos1: TMenuItem;
    PNGButton1: TPNGButton;
    PNGButton2: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton4: TPNGButton;
    PNGButton6: TPNGButton;
    Reimprimir1: TMenuItem;
    IBSQLUTIL: TIBSQL;
    Image1: TImage;
    Saldoatual2: TMenuItem;
    Entradas1: TMenuItem;
    Porcliente1: TMenuItem;
    Geral1: TMenuItem;
    Nmerodopedido1: TMenuItem;
    ransfernciapararolo1: TMenuItem;
    PNGButton5: TPNGButton;
    PNGButton7: TPNGButton;
    Vendas1: TMenuItem;
    HTTPRIO1: THTTPRIO;
    procedure ToolButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Usuario:String;
    IdUsuario:Integer;
    IdCliente:Integer;
    IdProduto :Integer;
    NomeCliente:String;
    NomeProduto:String;
    BancoDados:String;
    Procedure  LerIni();
    Function RetornaEndereco(CEP:String): TEndereco; 

    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UGrafico;

{$R *.dfm}

procedure TFrmPrincipal.ToolButton4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text:='Login: ' + Usuario;
  If Usuario='MASTER' Then
  begin
     Usurios1.Enabled   :=True;
     PNGButton5.Enabled := True;
  end
  Else
   begin
     Usurios1.Enabled :=False;
     PNGButton5.Enabled := False;
   end;
end;

procedure TFrmPrincipal.PNGButton1Click(Sender: TObject);
Begin
  Application.Terminate;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  SendMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmPrincipal.LerIni();

begin

end;

function TFrmPrincipal.RetornaEndereco(CEP: String): TEndereco;
begin

  
end;

procedure TFrmPrincipal.PNGButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultarPedCli, FrmConsultarPedCli);
  FrmConsultarPedCli.ShowModal;
  FrmConsultarPedCli.Free;
end;

end.
