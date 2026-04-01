inherited FrmAdicionarItensRomaneio: TFrmAdicionarItensRomaneio
  Width = 687
  Caption = 'Adicionar itens no romaneio'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 679
    inherited PNGBProximo: TPNGButton
      Visible = False
    end
    inherited PNGBImprimir: TPNGButton
      Visible = False
    end
    inherited PNGBOrdenar: TPNGButton
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Width = 679
    inherited DBGrid1: TDBGrid
      Width = 677
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Pedido'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Data'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cliente'
          Width = 402
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 90
          Visible = True
        end
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'Selecao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 440
    Width = 137
    Height = 68
    Align = alNone
    inherited DBGrid2: TDBGrid
      Top = 368
      Width = 120
      Height = 66
      Align = alNone
      Visible = False
    end
  end
end
