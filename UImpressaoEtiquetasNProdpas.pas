unit UImpressaoEtiquetasNProdpas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, DB, DBClient;

type
  TFrmQrepEtiquetasNProd = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRImageLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabelPedido: TQRLabel;
    QRQCode: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQrepEtiquetasNProd: TFrmQrepEtiquetasNProd;

implementation
Uses UImpressaoEtiquetasNProd, UPrincipal, UMensagens;

{$R *.dfm}

end.
