object Form1: TForm1
  Left = 232
  Top = 103
  Width = 669
  Height = 399
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 304
    Top = 24
    Width = 329
    Height = 313
  end
  object Memo1: TMemo
    Left = 72
    Top = 112
    Width = 185
    Height = 89
    Lines.Strings = (
      'PEDIDO: DO009878'
      'CLIENTE: LIFE SURF'
      'PRODUTO: 50CI'
      'VALOR DO PEDIDO: R$ 2.400,00')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 72
    Top = 264
    Width = 201
    Height = 65
    Caption = 'Gerar Etiqueta'
    TabOrder = 1
    OnClick = Button1Click
  end
end
