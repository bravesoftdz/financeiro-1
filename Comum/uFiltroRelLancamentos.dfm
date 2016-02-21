inherited frmFiltroRelLancamentos: TfrmFiltroRelLancamentos
  Caption = 'Relat'#243'rio de lan'#231'amentos'
  OnCreate = FormCreate
  ExplicitWidth = 411
  ExplicitHeight = 321
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlCentro: TPanel
    object lblDataInicial: TLabel
      Left = 30
      Top = 66
      Width = 75
      Height = 20
      Caption = 'Data Inicial'
    end
    object lblDataFinal: TLabel
      Left = 30
      Top = 126
      Width = 67
      Height = 20
      Caption = 'Data Final'
    end
    object lblContas: TLabel
      Left = 30
      Top = 6
      Width = 39
      Height = 20
      Caption = 'Conta'
    end
    object dtDataInicial: TDateTimePicker
      Left = 30
      Top = 92
      Width = 186
      Height = 28
      Date = 42405.550010879640000000
      Time = 42405.550010879640000000
      TabOrder = 1
    end
    object dtDataFinal: TDateTimePicker
      Left = 30
      Top = 152
      Width = 186
      Height = 28
      Date = 42405.550042673610000000
      Time = 42405.550042673610000000
      TabOrder = 2
    end
    object cbbContas: TDBLookupComboBox
      Left = 30
      Top = 32
      Width = 145
      Height = 28
      KeyField = 'ID_CONTAS'
      ListField = 'CONTA'
      ListSource = dsContas
      TabOrder = 0
    end
  end
  inherited pnlBotoes: TPanel
    inherited btnFechar: TPngSpeedButton
      OnClick = btnFecharClick
    end
  end
  object qryContas: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT LANC.ID_CONTAS,'
      '       C.DESCRICAO AS CONTA'
      'FROM FIN_LANCAMENTOS LANC'
      'LEFT JOIN FIN_CONTAS C ON C.ID = LANC.ID_CONTAS')
    Left = 248
    Top = 104
  end
  object dsContas: TDataSource
    DataSet = qryContas
    Left = 192
    Top = 104
  end
  object qryRelLancamentos: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT LANC.ID as Codigo,'
      '       LANC.DATA,'
      '       LANC.ID_CONTAS,'
      '       LANC.DESCRICAO,'
      '       LANC.ID_CATEGORIA,'
      '       CASE LANC.TIPO'
      '       WHEN '#39'C'#39' THEN '#39'Cr'#233'dito'#39
      '       WHEN '#39'D'#39' THEN '#39'D'#233'bito'#39
      '       ELSE '#39'INCORRETO'#39
      '       END AS TIPO,'
      '       LANC.VALOR'
      'FROM FIN_LANCAMENTOS LANC'
      'LEFT JOIN FIN_CONTAS C ON C.ID = LANC.ID_CONTAS')
    Left = 333
    Top = 176
    object qryRelLancamentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ID'
      Required = True
    end
    object qryRelLancamentosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryRelLancamentosID_CONTAS: TIntegerField
      FieldName = 'ID_CONTAS'
      Origin = 'ID_CONTAS'
      Required = True
    end
    object qryRelLancamentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object qryRelLancamentosID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
      Required = True
    end
    object qryRelLancamentosTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object qryRelLancamentosVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
