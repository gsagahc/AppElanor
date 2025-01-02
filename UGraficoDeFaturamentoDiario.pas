unit UGraficoDeFaturamentoDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, pngextra, ComCtrls, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, IBCustomDataSet, IBQuery, TeeProcs, TeEngine, Chart,
  Series, IBSQL, DbChart, Printers;

type
  TFrmGraficoFaturamentodia = class(TForm)
    Panel1: TPanel;
    Chart1: TChart;
    Series1: TLineSeries;
    Panel2: TPanel;
    PNGButton2: TPNGButton;
    PNGButton6: TPNGButton;
    PrintDialog1: TPrintDialog;
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    function mtdImprimeGrafico(aGrafico : TChart; aOrientation : TPrinterOrientation) : Boolean; overload;
  private


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGraficoFaturamentodia: TFrmGraficoFaturamentodia;

implementation
Uses UPrincipal,  Math, UConsultaPedDia;

{$R *.dfm}



function TFrmGraficoFaturamentodia.mtdImprimeGrafico(aGrafico: TChart;
  aOrientation: TPrinterOrientation): Boolean;
var tmpH, tmpW, tmpWMargin, tmpHMargin : Longint; { margins }
    OldOrientation : TPrinterOrientation;
begin
  Screen.Cursor := crHourGlass;
  OldOrientation := Printer.Orientation;  // <-- save paper orientation
  if aOrientation =  poLandscape  then
  begin
    Printer.Orientation := poLandscape; // <-- Force Horizontal paper
  end
  else if aOrientation =  poPortrait then
  begin
    Printer.Orientation := poPortrait; // <-- Force Horizontal paper
  end;
  try
    Printer.Refresh;
    Printer.BeginDoc;       // <-- start printer job
    try
      Printer.Title := aGrafico.Title.Text.Text;
      aGrafico.PrintResolution := 0;
      // Calcula margem orizontal
      tmpW := Printer.PageWidth;
      tmpWMargin := Round(5.0 * Printer.PageWidth / 100.0); // <-- 5% margins
      tmpW := Printer.PageWidth - 2 * tmpWMargin;  // <-- left and right margins
      tmpW := tmpW div 2;  // half height for left and right charts
      // Calcula Margem Vertical
      tmpH := Printer.PageHeight;
      tmpHMargin := Round(5.0 * tmpH / 100.0);  // <-- 5% margins
      tmpH := Printer.PageHeight - 2 * tmpHMargin;  // <-- bottom and top margins
      //
      aGrafico.PrintPartial(Rect(tmpWMargin, tmpHMargin, tmpWMargin + 2 * tmpW, tmpHMargin + tmpH));
      Printer.EndDoc; // <-- end job and print !!
    except
      on Exception do
      Begin
        Printer.Abort;
        Printer.EndDoc;
        Raise;
      end;
    end;
  finally
    Printer.Orientation := OldOrientation;  { <-- restore paper orientation }
    Screen.Cursor := crDefault; { <-- restore cursor }
  end;
end;

procedure TFrmGraficoFaturamentodia.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGraficoFaturamentodia.PNGButton6Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
  Begin
    {Chart1.MarginBottom:=7;
    Chart1.MarginLeft  :=7;
    Chart1.MarginRight :=7;
    Chart1.MarginTop   :=7;
    Chart1.PrintLandscape;}
    mtdImprimeGrafico(Chart1, poLandscape  );
  end;

end;



end.
