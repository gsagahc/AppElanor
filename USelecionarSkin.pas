unit USelecionarSkin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, pngextra, ExtCtrls,IniFiles;

type
  TFrmSelectSkin = class(TForm)
    Panel1: TPanel;
    PNGButton2: TPNGButton;
    Panel2: TPanel;
    FileListBox1: TFileListBox;
    procedure FormShow(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure gravarIni;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelectSkin: TFrmSelectSkin;

implementation
uses UPrincipal, uMensagens;

{$R *.dfm}

procedure TFrmSelectSkin.FormShow(Sender: TObject);
begin
  FileListBox1.Directory :='C:\AppElanor\Skins';
end;

procedure TFrmSelectSkin.PNGButton2Click(Sender: TObject);
begin
  gravarIni;
  Close;
end;

procedure TFrmSelectSkin.FileListBox1Change(Sender: TObject);
begin
  FrmPrincipal.SkinData1.SkinFile:=FileListBox1.FileName;
  
end;

procedure TFrmSelectSkin.gravarIni;
Var ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create('C:\AppElanor\Config.ini');
  try
    ArqIni.WriteString('Configuracoes', 'SKIN', FileListBox1.FileName);

  finally
    ArqIni.Free;
  end;

end;

end.
