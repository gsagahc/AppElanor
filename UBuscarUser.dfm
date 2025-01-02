object FrmBuscarUser: TFrmBuscarUser
  Left = 267
  Top = 317
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 136
  ClientWidth = 623
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
    Width = 623
    Height = 136
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 621
      Height = 136
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
          FieldName = 'ID_USUARIO'
          Title.Caption = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBUSR_LOGIN'
          Title.Caption = 'LOGIN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBUSR_NOME'
          Title.Caption = 'NOME'
          Visible = True
        end>
    end
  end
  object IBQUser: TIBQuery
    Database = FrmPrincipal.IBDMain
    Transaction = FrmPrincipal.IBTMain
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *  FROM TB_USUARIO')
    Left = 440
    Top = 40
    object IBQUserID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'TB_USUARIO.ID_USUARIO'
      Required = True
    end
    object IBQUserTBUSR_NOME: TIBStringField
      FieldName = 'TBUSR_NOME'
      Origin = 'TB_USUARIO.TBUSR_NOME'
      Size = 60
    end
    object IBQUserTBUSR_LOGIN: TIBStringField
      FieldName = 'TBUSR_LOGIN'
      Origin = 'TB_USUARIO.TBUSR_LOGIN'
    end
  end
  object DsUser: TDataSource
    DataSet = IBQUser
    Left = 400
    Top = 40
  end
end
