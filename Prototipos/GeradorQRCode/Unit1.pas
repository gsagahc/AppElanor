unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, pngimage,HTTPApp, WinInet;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);


  private
    { Private declarations }
  public


    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


    {$R *.dfm}
  type
    TQrImage_ErrCorrLevel = (L, M, Q, H);

  const
    UrlGoogleQrCode =
      'http://chart.apis.google.com/chart?chs=%dx%d&cht=qr&chld=%s&chl=%s';
    QrImgCorrStr: array [TQrImage_ErrCorrLevel] of string = ('L', 'M', 'Q', 'H');
   procedure WinInet_HttpGet(const Url: string; Stream: TStream);
  const
    BuffSize = 1024 * 1024;
  var
    hInter: HINTERNET;
    UrlHandle: HINTERNET;
    BytesRead: DWORD;
    Buffer: Pointer;
  begin
    hInter := InternetOpen('', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
    if Assigned(hInter) then
    begin
      Stream.Seek(0, 0);
      GetMem(Buffer, BuffSize);
      try
        UrlHandle := InternetOpenUrl(hInter, PChar(Url), nil, 0,
          INTERNET_FLAG_RELOAD, 0);
        if Assigned(UrlHandle) then
        begin
          repeat
            InternetReadFile(UrlHandle, Buffer, BuffSize, BytesRead);
            if BytesRead > 0 then
              Stream.WriteBuffer(Buffer^, BytesRead);
          until BytesRead = 0;
          InternetCloseHandle(UrlHandle);
        end;
      finally
        FreeMem(Buffer);
      end;
      InternetCloseHandle(hInter);
    end
  end;

procedure GetQrCode(Width, Height: Word;
  Correction_Level: TQrImage_ErrCorrLevel; const Data: string;
  StreamImage: TMemoryStream);
Var
  EncodedURL: string;
begin
  EncodedURL := Format(UrlGoogleQrCode,
    [Width, Height, QrImgCorrStr[Correction_Level], HTTPEncode(Data)]);
  WinInet_HttpGet(EncodedURL, StreamImage);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ImageStream: TMemoryStream;
  PngImage: TPNGObject;
begin
  Image1.Picture := nil;
  ImageStream := TMemoryStream.Create;
  PngImage := TPNGObject.Create;

  try
    try
      GetQrCode(200,200,
        TQrImage_ErrCorrLevel(3), Memo1.Lines.Text,
        ImageStream);
      if ImageStream.Size > 0 then
      begin
        ImageStream.Position := 0;
        PngImage.LoadFromStream(ImageStream);
        Image1.Picture.Assign(PngImage);
      end;
    except
      on E: exception do
        ShowMessage(E.Message);
    end;
  finally
    ImageStream.Free;
    PngImage.Free;
  end;
end;
end.





