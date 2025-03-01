object FormEnroladores: TFormEnroladores
  Left = -7
  Top = 3
  Width = 1050
  Height = 423
  VertScrollBar.Position = 21
  Caption = 'Relat'#243'rio de Produ'#231#227'o dos Enroladores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRepEnroladores: TQuickRep
    Left = 68
    Top = 23
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = IBQuery1
    Description.Strings = (
      
        'This report shows how to create a master/detail report from a TQ' +
        'uery component and use multiple TQRGroups in the same report')
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = First
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object DetailBand1: TQRBand
      Left = 38
      Top = 97
      Width = 740
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      BandType = rbDetail
      object QRDBText4: TQRDBText
        Left = 6
        Top = 0
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          0.000000000000000000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery1
        DataField = 'TBPRD_NOME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 326
        Top = 2
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          862.541666666666700000
          5.291666666666667000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery1
        DataField = 'TBCP_QUANTIDADE'
        Mask = '###,##0'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 448
        Top = 1
        Width = 106
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          2.645833333333333000
          280.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery1
        DataField = 'TBCP_SEGUNDA'
        Mask = '#0.000'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 38
      Width = 740
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clSilver
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1957.916666666667000000)
      Expression = 'NOME'
      FooterBand = QRBand1
      Master = QuickRepEnroladores
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 4
        Top = 4
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          10.583333333333330000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery1
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object QRGroup2: TQRGroup
      Left = 38
      Top = 59
      Width = 740
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        100.541666666666700000
        1957.916666666667000000)
      Expression = 'orderno'
      FooterBand = QRBand2
      Master = QuickRepEnroladores
      ReprintOnNewPage = False
      object QRExpr3: TQRExpr
        Left = 16
        Top = 2
        Width = 127
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          5.291666666666667000
          336.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = #39'Data : '#39'+TBCP_DATA'
        FontSize = 10
      end
      object QRLabelQuantidade: TQRLabel
        Left = 326
        Top = 22
        Width = 56
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          862.541666666666700000
          58.208333333333330000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantidade'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabelArtigo: TQRLabel
        Left = 6
        Top = 20
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          52.916666666666670000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Artigo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabelSegunda: TQRLabel
        Left = 448
        Top = 22
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          58.208333333333330000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Segunda'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 137
      Width = 740
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clSilver
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1957.916666666667000000)
      BandType = rbGroupFooter
      object QRExprResultado: TQRExpr
        Left = 318
        Top = 2
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          841.375000000000000000
          5.291666666666667000
          187.854166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QuickRepEnroladores
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(IBQuery1.TBCP_QUANTIDADE)/COUNT'
        Mask = '###,##0'
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 54
        Top = 2
        Width = 152
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          142.875000000000000000
          5.291666666666667000
          402.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Resultado deste enrolador'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBTextMinimo: TQRDBText
        Left = 552
        Top = 2
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          5.291666666666667000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQuery1
        DataField = 'MINIMO'
        Mask = '###,##0'
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 499
        Top = 2
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1320.270833333333000000
          5.291666666666667000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#237'nimo:'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 117
      Width = 740
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = 14671839
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      BandType = rbGroupFooter
      object QRExpr1: TQRExpr
        Left = 327
        Top = 0
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          0.000000000000000000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QuickRepEnroladores
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(IBQuery1.TBCP_QUANTIDADE)'
        Mask = '###,##0'
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 291
        Top = 2
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          769.937500000000000000
          5.291666666666667000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total:'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 414
        Top = 2
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1095.375000000000000000
          5.291666666666667000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total:'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRExpr2: TQRExpr
        Left = 450
        Top = 2
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1190.625000000000000000
          5.291666666666667000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QuickRepEnroladores
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(IBQuery1.TBCP_SEGUNDA)'
        Mask = '#0.00'
        FontSize = 10
      end
      object QRExpr5: TQRExpr
        Left = 666
        Top = 2
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1762.125000000000000000
          5.291666666666667000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = QuickRepEnroladores
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 531
        Top = 2
        Width = 132
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          5.291666666666667000
          349.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantidade de artigos:'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 161
      Width = 740
      Height = 10
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        26.458333333333330000
        1957.916666666667000000)
      ParentBand = QRBand1
    end
  end
  object IBQuery1: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT B.TBCP_DATA,'
      '       B.TBCP_MAQUINA,'
      '       B.TBCP_ELASTICO ,'
      '       B.TBCP_COMPRIMENTO,'
      '       B.TBCP_PESOB,'
      '       B.TBCP_QUANTIDADERC,'
      '       B.TBCP_QUANTIDADE,'
      '       B.TBCP_PRIMEIRA,'
      '       B.TBCP_SEGUNDA,'
      '       B.TBCP_PERCENTUAL,'
      '       B.ID_CONTROLEPERDAS,'
      '       B.ID_ENROLADOR,'
      '       A.NOME,'
      '       C.tbprd_nome,'
      '     (SELECT MINIMO FROM TB_CONFIG)'
      '     AS MINIMO'
      ' FROM  tb_controle_perdas B'
      ' INNER JOIN tb_enroladores A ON A.id_enrolador = B.ID_ENROLADOR'
      ' inner JOIN tb_produtos C ON C.id_produto = B.tbcp_elastico'
      ' WHERE TBCP_DATA=:pData;'
      '')
    Left = 204
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pData'
        ParamType = ptUnknown
      end>
    object IBQuery1TBCP_DATA: TDateField
      FieldName = 'TBCP_DATA'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_DATA'
    end
    object IBQuery1TBCP_MAQUINA: TIntegerField
      FieldName = 'TBCP_MAQUINA'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_MAQUINA'
    end
    object IBQuery1TBCP_ELASTICO: TIBStringField
      FieldName = 'TBCP_ELASTICO'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_ELASTICO'
      FixedChar = True
      Size = 30
    end
    object IBQuery1TBCP_COMPRIMENTO: TIntegerField
      FieldName = 'TBCP_COMPRIMENTO'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_COMPRIMENTO'
    end
    object IBQuery1TBCP_PESOB: TFloatField
      FieldName = 'TBCP_PESOB'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_PESOB'
    end
    object IBQuery1TBCP_QUANTIDADERC: TIntegerField
      FieldName = 'TBCP_QUANTIDADERC'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_QUANTIDADERC'
    end
    object IBQuery1TBCP_QUANTIDADE: TIntegerField
      FieldName = 'TBCP_QUANTIDADE'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_QUANTIDADE'
    end
    object IBQuery1TBCP_PRIMEIRA: TFloatField
      FieldName = 'TBCP_PRIMEIRA'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_PRIMEIRA'
    end
    object IBQuery1TBCP_SEGUNDA: TFloatField
      FieldName = 'TBCP_SEGUNDA'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_SEGUNDA'
    end
    object IBQuery1TBCP_PERCENTUAL: TFloatField
      FieldName = 'TBCP_PERCENTUAL'
      Origin = 'TB_CONTROLE_PERDAS.TBCP_PERCENTUAL'
    end
    object IBQuery1ID_CONTROLEPERDAS: TIntegerField
      FieldName = 'ID_CONTROLEPERDAS'
      Origin = 'TB_CONTROLE_PERDAS.ID_CONTROLEPERDAS'
      Required = True
    end
    object IBQuery1ID_ENROLADOR: TIntegerField
      FieldName = 'ID_ENROLADOR'
      Origin = 'TB_CONTROLE_PERDAS.ID_ENROLADOR'
    end
    object IBQuery1NOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_ENROLADORES.NOME'
      Required = True
      Size = 100
    end
    object IBQuery1TBPRD_NOME: TIBStringField
      FieldName = 'TBPRD_NOME'
      Origin = 'TB_PRODUTOS.TBPRD_NOME'
      Size = 60
    end
    object IBQuery1MINIMO: TIntegerField
      FieldName = 'MINIMO'
      Origin = 'TB_P_ELASTICO_GERAL.MINIMO'
    end
  end
end
