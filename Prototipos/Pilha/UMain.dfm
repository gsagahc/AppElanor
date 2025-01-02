object Form1: TForm1
  Left = 192
  Top = 199
  Width = 534
  Height = 385
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 416
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Idade'
    end
    object UpDown1: TUpDown
      Left = 473
      Top = 24
      Width = 15
      Height = 21
      Associate = edtIdade
      TabOrder = 0
    end
    object lbedNome: TLabeledEdit
      Left = 24
      Top = 24
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      TabOrder = 1
    end
    object edtIdade: TEdit
      Left = 416
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '0'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 74
    Width = 526
    Height = 284
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 24
      Top = 24
      Width = 233
      Height = 25
      Caption = 'Lista e exclui todos os objetos'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 256
      Top = 24
      Width = 233
      Height = 25
      Caption = 'Limpar tudo e zerar pilha'
      TabOrder = 1
      OnClick = Button2Click
    end
    object lstPilha: TListBox
      Left = 24
      Top = 56
      Width = 465
      Height = 161
      ItemHeight = 13
      TabOrder = 2
    end
    object stbAutor: TStatusBar
      Left = 1
      Top = 248
      Width = 524
      Height = 35
      Panels = <>
    end
    object btnInserir: TButton
      Left = 24
      Top = 224
      Width = 153
      Height = 25
      Caption = 'Inserir'
      TabOrder = 4
      OnClick = btnInserirClick
    end
    object btnQtde: TButton
      Left = 180
      Top = 224
      Width = 153
      Height = 25
      Caption = 'Quantidade'
      TabOrder = 5
      OnClick = btnQtdeClick
    end
    object btnRemover: TButton
      Left = 337
      Top = 224
      Width = 153
      Height = 25
      Caption = 'Remover'
      TabOrder = 6
      OnClick = btnRemoverClick
    end
  end
end
