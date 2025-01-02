object FrmPrincipal: TFrmPrincipal
  Left = 309
  Top = 200
  Width = 928
  Height = 480
  Caption = 'FrmPrincipal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 160
    Top = 72
    Width = 75
    Height = 49
    Caption = 'Entrada'
    TabOrder = 0
    OnClick = Button1Click
  end
  object IBTMain: TIBTransaction
    Active = True
    DefaultDatabase = IBDMain
    AutoStopAction = saNone
    Left = 72
    Top = 96
  end
  object IBDMain: TIBDatabase
    Connected = True
    DatabaseName = 'C:\AppElanor\DATABASE-PRODUCAO.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=P4o3l8l1')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 96
  end
end
