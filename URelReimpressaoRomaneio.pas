unit URelReimpressaoRomaneio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPrintRomaneio, QRCtrls, jpeg, QuickRpt, ExtCtrls;

type
  TFrmPrintRomaneio1 = class(TFrmPrintRomaneio)
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrintRomaneio1: TFrmPrintRomaneio1;

implementation
Uses UReimpressaoRomaneio;
{$R *.dfm}

end.
