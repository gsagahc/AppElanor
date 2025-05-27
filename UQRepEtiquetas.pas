unit UQRepEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg;  


type
  TFrmQrepEtiquetas = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabelUnidade: TQRLabel;
    QRLabelPedido: TQRLabel;
    QRLabelMensagem: TQRLabel;
    QLbRomaneio: TQRLabel;
    QRDBText10: TQRDBText;
  private
    { Private declarations }
  public
    QRQRCode:TQRImage;
    { Public declarations }
  end;

var
  FrmQrepEtiquetas: TFrmQrepEtiquetas;

implementation
Uses UImpressaoEtiquetas, UPrincipal, UMensagens;

{$R *.dfm}

end.
