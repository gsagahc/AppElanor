inherited FrmReimpressaoRomaneio: TFrmReimpressaoRomaneio
  Left = 481
  Top = 113
  Width = 787
  Height = 496
  Caption = 'Gerenciamento de romaneios'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 771
    Height = 81
    inherited PNGBCarregar: TPNGButton
      Left = 338
      Top = 8
    end
    inherited PNGBProximo: TPNGButton
      Left = 400
      Top = 8
      Visible = False
    end
    inherited PNGBImprimir: TPNGButton
      Left = 525
      Top = 8
    end
    inherited PNGBVoltar: TPNGButton
      Left = 589
      Top = 8
    end
    inherited PNGBOrdenar: TPNGButton
      Left = 462
      Top = 8
    end
    inherited DTPickerIni: TDateTimePicker
      Width = 129
    end
    inherited DTPickerFin: TDateTimePicker
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 81
    Width = 771
    Height = 376
    Visible = False
    inherited DBGrid1: TDBGrid
      Width = 769
      Height = 374
      Visible = False
    end
  end
  inherited Panel3: TPanel
    Top = 81
    Width = 771
    Height = 376
    Visible = True
    inherited DBGrid2: TDBGrid
      Width = 769
      Height = 374
      PopupMenu = PopupMenu1
      Columns = <
        item
          Expanded = False
          FieldName = 'Ordem'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Imagem'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pedido'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cliente'
          ReadOnly = True
          Width = 332
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quant'
          Title.Caption = 'Quantidade de caixas'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Num'
          Title.Caption = 'N'#250'meros'
          Visible = True
        end>
    end
  end
  inherited CDSPedidos: TClientDataSet
    Left = 128
    Top = 256
  end
  inherited DSPedidos: TDataSource
    Left = 56
    Top = 272
  end
  inherited DSRomaneio: TDataSource
    Left = 168
    Top = 248
  end
  inherited IBQPedidos: TIBQuery
    Left = 32
    Top = 168
  end
  inherited ImageList1: TImageList
    Left = 176
    Top = 192
  end
  inherited CDSRomaneio: TClientDataSet
    Left = 96
    Top = 248
    inherited CDSRomaneioOrdem: TIntegerField
      OnChange = CDSRomaneioOrdemChange
    end
    object CDSRomaneioIdItemRomaneio: TIntegerField
      FieldName = 'IdItemRomaneio'
    end
  end
  inherited IBQRomaneio: TIBQuery
    Left = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 328
    Top = 153
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
  object IBSQL1: TIBSQL
    Database = FrmPrincipal.IBDMain
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM TB_ITENS_ROMANEIO WHERE ID_ITENS=:pITENS')
    Transaction = FrmPrincipal.IBTMain
    Left = 120
    Top = 177
  end
  object IBQueryUtil: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    Left = 64
    Top = 201
  end
end
