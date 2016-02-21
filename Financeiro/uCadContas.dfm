inherited frmCadastroContas: TfrmCadastroContas
  Caption = 'Cadastrar contas'
  ClientHeight = 650
  ClientWidth = 947
  Position = poDesigned
  OnActivate = FormActivate
  ExplicitWidth = 963
  ExplicitHeight = 689
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Top = 636
    Width = 947
    ExplicitTop = 636
    ExplicitWidth = 947
  end
  inherited pnlBotoes: TPanel
    Width = 887
    ExplicitWidth = 887
    inherited btnExcluir: TPngSpeedButton
      OnClick = btnExcluirClick
    end
  end
  inherited pnlCentro: TPanel
    Width = 947
    Height = 552
    ExplicitWidth = 947
    ExplicitHeight = 552
    object lblID: TLabel
      Left = 30
      Top = 11
      Width = 49
      Height = 20
      Caption = 'C'#243'digo'
    end
    object lblTipoContas: TLabel
      Left = 30
      Top = 251
      Width = 71
      Height = 20
      Caption = 'Tipo conta'
    end
    object lblUnidade: TLabel
      Left = 30
      Top = 191
      Width = 56
      Height = 20
      Caption = 'Unidade'
    end
    object lblStatus: TLabel
      Left = 30
      Top = 71
      Width = 40
      Height = 20
      Caption = 'Status'
    end
    object lblDescricao: TLabel
      Left = 30
      Top = 311
      Width = 65
      Height = 20
      Caption = 'Descri'#231#227'o'
    end
    object lblEmpresa: TLabel
      Left = 30
      Top = 131
      Width = 57
      Height = 20
      Caption = 'Empresa'
    end
    object cbbTipoConta: TDBLookupComboBox
      Left = 30
      Top = 277
      Width = 211
      Height = 28
      BevelOuter = bvNone
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListFieldIndex = 2
      ListSource = dsTipoConta
      TabOrder = 4
    end
    object edtID: TEdit
      Left = 30
      Top = 37
      Width = 176
      Height = 28
      TabStop = False
      BevelOuter = bvNone
      Enabled = False
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 1
    end
    object cbbUnidade: TDBLookupComboBox
      Left = 30
      Top = 217
      Width = 211
      Height = 28
      BevelOuter = bvNone
      Color = clWhite
      KeyField = 'ID_UNIDADE'
      ListField = 'UNIDADE'
      ListFieldIndex = 2
      ListSource = dsUnidade
      TabOrder = 3
    end
    object cbbStatus: TComboBox
      Left = 30
      Top = 97
      Width = 176
      Height = 28
      AutoDropDown = True
      BevelOuter = bvNone
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 22
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'Inativa'
        'Ativa')
    end
    object edtDesc: TEdit
      Left = 30
      Top = 337
      Width = 267
      Height = 28
      MaxLength = 255
      TabOrder = 5
    end
    object gridCadContas: TDBGrid
      AlignWithMargins = True
      Left = 30
      Top = 416
      Width = 914
      Height = 133
      Margins.Left = 30
      TabStop = False
      Align = alBottom
      DataSource = dsGridCadContas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentColor = True
      TabOrder = 6
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = gridCadContasCellClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'Conta'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 350
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo da Conta'
          Width = 250
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DESCRICAO_STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'Status'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Unidade'
          Width = 250
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EMPRESA'
          Title.Alignment = taCenter
          Title.Caption = 'Empresa'
          Width = 250
          Visible = True
        end>
    end
    object cbbEmpresa: TDBLookupComboBox
      Left = 30
      Top = 157
      Width = 211
      Height = 28
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsEmpresa
      TabOrder = 2
      OnClick = cbbEmpresaClick
      OnCloseUp = cbbEmpresaCloseUp
      OnKeyPress = cbbEmpresaKeyPress
    end
  end
  inherited pnlTitulo: TPanel
    Width = 947
    ExplicitWidth = 947
  end
  object qryCadContas: TADQuery
    Connection = dmPrincipal.Conexao
    Left = 440
  end
  object dsCadContas: TDataSource
    DataSet = qryCadContas
    Left = 368
  end
  object qryTipoConta: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT ID,DESCRICAO FROM FIN_TIPO_CONTAS;')
    Left = 272
    Top = 352
    object qryTipoContaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTipoContaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
  end
  object qryUnidade: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT UN.ID AS ID_UNIDADE,'
      '       UN.NOME AS UNIDADE'
      'FROM SYS_UNIDADE UN'
      'WHERE  UN.ID_EMPRESA = :ID_EMPRESA')
    Left = 272
    Top = 296
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryUnidadeID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Origin = 'ID'
      Required = True
    end
    object qryUnidadeUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'NOME'
      Size = 255
    end
  end
  object dsTipoConta: TDataSource
    DataSet = qryTipoConta
    Left = 328
    Top = 352
  end
  object dsUnidade: TDataSource
    DataSet = qryUnidade
    Left = 328
    Top = 296
  end
  object dsGridCadContas: TDataSource
    DataSet = qryGridCadContas
    Left = 640
    Top = 560
  end
  object qryGridCadContas: TADQuery
    AutoCalcFields = False
    AfterScroll = qryGridCadContasAfterScroll
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT C.ID AS CONTA,'
      '       C.DESCRICAO AS NOME,'
      '       TC.ID AS ID_TIPO_CONTA,'
      '       TC.DESCRICAO AS TIPO,'
      '       C.STATUS,'
      '       CASE'
      '       WHEN C.STATUS = 0 THEN '#39'Inativa'#39
      '       WHEN C.STATUS = 1 THEN '#39'Ativa'#39
      '       ELSE '#39'Invalido'#39
      '       END AS DESCRICAO_STATUS,'
      '       C.ID_UNIDADE,'
      '       UN.NOME AS UNIDADE,'
      '       EM.NOME AS EMPRESA'
      'FROM FIN_CONTAS C'
      'JOIN FIN_TIPO_CONTAS TC ON (TC.ID = C.ID_TIPO_CONTAS)'
      'JOIN SYS_UNIDADE UN ON (UN.ID = C.ID_UNIDADE)'
      'JOIN SYS_EMPRESA EM ON (EM.ID = UN.ID);')
    Left = 560
    Top = 560
    object qryGridCadContasCONTA: TIntegerField
      FieldName = 'CONTA'
      Origin = 'ID'
      Required = True
    end
    object qryGridCadContasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object qryGridCadContasID_TIPO_CONTA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_TIPO_CONTA'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryGridCadContasTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryGridCadContasSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object qryGridCadContasID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Origin = 'ID_UNIDADE'
      Required = True
    end
    object qryGridCadContasUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryGridCadContasDESCRICAO_STATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_STATUS'
      Origin = 'DESCRICAO_STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object qryGridCadContasEMPRESA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object qryEmpresa: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT ID, '
      '       NOME '
      'FROM SYS_EMPRESA;')
    Left = 272
    Top = 232
    object qryEmpresaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEmpresaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 255
    end
  end
  object dsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 328
    Top = 232
  end
end
