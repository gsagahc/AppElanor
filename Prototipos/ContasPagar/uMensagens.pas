unit uMensagens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, pngimage;

type
  TMyButtons = (mbSim, mbNao, mbOk);

type
  TfrmMensagens = class(TForm)
    pnlIcones: TPanel;
    pnlMensagem: TPanel;
    pnlBotoes: TPanel;
    lblMensagem: TLabel;
    btnSim: TBitBtn;
    btnNao: TBitBtn;
    btnOK: TBitBtn;
    imgDeletar: TImage;
    imgErro: TImage;
    imgCuidado: TImage;
    imgQuestao: TImage;
    imgInformacao: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
     class function Mensagem(Texto: String; Tipo: Char; Botoes: array of TMyButtons): Boolean;
  end;

var
  frmMensagens: TfrmMensagens;
const
  LEFTBUTTONS : array[0..2] of integer = (258, 178, 97);
  TITULO :String = 'Mensagem';

implementation

{$R *.dfm}

{ TfrmMensagens }

class function TfrmMensagens.Mensagem(Texto: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  i: Integer;
  frm :TfrmMensagens;

begin
  frm := TfrmMensagens.Create(nil);
  try
    frm.lblMensagem.Caption := Texto;
    frm.Caption := TITULO;

    for i:=0 to Length(Botoes)-1 do
    begin
      case (Botoes[i]) of
        mbOk: begin
                frm.BtnOK.Visible := True;
                frm.BtnOK.Left := LEFTBUTTONS[i];
              end;  

        mbSim: begin
                 frm.btnSim.Visible := True;
                 frm.btnSim.Left := LEFTBUTTONS[i];
               end;

        mbNao: begin
                 frm.BtnNao.Visible := True;
                 frm.BtnNao.Left := LEFTBUTTONS[i];
               end;

        else begin
          frm.BtnOK.Visible := True;
          frm.BtnOK.Left := LEFTBUTTONS[i];
        end;  
      end;
    end;

     case (Tipo) of
      'I': frm.imgInformacao.Visible := True;
      'D': frm.imgDeletar.Visible := True;
      'Q': frm.imgQuestao.Visible := True;
      'C': frm.imgCuidado.Visible := True;
      'E': frm.imgErro.Visible := True;
      else
        frm.imgInformacao.Visible := True;
    end;

     frm.ShowModal;

    case (frm.ModalResult) of
      mrOk, mrYes : result := True;
      else
        result := False;
    end;

  finally
    if (frm<>nil) then
      FreeAndNil(frm);
  end;
end;

end.
