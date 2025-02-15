unit URelProducaoEnroladores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, jpeg, QRPrntr,  DB, DBClient, ComCtrls,
  StdCtrls, DBCtrls, IBCustomDataSet, IBQuery;

type
  TFrmRelProdEnroladores = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
     Total:Currency;
    { Public declarations }                                     
  end;

var
  FrmRelProdEnroladores: TFrmRelProdEnroladores;

implementation

uses UPrincipal, UFrmControlePerdas, Math;


{$R *.dfm}

procedure TFrmRelProdEnroladores.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if QRDBText3.DataSet.FieldByName('Total').AsInteger < QRDBText3.DataSet.FieldByName('MinimoDesejado').AsInteger then
     QRDBText3.Font.Color:=clRed
   Else
     QRDBText3.Font.Color:=clBlack;
end;

end.
