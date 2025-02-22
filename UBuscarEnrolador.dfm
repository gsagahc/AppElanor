object FrmBuscarEnrolador: TFrmBuscarEnrolador
  Left = 267
  Top = 329
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 136
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 693
    Height = 136
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 33
      Width = 691
      Height = 102
      Align = alClient
      Ctl3D = False
      DataSource = DsUser
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines]
      ParentCtl3D = False
      ReadOnly = True
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
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 691
      Height = 32
      Align = alTop
      TabOrder = 1
      object CheckBox1: TCheckBox
        Left = 104
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Exibir inativos'
        TabOrder = 0
      end
    end
  end
  object IBQEnrolador: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *  FROM TB_ENROLADORES')
    Left = 440
    Top = 40
    object IBQEnroladorNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_ENROLADORES.NOME'
      Required = True
      Size = 100
    end
    object IBQEnroladorCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'TB_ENROLADORES.CPF'
      Required = True
      Size = 11
    end
    object IBQEnroladorSN_ATIVO: TIBStringField
      FieldName = 'SN_ATIVO'
      Origin = 'TB_ENROLADORES.SN_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQEnroladorID_ENROLADOR: TIntegerField
      FieldName = 'ID_ENROLADOR'
      Origin = 'TB_ENROLADORES.ID_ENROLADOR'
      Required = True
    end
  end
  object DsUser: TDataSource
    DataSet = IBQEnrolador
    Left = 400
    Top = 40
  end
end
