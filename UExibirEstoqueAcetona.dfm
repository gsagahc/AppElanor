object FormExibirEstoqueAcetona: TFormExibirEstoqueAcetona
  Left = 426
  Top = 282
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Estoque atual de acetona'
  ClientHeight = 88
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 88
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 100
      Height = 16
      Caption = 'Estoque atual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 232
      Top = 40
      Width = 39
      Height = 16
      Caption = 'Litros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 120
      Top = 36
      Width = 105
      Height = 24
      DataField = 'QUANTIDADE'
      DataSource = DSEStoqueAcetona
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object IBQEstoqueAcetona: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select quantidade from TB_ESTOQUE_ACETONA')
    Left = 88
    Top = 24
  end
  object TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 88
    Top = 16
  end
  object DSEStoqueAcetona: TDataSource
    DataSet = IBQEstoqueAcetona
    Left = 144
    Top = 32
  end
end
