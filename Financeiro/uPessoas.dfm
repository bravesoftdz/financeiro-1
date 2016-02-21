inherited frmPessoas: TfrmPessoas
  AutoSize = False
  Caption = 'Pessoas'
  ClientHeight = 489
  ClientWidth = 908
  OnActivate = FormActivate
  ExplicitWidth = 924
  ExplicitHeight = 528
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Top = 475
    Width = 908
    ExplicitTop = 475
    ExplicitWidth = 908
  end
  inherited pnlBotoes: TPanel
    Top = 41
    Width = 848
    Margins.Top = 0
    Margins.Bottom = 0
    ExplicitWidth = 848
    inherited btnExcluir: TPngSpeedButton
      OnClick = btnExcluirClick
    end
  end
  inherited pnlCentro: TPanel
    Top = 78
    Width = 908
    Height = 397
    ExplicitWidth = 908
    ExplicitHeight = 391
    object lblID: TLabel
      Left = 30
      Top = 3
      Width = 49
      Height = 20
      Caption = 'C'#243'digo'
    end
    object lblTipo: TLabel
      Left = 30
      Top = 123
      Width = 30
      Height = 20
      Caption = 'Tipo'
    end
    object lblNome: TLabel
      Left = 30
      Top = 183
      Width = 41
      Height = 20
      Caption = 'Nome'
    end
    object lblDataCadastro: TLabel
      Left = 30
      Top = 63
      Width = 116
      Height = 20
      Caption = 'Data de Cadastro'
    end
    object edtID: TEdit
      Left = 30
      Top = 29
      Width = 121
      Height = 28
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 30
      Top = 209
      Width = 307
      Height = 28
      TabOrder = 3
    end
    object dtDataCadastro: TDateTimePicker
      Left = 30
      Top = 89
      Width = 186
      Height = 28
      Date = 42409.835090914350000000
      Time = 42409.835090914350000000
      Enabled = False
      TabOrder = 1
    end
    object cbbTipo: TComboBox
      Left = 30
      Top = 149
      Width = 186
      Height = 28
      Style = csOwnerDrawFixed
      ItemHeight = 22
      TabOrder = 2
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica')
    end
    object grdPessoas: TDBGrid
      AlignWithMargins = True
      Left = 30
      Top = 260
      Width = 848
      Height = 134
      Margins.Left = 30
      Margins.Right = 30
      TabStop = False
      Align = alBottom
      DataSource = dsGridPessoas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentColor = True
      TabOrder = 4
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = grdPessoasCellClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'Cod.'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 495
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Data Cadastro'
          Width = 130
          Visible = True
        end>
    end
  end
  inherited pnlTitulo: TPanel
    Width = 908
    ExplicitWidth = 908
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 30
      Top = 0
      Width = 130
      Height = 41
      Margins.Bottom = 0
      BevelOuter = bvNone
      Caption = 'Inicio'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 35
        Width = 130
        Height = 6
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        Color = clBlue
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 36
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 163
      Top = 0
      Width = 128
      Height = 41
      Margins.Bottom = 0
      BevelOuter = bvNone
      Caption = 'Informa'#231#245'es'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object Panel4: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 35
        Width = 128
        Height = 6
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        Color = clGray
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 130
      end
    end
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 294
      Top = 0
      Width = 128
      Height = 41
      Margins.Bottom = 0
      BevelOuter = bvNone
      Caption = 'Contato'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 35
        Width = 128
        Height = 6
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        Color = clGray
        ParentBackground = False
        TabOrder = 0
      end
    end
    object Panel9: TPanel
      AlignWithMargins = True
      Left = 425
      Top = 0
      Width = 128
      Height = 41
      Margins.Bottom = 0
      BevelOuter = bvNone
      Caption = 'Endere'#231'o'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      object Panel10: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 35
        Width = 128
        Height = 6
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        Color = clGray
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
  object qryPessoas: TADQuery
    Connection = dmPrincipal.Conexao
    Left = 536
    Top = 96
  end
  object qryGridPessoas: TADQuery
    AfterScroll = qryGridPessoasAfterScroll
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT PS.ID,'
      '       PS.NOME,'
      '       CASE PS.TIPO'
      '       WHEN '#39'F'#39' THEN '#39'F'#237'sica'#39
      '       WHEN '#39'J'#39' THEN '#39'Jur'#237'dica'#39
      '       ELSE '#39'INV'#193'LIDO'#39
      '       END AS TIPO,'
      '       CASE PS.TIPO'
      '       WHEN '#39'F'#39' THEN 0'
      '       WHEN '#39'J'#39' THEN 1'
      '       ELSE '#39'INV'#193'LIDO'#39
      '       END AS CBBTIPO,'
      '       PS.DATA_CADASTRO'
      '  FROM PES_PESSOAS PS')
    Left = 400
    Top = 392
    object qryGridPessoasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGridPessoasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 255
    end
    object qryGridPessoasTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object qryGridPessoasCBBTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CBBTIPO'
      Origin = 'CBBTIPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object qryGridPessoasDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
  end
  object dsPessoas: TDataSource
    DataSet = qryPessoas
    Left = 480
    Top = 97
  end
  object dsGridPessoas: TDataSource
    DataSet = qryGridPessoas
    Left = 520
    Top = 392
  end
end
