object FrmNumPed: TFrmNumPed
  Left = 764
  Top = 287
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Pedido'
  ClientHeight = 89
  ClientWidth = 163
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
    Left = 78
    Top = 48
    Width = 75
    Height = 33
    Caption = 'OK'
    TabOrder = 0
    OnClick = BtnOKClick
  end
  object NumPed1: TNumPed
    Left = 16
    Top = 16
    Width = 137
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Text = 'DO'
    Numerico = False
  end
end
