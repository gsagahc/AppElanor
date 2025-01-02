inherited FrmConsultarPedProduto: TFrmConsultarPedProduto
  Left = 403
  Top = 176
  Caption = 'Consultar pedidos por produto'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GroupBox1: TGroupBox
      Left = 319
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 18
      Width = 297
      Height = 65
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object EdtProdutos: TEdit
        Left = 8
        Top = 32
        Width = 281
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  inherited IBQPedidos: TIBQuery
    SQL.Strings = (
      'SELECT    TB_PEDIDOS.ID_PEDIDO,'
      '          TBPED_DATA,'
      '          TB_PEDIDOS.id_cliente,'
      '          TB_PEDIDOS.TBPED_NOME,'
      '          TBPED_ENDERECO,'
      '          TBPED_CIDADE,'
      '          TBPED_ESTADO,'
      '          TBPED_TELEFONE,'
      '          TB_PEDIDOS.ID_PRAZO,'
      '          TBPED_VALTOTAL,'
      '          TBPED_VENC01,'
      '          TBPED_VENC02,'
      '          TBPED_VENC03,'
      '          TB_PEDIDOS.ID_USUARIO,'
      '          TBPED_BAIRRO,'
      '          TBPED_CNPJ,'
      '           TB_PRAZOS.TBPRZ_NOME,'
      '           TBPED_NUMPED,'
      '           TB_USUARIO.TBUSR_NOME,'
      '           TBPED_CANCELADO,'
      '           TBPED_MOTIVOCANCEL'
      ''
      'FROM TB_PEDIDOS'
      'INNER JOIN TB_PRAZOS'
      'ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO)'
      'INNER JOIN TB_USUARIO'
      'ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO'
      'INNER JOIN TB_ITENSPEDIDO'
      'ON TB_ITENSPEDIDO.ID_PEDIDO=TB_PEDIDOS.ID_PEDIDO'
      'WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin'
      'AND TB_ITENSPEDIDO.ID_PRODUTO=:pProduto'
      'ORDER BY TBPED_NUMPED'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pDataFin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pProduto'
        ParamType = ptUnknown
      end>
  end
  object IBQProdutos: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT ID_PRODUTO,TBPRD_NOME,TBPRD_CODIGO'
      'FROM TB_PRODUTOS'
      'ORDER BY TBPRD_NOME')
    Left = 280
    Top = 105
    object IBQProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'TB_PRODUTOS.ID_PRODUTO'
      Required = True
    end
    object IBQProdutosTBPRD_NOME: TIBStringField
      FieldName = 'TBPRD_NOME'
      Origin = 'TB_PRODUTOS.TBPRD_NOME'
      Size = 60
    end
    object IBQProdutosTBPRD_CODIGO: TIBStringField
      FieldName = 'TBPRD_CODIGO'
      Origin = 'TB_PRODUTOS.TBPRD_CODIGO'
      FixedChar = True
      Size = 4
    end
  end
end
