unit URelReimpressaoRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, jpeg, QuickRpt, ExtCtrls;

type
  TFrmReimpressaoRomaneios = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel5: TQRLabel;
    QRImage2: TQRImage;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReimpressaoRomaneios: TFrmReimpressaoRomaneios;

implementation
uses UReimpressaoRomaneio , UPrincipal;

{$R *.dfm}

procedure TFrmReimpressaoRomaneios.FormCreate(Sender: TObject);
begin
  if not FrmPrincipal.sn_ImprimirValoresRomaneio Then
  begin
    QRLabel11.Caption :='';
    QRLabel10.Caption :='';
    QRDBText7.DataSet:=Nil;
    QRExpr2.Expression:='';
  End;                    
end;

end.
