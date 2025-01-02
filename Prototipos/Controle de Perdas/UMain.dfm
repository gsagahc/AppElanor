object Form1: TForm1
  Left = 132
  Top = 172
  Width = 564
  Height = 299
  Caption = 'Form1'
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
    Left = 48
    Top = 112
    Width = 137
    Height = 49
    Caption = 'Controle de perdas'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 112
    Width = 153
    Height = 49
    Caption = 'Consultar perdas'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 352
    Top = 112
    Width = 153
    Height = 49
    Caption = 'Reimpress'#227'o'
    TabOrder = 2
  end
  object IBTMain: TIBTransaction
    Active = True
    DefaultDatabase = IBDMain
    AutoStopAction = saNone
    Left = 368
    Top = 32
  end
  object IBDMain: TIBDatabase
    Connected = True
    DatabaseName = '\\DESKTOP-1VGCNQU\AppElanor\DATABASE-TESTES.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=P4o3l8l1')
    LoginPrompt = False
    DefaultTransaction = IBTMain
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 336
    Top = 32
  end
end
