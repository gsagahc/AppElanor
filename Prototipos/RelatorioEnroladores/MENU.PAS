{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 2.0 for Delphi 1.0/2.0/3.0                  ::
  ::                                                         ::
  :: Example reports project                                 ::
  ::                                                         ::
  :: Copyright (c) 1997 QuSoft AS                            ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.no   mail: support@qusoft.no     ::
  ::                             fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }

unit Menu;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Quickrpt,   ExtCtrls, qrextra,  IBCustomDataSet, IBQuery, IBDatabase,
  DB;

type
  TMainForm = class(TForm)
    Preview: TButton;
    Print: TButton;
    Exit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    CompositeReport: TQuickRep;
    QRCompositeReport1: TQRCompositeReport;
    Description: TMemo;
    SQLMasterDetail: TRadioButton;
    procedure PreviewClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
  private
    FReport : TQuickRep;
    procedure SetReport(Value : TQuickRep);
  public
    property Report : TQuickRep read FReport write SetReport;
  end;

var
  MainForm: TMainForm;

implementation
Uses Manygrp, URelatorioEnroladores;
{$R *.dfm}

procedure TMainForm.SetReport(Value : TQuickRep);
begin
  FReport:=Value;
  Description.Lines.Assign(Report.Description);
end;

procedure TMainForm.PreviewClick(Sender: TObject);
begin
  Application.CreateForm(TManyGrpForm, ManyGrpForm);

  ManyGrpForm.QuickRep.Preview;

end;

procedure TMainForm.PrintClick(Sender: TObject);
var sData:String;
begin
  sData:='24/02/2025';
  Application.CreateForm(TFormEnroladores, FormEnroladores);
  FormEnroladores.IBQuery1.Close;
  FormEnroladores.IBQuery1.ParamByName('pData').AsDate:= StrToDate(sData);
  FormEnroladores.IBQuery1.Open;
  FormEnroladores.QuickRep.Preview;
end;

procedure TMainForm.ExitClick(Sender: TObject);
begin
  Close;
end;

end.
