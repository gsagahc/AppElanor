object Form1: TForm1
  Left = 463
  Top = 177
  Width = 437
  Height = 509
  BorderIcons = []
  Caption = 'C'#225'lculo de pre'#231'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 393
    Width = 429
    Height = 89
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 51
      Top = 12
      Width = 81
      Height = 65
      Caption = 'Calcular'
      TabOrder = 0
      OnClick = BitBtn1Click
      Style = bsWin31
    end
    object BitBtn2: TBitBtn
      Left = 299
      Top = 12
      Width = 81
      Height = 65
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = BitBtn2Click
      Style = bsWin31
    end
    object BitBtn3: TBitBtn
      Left = 139
      Top = 12
      Width = 75
      Height = 65
      Caption = 'Selecionar'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 219
      Top = 12
      Width = 75
      Height = 65
      Caption = 'Salvar'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 393
    Align = alClient
    TabOrder = 1
    object Produtos: TLabel
      Left = 16
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 232
      Width = 114
      Height = 13
      Caption = 'Peso de 100 Metros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 152
      Top = 232
      Width = 105
      Height = 13
      Caption = 'Pre'#231'o do fio trama'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 288
      Top = 232
      Width = 115
      Height = 13
      Caption = 'Pre'#231'o do fio urdume'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 272
      Width = 106
      Height = 13
      Caption = 'Pre'#231'o da borracha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 314
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ListBoxProdutos: TListBox
      Left = 16
      Top = 32
      Width = 393
      Height = 169
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
      OnClick = ListBoxProdutosClick
    end
    object EditPeso: TEdit
      Left = 16
      Top = 248
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnKeyPress = EditPesoKeyPress
    end
    object EditPreco150: TEdit
      Left = 152
      Top = 248
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnKeyPress = EditPreco150KeyPress
    end
    object EditPreco100: TEdit
      Left = 288
      Top = 248
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnKeyPress = EditPreco100KeyPress
    end
    object EditPrecoBorracha: TEdit
      Left = 16
      Top = 288
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      OnKeyPress = EditPrecoBorrachaKeyPress
    end
    object EditProduto: TEdit
      Left = 16
      Top = 330
      Width = 393
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object LabeledEPrecoAtual: TLabeledEdit
      Left = 16
      Top = 368
      Width = 121
      Height = 19
      Ctl3D = False
      EditLabel.Width = 70
      EditLabel.Height = 13
      EditLabel.Caption = 'Pre'#231'o atual:'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
    end
    object LabeledEPercentual: TLabeledEdit
      Left = 288
      Top = 368
      Width = 121
      Height = 19
      Ctl3D = False
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'Percentual'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 7
    end
    object LabeledEPrecoSug: TLabeledEdit
      Left = 152
      Top = 368
      Width = 121
      Height = 19
      Ctl3D = False
      EditLabel.Width = 86
      EditLabel.Height = 13
      EditLabel.Caption = 'Pre'#231'o sugerido'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 8
    end
  end
  object IBTMain: TIBTransaction
    Active = False
    DefaultDatabase = IBDMain
    AutoStopAction = saNone
    Left = 72
    Top = 96
  end
  object IBDMain: TIBDatabase
    Connected = True
    DatabaseName = '\\DESKTOP-1VGCNQU\AppElanor\DATABASE-TESTES.FDB'
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
  object IBQUtil: TIBQuery
    Database = IBDMain
    Transaction = IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    Left = 104
    Top = 96
  end
end
