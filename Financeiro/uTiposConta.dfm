inherited frmTiposConta: TfrmTiposConta
  AutoSize = False
  Caption = 'Tipos de Conta'
  ClientHeight = 400
  ClientWidth = 556
  OnActivate = FormActivate
  ExplicitWidth = 572
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Top = 386
    Width = 556
    ExplicitTop = 386
    ExplicitWidth = 556
  end
  inherited pnlBotoes: TPanel
    Width = 496
    ExplicitWidth = 496
    inherited btnExcluir: TPngSpeedButton
      OnClick = btnExcluirClick
    end
  end
  inherited pnlCentro: TPanel
    Width = 556
    Height = 302
    ExplicitWidth = 556
    ExplicitHeight = 302
    object lblID: TLabel
      Left = 30
      Top = 16
      Width = 49
      Height = 20
      Caption = 'C'#243'digo'
    end
    object lblDescricao: TLabel
      Left = 30
      Top = 76
      Width = 65
      Height = 20
      Caption = 'Descri'#231#227'o'
    end
    object edtID: TEdit
      Left = 30
      Top = 42
      Width = 121
      Height = 28
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 30
      Top = 102
      Width = 259
      Height = 28
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 30
      Top = 179
      Width = 523
      Height = 120
      Margins.Left = 30
      Align = alBottom
      DataSource = dsGridTipoContas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 380
          Visible = True
        end>
    end
  end
  inherited pnlTitulo: TPanel
    Width = 556
    ExplicitWidth = 556
  end
  object qryTiposConta: TADQuery
    CachedUpdates = True
    Connection = dmPrincipal.Conexao
    Left = 416
  end
  object dsTiposConta: TDataSource
    DataSet = qryTiposConta
    Left = 488
  end
  object qryGridTipoContas: TADQuery
    Active = True
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT ID, DESCRICAO FROM FIN_TIPO_CONTAS;')
    Left = 496
    Top = 264
    object qryGridTipoContasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGridTipoContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
  end
  object dsGridTipoContas: TDataSource
    DataSet = qryGridTipoContas
    Left = 496
    Top = 312
  end
end
