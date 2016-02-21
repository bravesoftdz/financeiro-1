inherited frmLancamentos: TfrmLancamentos
  AutoSize = False
  Caption = 'Lan'#231'amentos'
  ClientHeight = 640
  ClientWidth = 1348
  Position = poDesigned
  OnActivate = FormActivate
  ExplicitWidth = 1364
  ExplicitHeight = 679
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Top = 626
    Width = 1348
    ExplicitTop = 626
    ExplicitWidth = 1348
  end
  inherited pnlBotoes: TPanel
    Width = 1288
    ExplicitWidth = 1288
    inherited btnExcluir: TPngSpeedButton
      OnClick = btnExcluirClick
    end
  end
  inherited pnlCentro: TPanel
    Width = 1348
    Height = 542
    ExplicitWidth = 1348
    ExplicitHeight = 542
    object ID: TLabel
      Left = 30
      Top = 6
      Width = 49
      Height = 20
      Caption = 'C'#243'digo'
    end
    object lblConta: TLabel
      Left = 278
      Top = 126
      Width = 39
      Height = 20
      Caption = 'Conta'
    end
    object lblCategoria: TLabel
      Left = 278
      Top = 186
      Width = 65
      Height = 20
      Caption = 'Categoria'
    end
    object lblTipo: TLabel
      Left = 30
      Top = 186
      Width = 30
      Height = 20
      Caption = 'Tipo'
    end
    object lblData: TLabel
      Left = 30
      Top = 66
      Width = 32
      Height = 20
      Caption = 'Data'
    end
    object lblValor: TLabel
      Left = 30
      Top = 246
      Width = 34
      Height = 20
      Caption = 'Valor'
    end
    object lblDescricao: TLabel
      Left = 29
      Top = 306
      Width = 65
      Height = 20
      Caption = 'Descri'#231#227'o'
    end
    object lblUnidade: TLabel
      Left = 30
      Top = 126
      Width = 56
      Height = 20
      Caption = 'Unidade'
    end
    object edtID: TEdit
      Left = 30
      Top = 32
      Width = 121
      Height = 28
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object cbbTipo: TComboBox
      Left = 30
      Top = 212
      Width = 187
      Height = 28
      Style = csOwnerDrawFixed
      DropDownCount = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 22
      ParentFont = False
      TabOrder = 4
      Items.Strings = (
        'Cr'#233'dito'
        'D'#233'bito')
    end
    object edtDescricao: TEdit
      Left = 29
      Top = 332
      Width = 436
      Height = 28
      TabOrder = 7
    end
    object edtValor: TEdit
      Left = 29
      Top = 272
      Width = 187
      Height = 28
      TabOrder = 6
    end
    object grdLancamentos: TDBGrid
      AlignWithMargins = True
      Left = 30
      Top = 394
      Width = 1315
      Height = 145
      Margins.Left = 30
      Align = alBottom
      DataSource = dsGirdLancamentos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 8
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = grdLancamentosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'Cod.'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CONTAS'
          Title.Alignment = taCenter
          Title.Caption = 'ID Conta'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'Conta'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CATEGORIA'
          Title.Alignment = taCenter
          Title.Caption = 'Categoria'
          Width = 193
          Visible = True
        end>
    end
    object cbbCategoria: TDBLookupComboBox
      Left = 278
      Top = 212
      Width = 187
      Height = 28
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = dsCategoria
      TabOrder = 5
    end
    object cbbContas: TDBLookupComboBox
      Left = 278
      Top = 152
      Width = 187
      Height = 28
      KeyField = 'ID_CONTAS'
      ListField = 'DESCRICAO'
      ListSource = dsContas
      TabOrder = 3
    end
    object cbbUnidade: TDBLookupComboBox
      Left = 30
      Top = 152
      Width = 187
      Height = 28
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsUnidade
      TabOrder = 2
      OnClick = cbbUnidadeClick
      OnCloseUp = cbbUnidadeCloseUp
      OnKeyPress = cbbUnidadeKeyPress
    end
    object dtData: TDateTimePicker
      Left = 30
      Top = 92
      Width = 186
      Height = 28
      Date = 42400.780767291670000000
      Time = 42400.780767291670000000
      TabOrder = 1
    end
  end
  inherited pnlTitulo: TPanel
    Width = 1348
    ExplicitWidth = 1348
  end
  object qryLancamentos: TADQuery
    Connection = dmPrincipal.Conexao
    Left = 512
  end
  object qryContas: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT ID AS ID_CONTAS,'
      '       DESCRICAO,'
      '       STATUS'
      'FROM FIN_CONTAS '
      'WHERE ID_UNIDADE = :ID_UNIDADE AND'
      '      STATUS = '#39'1'#39';')
    Left = 328
    Top = 208
    ParamData = <
      item
        Name = 'ID_UNIDADE'
        ParamType = ptInput
      end>
    object qryContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object qryContasSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object qryContasID_CONTAS: TIntegerField
      FieldName = 'ID_CONTAS'
      Origin = 'ID'
      Required = True
    end
  end
  object qryCategoria: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT ID,'
      '       DESCRICAO'
      'FROM FIN_CATEGORIA;')
    Left = 352
    Top = 264
    object qryCategoriaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCategoriaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
  end
  object qryGridLancamentos: TADQuery
    Active = True
    AfterScroll = qryGridLancamentosAfterScroll
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT LANC.ID,'
      '       LANC.DESCRICAO,'
      '       LANC.ID_CATEGORIA,'
      '       CAT.DESCRICAO AS CATEGORIA,'
      '       LANC.ID_CONTAS,'
      '       CON.DESCRICAO AS CONTA,'
      '       LANC.VALOR,'
      '       LANC.DATA,'
      '       LANC.ID_UNIDADE,'
      '       CASE'
      '       WHEN LANC.TIPO = '#39'C'#39' THEN '#39'Cr'#233'dito'#39
      '       WHEN LANC.TIPO = '#39'D'#39' THEN '#39'D'#233'bito'#39
      '       ELSE '#39'INVALIDO'#39
      '       END AS Tipo,'
      '       CASE'
      '       WHEN LANC.TIPO = '#39'C'#39' THEN 0'
      '       WHEN LANC.TIPO = '#39'D'#39' THEN 1'
      '       ELSE '#39'INVALIDO'#39
      '       END AS cbbTipo'
      'FROM FIN_LANCAMENTOS LANC'
      'JOIN FIN_CATEGORIA CAT ON (CAT.ID = LANC.ID_CATEGORIA)'
      'JOIN FIN_CONTAS CON ON (CON.ID = LANC.ID_CONTAS)'
      'JOIN SYS_UNIDADE UN ON (UN.ID = LANC.ID_UNIDADE)'
      ''
      ''
      ''
      ''
      '')
    Left = 376
    Top = 536
    object qryGridLancamentosID: TIntegerField
      Alignment = taCenter
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGridLancamentosDESCRICAO: TStringField
      Alignment = taCenter
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object qryGridLancamentosCATEGORIA: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORIA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryGridLancamentosID_CONTAS: TIntegerField
      Alignment = taCenter
      FieldName = 'ID_CONTAS'
      Origin = 'ID_CONTAS'
      Required = True
    end
    object qryGridLancamentosCONTA: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'CONTA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryGridLancamentosVALOR: TBCDField
      Alignment = taCenter
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryGridLancamentosDATA: TSQLTimeStampField
      Alignment = taCenter
      FieldName = 'DATA'
      Origin = '"DATA"'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qryGridLancamentosTIPO: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object qryGridLancamentosID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Origin = 'ID_UNIDADE'
      Required = True
    end
    object qryGridLancamentosID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
      Required = True
    end
    object qryGridLancamentosCBBTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CBBTIPO'
      Origin = 'CBBTIPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
  end
  object dsGirdLancamentos: TDataSource
    DataSet = qryGridLancamentos
    Left = 496
    Top = 536
  end
  object dsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 416
    Top = 264
  end
  object dsContas: TDataSource
    DataSet = qryContas
    Left = 384
    Top = 208
  end
  object dsLancamentos: TDataSource
    DataSet = qryLancamentos
    Left = 592
  end
  object dsUnidade: TDataSource
    DataSet = qryUnidade
    Left = 144
    Top = 208
  end
  object qryUnidade: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT UN.ID,'
      '       UN.NOME'
      'FROM SYS_UNIDADE UN;')
    Left = 88
    Top = 208
    object qryUnidadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUnidadeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
  end
end
