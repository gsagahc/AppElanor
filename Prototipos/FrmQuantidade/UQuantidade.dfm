object FrmQuantidade: TFrmQuantidade
  Left = 556
  Top = 272
  ActiveControl = NumEdtQuant
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Quantidade'
  ClientHeight = 93
  ClientWidth = 173
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BtnOK: TButton
    Left = 86
    Top = 48
    Width = 75
    Height = 33
    Caption = 'OK'
    TabOrder = 0
    OnClick = BtnOKClick
  end
  object NumEdtQuant: TNumEdit
    Left = 16
    Top = 16
    Width = 145
    Height = 21
    TabOrder = 1
    Text = '0'
    OnExit = NumEdtQuantExit
    Numerico = True
  end
end
