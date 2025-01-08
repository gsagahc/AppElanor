inherited FrmReimpressaoRomaneio: TFrmReimpressaoRomaneio
  Left = 481
  Top = 312
  Width = 787
  Height = 496
  Caption = 'Consulta e reimpress'#227'o de romaneios'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 771
    inherited PNGBProximo: TPNGButton
      Visible = False
    end
    inherited PNGBOrdenar: TPNGButton
      Visible = False
    end
    inherited DTPickerIni: TDateTimePicker
      Width = 129
    end
    inherited DTPickerFin: TDateTimePicker
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Width = 771
    Height = 384
    Visible = False
    inherited DBGrid1: TDBGrid
      Width = 769
      Height = 382
      Visible = False
    end
  end
  inherited Panel3: TPanel
    Width = 771
    Height = 384
    Visible = True
    inherited DBGrid2: TDBGrid
      Width = 769
      Height = 382
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cliente'
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
    Left = 32
    Top = 136
  end
  inherited DSPedidos: TDataSource
    Left = 96
    Top = 136
  end
  inherited DSRomaneio: TDataSource
    Left = 128
    Top = 136
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
    Left = 64
    Top = 136
  end
  inherited IBQRomaneio: TIBQuery
    Left = 80
    Top = 177
  end
end
