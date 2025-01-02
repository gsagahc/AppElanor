object FrmPrincipal: TFrmPrincipal
  Left = 301
  Top = 299
  Width = 928
  Height = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 336
    Top = 120
    Width = 121
    Height = 73
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DTPickerIni: TDateTimePicker
    Left = 248
    Top = 72
    Width = 105
    Height = 21
    Date = 44018.598535011570000000
    Time = 44018.598535011570000000
    TabOrder = 1
  end
  object DTPickerFin: TDateTimePicker
    Left = 416
    Top = 72
    Width = 105
    Height = 21
    Date = 44018.598576215280000000
    Time = 44018.598576215280000000
    TabOrder = 2
  end
  object IBTMain: TIBTransaction
    Active = True
    DefaultDatabase = IBDMain
    AutoStopAction = saNone
    Left = 72
    Top = 96
  end
  object IBDMain: TIBDatabase
    Connected = True
    DatabaseName = 'C:\AppElanor\DATABASE-PRODUCAO.FDB'
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
  object IBQuery1: TIBQuery
    Database = IBDMain
    Transaction = IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    Left = 72
    Top = 168
  end
  object IBQPedidosDia: TIBQuery
    Database = IBDMain
    Transaction = IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT    TB_PEDIDOS.ID_PEDIDO,'
      '          TBPED_DATA,'
      '          TBPED_VALTOTAL,'
      '           TBPED_NUMPED,'
      '           TBPED_CANCELADO'
      ''
      'FROM TB_PEDIDOS'
      'INNER JOIN TB_PRAZOS'
      'ON (TB_PRAZOS.ID_PRAZO=TB_PEDIDOS.ID_PRAZO)'
      'INNER JOIN TB_USUARIO'
      'ON TB_USUARIO.ID_USUARIO=TB_PEDIDOS.ID_USUARIO'
      'WHERE TBPED_DATA BETWEEN :pDataIni AND :pDataFin'
      'ORDER BY  TBPED_DATA'
      '')
    Left = 72
    Top = 137
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
      end>
    object IBQPedidosDiaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Origin = 'TB_PEDIDOS.ID_PEDIDO'
      Required = True
    end
    object IBQPedidosDiaTBPED_DATA: TDateField
      FieldName = 'TBPED_DATA'
      Origin = 'TB_PEDIDOS.TBPED_DATA'
    end
    object IBQPedidosDiaTBPED_VALTOTAL: TIBBCDField
      FieldName = 'TBPED_VALTOTAL'
      Origin = 'TB_PEDIDOS.TBPED_VALTOTAL'
      Precision = 18
      Size = 3
    end
    object IBQPedidosDiaTBPED_NUMPED: TIBStringField
      FieldName = 'TBPED_NUMPED'
      Origin = 'TB_PEDIDOS.TBPED_NUMPED'
      Size = 10
    end
    object IBQPedidosDiaTBPED_CANCELADO: TIBStringField
      FieldName = 'TBPED_CANCELADO'
      Origin = 'TB_PEDIDOS.TBPED_CANCELADO'
      FixedChar = True
      Size = 1
    end
  end
  object CDSPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 168
    object CDSPedidosDIA: TDateField
      FieldName = 'DIA'
    end
    object CDSPedidosVALDIA: TCurrencyField
      FieldName = 'VALDIA'
    end
  end
  object DSPedidos: TDataSource
    DataSet = CDSPedidos
    Left = 232
    Top = 168
  end
end
