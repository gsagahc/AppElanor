object FrmBuscaPrazos: TFrmBuscaPrazos
  Left = 267
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 201
  ClientWidth = 605
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
    Width = 605
    Height = 201
    Align = alBottom
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 603
      Height = 199
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = DSPrazos
      ParentCtl3D = False
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
          FieldName = 'TBPRZ_NOME'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRZ_PRAZO01'
          Title.Caption = 'Quantidade de dias'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRZ_PRAZO02'
          Title.Caption = 'Quantidade de dias'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRZ_PRAZO03'
          Title.Caption = 'Quantidade de dias'
          Visible = True
        end>
    end
  end
  object DSPrazos: TDataSource
    DataSet = FrmCadPrazos.IBQPrazos
    Left = 160
    Top = 56
  end
end
