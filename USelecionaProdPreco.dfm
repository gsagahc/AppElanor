object FrmSelProdPre: TFrmSelProdPre
  Left = 263
  Top = 223
  Width = 568
  Height = 292
  BorderIcons = []
  Caption = 'Sele'#231#227'o de produto'
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
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 560
    Height = 265
    Align = alClient
    Ctl3D = False
    DataSource = DSProdutos
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TBPRD_CODIGO'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TBPRD_NOME'
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TBPRD_PRECOVENDA'
        Title.Caption = 'Pre'#231'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object IBQPrudutos: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT ID_PRODUTO, TBPRD_CODIGO, TBPRD_NOME, TBPRD_PRECOVENDA FR' +
        'OM TB_PRODUTOS')
    Left = 136
    Top = 56
    object IBQPrudutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'TB_PRODUTOS.ID_PRODUTO'
      Required = True
    end
    object IBQPrudutosTBPRD_CODIGO: TIBStringField
      FieldName = 'TBPRD_CODIGO'
      Origin = 'TB_PRODUTOS.TBPRD_CODIGO'
      FixedChar = True
      Size = 4
    end
    object IBQPrudutosTBPRD_NOME: TIBStringField
      FieldName = 'TBPRD_NOME'
      Origin = 'TB_PRODUTOS.TBPRD_NOME'
      Size = 60
    end
    object IBQPrudutosTBPRD_PRECOVENDA: TIBBCDField
      FieldName = 'TBPRD_PRECOVENDA'
      Origin = 'TB_PRODUTOS.TBPRD_PRECOVENDA'
      currency = True
      Precision = 18
      Size = 4
    end
  end
  object DSProdutos: TDataSource
    DataSet = IBQPrudutos
    Left = 168
    Top = 56
  end
end
