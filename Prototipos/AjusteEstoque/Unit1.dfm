object Form1: TForm1
  Left = 369
  Top = 153
  Width = 652
  Height = 362
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 216
    Top = 112
    Width = 169
    Height = 57
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\AppElanor\DATABASE-PRODUCAO.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=P4o3l8l1@@')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 152
    Top = 16
  end
  object IBQueryProdutos: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM                              TB_ESTOQUE'
      '                            WHERE  TBES_FORMATO<>'#39'ENFESTADO'#39' '
      '                               AND  TBES_FORMATO<>'#39'CARRETEL'#39)
    Left = 112
    Top = 104
    object IBQueryProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'TB_ESTOQUE.ID_PRODUTO'
    end
    object IBQueryProdutosTBES_QUANTI: TIBBCDField
      FieldName = 'TBES_QUANTI'
      Origin = 'TB_ESTOQUE.TBES_QUANTI'
      Precision = 18
      Size = 2
    end
    object IBQueryProdutosTBES_FORMATO: TIBStringField
      FieldName = 'TBES_FORMATO'
      Origin = 'TB_ESTOQUE.TBES_FORMATO'
      FixedChar = True
      Size = 16
    end
    object IBQueryProdutosTBES_TAMANHO: TIBBCDField
      FieldName = 'TBES_TAMANHO'
      Origin = 'TB_ESTOQUE.TBES_TAMANHO'
      Precision = 9
      Size = 3
    end
    object IBQueryProdutosID_ESTOQUE: TIntegerField
      FieldName = 'ID_ESTOQUE'
      Origin = 'TB_ESTOQUE.ID_ESTOQUE'
      Required = True
    end
  end
  object IBQueryUtil: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 104
    Top = 64
  end
  object IBTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 184
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = IBQueryProdutos
    Left = 128
    Top = 160
  end
  object IBTableProdutos: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_ESTOQUE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'TBES_QUANTI'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'TBES_FORMATO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 16
      end
      item
        Name = 'TBES_TAMANHO'
        DataType = ftBCD
        Precision = 9
        Size = 3
      end>
    Filter = 'TBES_FORMATO<>'#39'ROLO'#39'  AND TBES_FORMATO<>'#39'CARRETEL'#39
    IndexDefs = <
      item
        Name = 'PK_TB_ESTOQUE'
        Fields = 'ID_ESTOQUE'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TB_ESTOQUE'
    Left = 160
    Top = 80
    object IBTableProdutosID_ESTOQUE: TIntegerField
      FieldName = 'ID_ESTOQUE'
    end
    object IBTableProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object IBTableProdutosTBES_QUANTI: TIBBCDField
      FieldName = 'TBES_QUANTI'
      Precision = 18
      Size = 2
    end
    object IBTableProdutosTBES_FORMATO: TIBStringField
      FieldName = 'TBES_FORMATO'
      Size = 16
    end
    object IBTableProdutosTBES_TAMANHO: TIBBCDField
      FieldName = 'TBES_TAMANHO'
      Precision = 9
      Size = 3
    end
  end
end
