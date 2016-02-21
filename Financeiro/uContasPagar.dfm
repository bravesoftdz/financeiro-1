inherited frmContasPagar: TfrmContasPagar
  AutoSize = False
  Caption = 'Contas '#224' pagar'
  ClientHeight = 669
  ClientWidth = 1280
  OnActivate = FormActivate
  ExplicitWidth = 1296
  ExplicitHeight = 708
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Top = 655
    Width = 1280
    ExplicitTop = 655
    ExplicitWidth = 1280
  end
  inherited pnlBotoes: TPanel
    Width = 1220
    ExplicitWidth = 1220
    inherited btnExcluir: TPngSpeedButton
      OnClick = btnExcluirClick
    end
  end
  inherited pnlCentro: TPanel
    Width = 1280
    Height = 571
    ExplicitWidth = 1280
    ExplicitHeight = 571
    object lblID: TLabel
      Left = 30
      Top = 3
      Width = 49
      Height = 20
      Caption = 'C'#243'digo'
    end
    object lblCredor: TLabel
      Left = 31
      Top = 166
      Width = 45
      Height = 20
      Caption = 'Credor'
    end
    object lblUnidade: TLabel
      Left = 30
      Top = 112
      Width = 56
      Height = 20
      Caption = 'Unidade'
    end
    object lblDescricao: TLabel
      Left = 28
      Top = 273
      Width = 65
      Height = 20
      Caption = 'Descri'#231#227'o'
    end
    object lblValor: TLabel
      Left = 28
      Top = 219
      Width = 34
      Height = 20
      Caption = 'Valor'
    end
    object lblDataLancamento: TLabel
      Left = 31
      Top = 57
      Width = 138
      Height = 20
      Caption = 'Data de Lan'#231'amento'
    end
    object lblDataVencimento: TLabel
      Left = 233
      Top = 57
      Width = 135
      Height = 20
      Caption = 'Data de Vencimento'
    end
    object lblStatus: TLabel
      Left = 233
      Top = 3
      Width = 40
      Height = 20
      Caption = 'Status'
    end
    object lblObservacao: TLabel
      Left = 28
      Top = 328
      Width = 78
      Height = 20
      Caption = 'Observa'#231#227'o'
    end
    object edtID: TEdit
      Left = 30
      Top = 23
      Width = 186
      Height = 28
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object dtDtLancamento: TDateTimePicker
      Left = 30
      Top = 78
      Width = 186
      Height = 28
      Date = 42409.980380092600000000
      Time = 42409.980380092600000000
      Enabled = False
      TabOrder = 2
    end
    object dtDtVencimento: TDateTimePicker
      Left = 232
      Top = 78
      Width = 186
      Height = 28
      Date = 42409.980523032400000000
      Time = 42409.980523032400000000
      TabOrder = 3
    end
    object cbbUnidade: TDBLookupComboBox
      Left = 30
      Top = 132
      Width = 277
      Height = 28
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsUnidade
      TabOrder = 4
    end
    object edtValor: TEdit
      Left = 30
      Top = 239
      Width = 186
      Height = 28
      TabOrder = 8
    end
    object edtCredor: TEdit
      Left = 135
      Top = 185
      Width = 283
      Height = 28
      TabOrder = 6
    end
    object btnPesquisar: TPngBitBtn
      Left = 424
      Top = 185
      Width = 41
      Height = 28
      TabOrder = 7
      OnClick = btnPesquisarClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D494844520000001A0000001A0806000000A94A4C
        CE00000006624B474400FF00FF00FFA0BDA793000001EA4944415478DACDD53F
        48D4611CC7F1EF596259A283A9903535A8508363E01222E29FC1045DC2A14C10
        FF10852881089550A283889E82588BA0830596E8A0A44220418320828B8343B9
        DCA0452A58FAFEF23CC271FCBC9E5FDE1D3EF05AEE9EBBCFF37C9F7F0149500B
        9CE7A04B284701AEE027BE611E87B1084AC5333C4586C7F73FD08D61FCF9DFA0
        EB9846215610C43276700DC568411EE6508B5DBF4157F1C596EA098670E4D1EF
        225EA2DD865586CFCC25A8CF96EB21DE3AF4D7F23D47931D94535016B6B08852
        C732EBCCD6908E1B6237C8BF821A3062CBF0C931485B2BFAC5ACDD824B904EBD
        1169F8E523E80E56D1865E97A0495488392F7E5A36B6F1061D2E41C3B67C7A86
        F67D04E5635DCC0EEC71096AC600EEE1B38FA047184519665D826E6213EF51E3
        189284AFB8654B78E012A4ED1DEA508D0F0EFDF5CCE9D9EBC4AB930F5D82F42C
        6C2019F7F1314ADFC76276AAEEB822ECB906E9E11BB765FB8DCB6276E2982D8F
        DE7599B82BE62628B121BA36DFC3FF285A508A98B5D11FE925FA02AFF100173C
        FAEFDBD97489C7990B44099912F3EE04ED684F2ED25C3167EBB6989B5B9F077D
        8F66103A6DD45E41C9B63C557684CDE27D5BFB6A91411A322166D107C5BC3167
        0E890C8A5B4864508E98076E09F5F81BAB10AFD2E9E286621DE21514B796B0A0
        63A454601BB4A51A580000000049454E44AE426082}
    end
    object grdContasPagar: TDBGrid
      AlignWithMargins = True
      Left = 30
      Top = 428
      Width = 1220
      Height = 140
      Margins.Left = 30
      Margins.Right = 30
      TabStop = False
      Align = alBottom
      DataSource = dsGridContasPagar
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 11
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = grdContasPagarCellClick
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'COD_DEVEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Credor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREDOR'
          Title.Alignment = taCenter
          Title.Caption = 'Credor'
          Width = 300
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'COD_UN'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Unidade'
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
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_LANCAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Data de Lan'#231'amento'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_VENCIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Data de Vencimento'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'Status'
          Width = 95
          Visible = True
        end>
    end
    object edtDescricao: TEdit
      Left = 28
      Top = 294
      Width = 388
      Height = 28
      TabOrder = 9
    end
    object edtStatus: TEdit
      Left = 233
      Top = 23
      Width = 183
      Height = 28
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object memoObservacao: TMemo
      Left = 29
      Top = 349
      Width = 387
      Height = 73
      TabOrder = 10
    end
    object edtIdCredor: TEdit
      Left = 30
      Top = 185
      Width = 99
      Height = 28
      TabOrder = 5
      TextHint = '        [F2]'
      OnKeyDown = edtIdCredorKeyDown
    end
  end
  inherited pnlTitulo: TPanel
    Width = 1280
    ExplicitWidth = 1280
  end
  object qryContasPagar: TADQuery
    Connection = dmPrincipal.Conexao
    Left = 824
    Top = 88
  end
  object qryUnidade: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      '  SELECT UN.ID,'
      '         UN.NOME,'
      '         UN.ID_EMPRESA'
      '  FROM SYS_UNIDADE UN')
    Left = 399
    Top = 214
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
    object qryUnidadeID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      Required = True
    end
  end
  object qryGridContasPagar: TADQuery
    AfterScroll = qryGridContasPagarAfterScroll
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT CP.ID,'
      '       CP.ID_DEVEDOR AS Cod_Devedor,'
      '       PS.NOME AS CREDOR,'
      '       CP.ID_UNIDADE AS COD_UN,'
      '       UN.NOME AS UNIDADE,'
      '       CP.DESCRICAO,'
      '       CP.VALOR,'
      '       CP.DATA_LANCAMENTO,'
      '       CP.DATA_VENCIMENTO,'
      '       CP.OBSERVACAO,'
      '       CASE CP.STATUS'
      '       WHEN '#39'0'#39' THEN '#39#192' Pagar'#39
      '       WHEN '#39'1'#39' THEN '#39'Paga'#39
      '       ELSE '#39'INCORRETO'#39
      '       END AS STATUS'
      '  FROM FIN_CONTAS_PAGAR CP'
      '  LEFT  JOIN PES_PESSOAS PS ON PS.ID = CP.ID_DEVEDOR'
      '  LEFT  JOIN SYS_UNIDADE UN ON UN.ID = CP.ID_UNIDADE')
    Left = 800
    Top = 591
    object qryGridContasPagarID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGridContasPagarCOD_DEVEDOR: TIntegerField
      FieldName = 'COD_DEVEDOR'
      Origin = 'ID_DEVEDOR'
    end
    object qryGridContasPagarCREDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CREDOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryGridContasPagarCOD_UN: TIntegerField
      FieldName = 'COD_UN'
      Origin = 'ID_UNIDADE'
      Required = True
    end
    object qryGridContasPagarUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryGridContasPagarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object qryGridContasPagarVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryGridContasPagarDATA_LANCAMENTO: TSQLTimeStampField
      FieldName = 'DATA_LANCAMENTO'
      Origin = 'DATA_LANCAMENTO'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qryGridContasPagarDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qryGridContasPagarOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
    end
    object qryGridContasPagarSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
  end
  object dsContasPagar: TDataSource
    DataSet = qryContasPagar
    Left = 744
    Top = 88
  end
  object dsUnidade: TDataSource
    DataSet = qryUnidade
    Left = 326
    Top = 214
  end
  object dsGridContasPagar: TDataSource
    DataSet = qryGridContasPagar
    Left = 699
    Top = 591
  end
end
