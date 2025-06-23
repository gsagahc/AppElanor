inherited FrmAlterarControlePerdas: TFrmAlterarControlePerdas
  Left = 100
  Top = 91
  Width = 1064
  Height = 383
  Caption = 'Excluir lan'#231'amentos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 97
    Width = 1048
    Height = 247
    inherited DBGrid1: TDBGrid
      Width = 1046
      Height = 245
      ReadOnly = False
    end
  end
  inherited Panel2: TPanel
    Width = 1048
    Height = 97
    inherited PNGBNovo: TPNGButton
      Left = 741
      Top = 5
      Visible = False
    end
    inherited PNGImprimir: TPNGButton
      Left = 915
      Top = 5
      Visible = False
    end
    inherited PNGButton2: TPNGButton
      Left = 973
      Top = 5
    end
    inherited Label1: TLabel
      Left = 9
      Top = 16
    end
    inherited Label2: TLabel
      Visible = False
    end
    inherited Label3: TLabel
      Visible = False
    end
    inherited Label4: TLabel
      Visible = False
    end
    inherited Label5: TLabel
      Visible = False
    end
    inherited Label6: TLabel
      Visible = False
    end
    inherited Label7: TLabel
      Visible = False
    end
    inherited Label8: TLabel
      Visible = False
    end
    inherited Label9: TLabel
      Visible = False
    end
    inherited Label10: TLabel
      Visible = False
    end
    inherited PNGButton1: TPNGButton
      Left = 857
      Top = 5
    end
    inherited PNGBSalvar: TPNGButton
      Left = 799
      Top = 5
      Visible = False
    end
    inherited Label11: TLabel
      Visible = False
    end
    inherited DTPData: TDateTimePicker
      Left = 9
      Top = 32
    end
    inherited ComboBoxElastico: TComboBox
      Visible = False
    end
    inherited EditMaquina: TNumEdit
      Visible = False
    end
    inherited EditComprimento: TNumEdit
      Visible = False
    end
    inherited EditPesoBruto: TNumEdit
      Visible = False
    end
    inherited EditQuantidadeRC: TNumEdit
      Visible = False
    end
    inherited EditQuantidade: TNumEdit
      Visible = False
    end
    inherited EditPrimeira: TNumEdit
      Visible = False
    end
    inherited EditSegunda: TNumEdit
      Visible = False
    end
    inherited EditPercentual: TNumEdit
      Visible = False
    end
    inherited ComboBoxEnroladores: TComboBox
      TabOrder = 11
      Visible = False
    end
    object PanelMsg: TPanel
      Left = 1
      Top = 71
      Width = 1046
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Clique no item que deseja excluir'
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
  inherited DSPerdas: TDataSource
    AutoEdit = False
  end
  inherited CDSPerdas: TClientDataSet
    AfterScroll = CDSPerdasAfterScroll
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
