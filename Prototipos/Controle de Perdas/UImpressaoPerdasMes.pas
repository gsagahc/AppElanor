unit UImpressaoPerdasMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UImpressaoPerdas, QRCtrls, QuickRpt, ExtCtrls;

type
  TFrmImpressaoPerdasMes = class(TFrmImpressaoPerdas)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpressaoPerdasMes: TFrmImpressaoPerdasMes;

implementation
uses UConsultarPerdas;
{$R *.dfm}

end.
