inherited frmPesquisarCredor: TfrmPesquisarCredor
  Caption = 'Pesquisar Credor'
  ClientHeight = 404
  ClientWidth = 574
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 590
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Top = 390
    Width = 574
    ExplicitTop = 390
    ExplicitWidth = 574
  end
  inherited pnlTitulo: TPanel
    Width = 574
    ExplicitWidth = 574
  end
  inherited pnlBotoes: TPanel
    Width = 514
    ExplicitWidth = 514
    inherited btnFechar: TPngSpeedButton
      Left = 425
      OnClick = btnFecharClick
      ExplicitLeft = 425
    end
    inherited btnSelecionar: TPngSpeedButton
      OnClick = btnSelecionarClick
    end
  end
  inherited pnlCentro: TPanel
    Width = 574
    Height = 312
    ExplicitWidth = 574
    ExplicitHeight = 312
    inherited grdPesquisar: TDBGrid
      Top = 39
      Width = 514
      Height = 270
      Align = alBottom
      DataSource = dsPesquisarCredor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      OnKeyDown = grdPesquisarKeyDown
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Credor'
          Width = 300
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Visible = True
        end>
    end
    inherited edtPesquisar: TEdit
      Top = 6
      Width = 363
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alCustom
      AutoSize = False
      OnChange = edtPesquisarChange
      ExplicitTop = 6
      ExplicitWidth = 363
      ExplicitHeight = 30
    end
    object cbbFiltro: TComboBox
      AlignWithMargins = True
      Left = 399
      Top = 6
      Width = 145
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alCustom
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 24
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'Credor'
      Items.Strings = (
        'Credor'
        'C'#243'digo')
    end
  end
  object qryPesquisarCredor: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT PS.ID,'
      '       PS.NOME,'
      '       CASE PS.TIPO'
      '       WHEN '#39'F'#39' THEN '#39'F'#237'sica'#39
      '       WHEN '#39'J'#39' THEN '#39'Jur'#237'dica'#39
      '       ELSE '#39'INVALIDO'#39
      '       END AS TIPO'
      'FROM PES_PESSOAS PS')
    Left = 480
    Top = 328
    object qryPesquisarCredorID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisarCredorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 255
    end
    object qryPesquisarCredorTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
  end
  object dsPesquisarCredor: TDataSource
    DataSet = qryPesquisarCredor
    Left = 392
    Top = 328
  end
end
