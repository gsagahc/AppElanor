inherited FrmAlterarControlePerdas: TFrmAlterarControlePerdas
  Top = 86
  Height = 537
  Caption = 'FrmAlterarControlePerdas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 217
    Height = 281
    inherited DBGrid1: TDBGrid
      Height = 279
      ReadOnly = False
    end
  end
  inherited Panel2: TPanel
    Height = 217
    inherited PNGBNovo: TPNGButton
      Visible = False
    end
    inherited PNGBSalvar: TPNGButton
      Visible = False
    end
    inherited ComboBoxEnroladores: TComboBox
      TabOrder = 11
    end
    object PanelMsg: TPanel
      Left = 1
      Top = 191
      Width = 1109
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Clique no item que deseja alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Visible = False
    end
  end
  object IBQConsultarLancamentos: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    BufferChunks = 1000
    CachedUpdates = False
    Left = 568
    Top = 225
  end
end
