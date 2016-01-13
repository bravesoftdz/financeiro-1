inherited frmCadastroContas: TfrmCadastroContas
  Caption = 'Cadastrar contas'
  ClientWidth = 490
  ExplicitWidth = 506
  ExplicitHeight = 357
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlTitulo: TPanel
    Width = 490
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 490
  end
  inherited pnlBotoes: TPanel
    Width = 430
    ExplicitLeft = 30
    ExplicitTop = 44
    ExplicitWidth = 430
    object btnGravar: TPngSpeedButton
      Left = 0
      Top = 3
      Width = 89
      Height = 35
      Caption = 'Gravar'
      Flat = True
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F400000006624B474400FF00FF00FFA0BDA793000000994944415478DA636418
        60C038EA805107E010FF4F05B3CF03B12B10BF1D280780C045207601E237E43A
        80918018367118FF34109B02F14D207602E267F476802010EF823AE216D4114F
        69E1007C7A4581782F10EB02F13520D6A6B70318A08E78854B2F390E201610E5
        F821E5004AC0A803287600B92523BAFEA1EF0062A38468FDA30E1875C0A80368
        DD242368DFA07500DDC0A803461D0000EB8B4D214B5C1BCD0000000049454E44
        AE426082}
    end
    object btnEditar: TPngSpeedButton
      Left = 95
      Top = 3
      Width = 89
      Height = 35
      Caption = 'Editar'
      Flat = True
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F400000006624B474400FF00FF00FFA0BDA793000001EC4944415478DAEDD7CF
        2B65611CC7F1C78FC982A2994116FE001B9B61CA4AB12156945F77AEA5C9C68E
        295990A4CC4A4A5698F12316EC5C45B19925CA82CD4C162211E3D7CAAF787F7B
        9E5BC7ED9EEBFE780E92A75EDDD3B9D7F97CCE3DCF3DCF91A45E7824BD17F0F8
        F869B8C5DD7317F882417CC53596D086BDE728E0C3183E98F05424E3188538F0
        B240137E2305C3684716A6518A19347A55400E3C61C2FF9BB3DD37EFE599ED73
        7CC4BDED020D9834E1F2557FC616CA7084749C2A3D21337163B340BD09976B3D
        807E2CA3087F4D894EB46205E5CE3F4EB4401DA61CE13FCCFE5CACA20027F8A4
        F484945FC5A6AD026EE1C12197611BD94ADF079A959E8C8F46BC05E460A34A5F
        F31E748739EE085A94BEDE3247E6C31D289E02D6C2E329E057FA2663253CD602
        D6C36329F00DE3B6C3A32DE0597834056209BF422D16A20D7FAA80AC6ABFBC0C
        8F5440C265559365F4273ABC088F54E0103966FB02DF955E4A8343EE7CB2D4CA
        E2E20F792FE102F9D8C519FEA05AE9E5535E0321E1324766E30D772B50833913
        56A5F44AD6A7F4322BFBE44E78653E174824DCAD402FBA4C6897D9B7880AB36D
        E5CC231590B3AAC4102E518C126428BDAAF96C85BB15704E40E790279A569BE1
        E10A3827E006D6B06E5E776C06BB159027587980F8A71C0F8E5E8E37FFAFD9EB
        2FF000955F83215BD554420000000049454E44AE426082}
    end
    object btnExcluir: TPngSpeedButton
      Left = 190
      Top = 3
      Width = 89
      Height = 35
      Caption = 'Excluir'
      Flat = True
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F400000006624B474400FF00FF00FFA0BDA7930000009F4944415478DA636418
        60C038EA80A1E8001120DE0DC40668E21780D81588DF50CB01FFE9E159721D70
        0E889D81F803942F00C47B81D8889A0E407604B96985A0FE51070C390750CA1F
        75C0A803461D30EA80510750EC0052C1A8032876C073209600625B203E42A2E5
        76407C106A8614B90EE800E272327D0F036D405C4DAE035881B8098893815894
        448B5F01F15C20AE07E2DFE43A80E660D40103EE00003AF557217E4A3C4A0000
        000049454E44AE426082}
    end
  end
  inherited pnlStatus: TPanel
    Width = 490
    ExplicitWidth = 490
  end
  inherited pnlCentro: TPanel
    Width = 490
    ExplicitLeft = 0
    ExplicitTop = 88
    ExplicitWidth = 490
    ExplicitHeight = 216
    object lblID: TLabel
      Left = 30
      Top = 3
      Width = 18
      Height = 20
      Caption = 'ID:'
    end
    object lblTipoContas: TLabel
      Left = 30
      Top = 63
      Width = 74
      Height = 20
      Caption = 'Tipo conta:'
    end
    object lblUnidade: TLabel
      Left = 200
      Top = 63
      Width = 59
      Height = 20
      Caption = 'Unidade:'
    end
    object lblStatus: TLabel
      Left = 200
      Top = 3
      Width = 43
      Height = 20
      Caption = 'Status:'
    end
    object lblDescricao: TLabel
      Left = 30
      Top = 136
      Width = 68
      Height = 20
      Caption = 'Descri'#231#227'o:'
    end
    object cbbTipoConta: TDBLookupComboBox
      Left = 30
      Top = 89
      Width = 145
      Height = 28
      BevelOuter = bvNone
      DataField = 'ID_TIPO_CONTAS'
      DataSource = dsCadContas
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListFieldIndex = 1
      ListSource = frmTiposConta.dsTiposConta
      TabOrder = 0
    end
    object edtID: TEdit
      Left = 30
      Top = 29
      Width = 145
      Height = 28
      TabStop = False
      BevelOuter = bvNone
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object cbbUnidade: TDBLookupComboBox
      Left = 200
      Top = 89
      Width = 145
      Height = 28
      BevelOuter = bvNone
      TabOrder = 2
    end
    object edtStatus: TEdit
      Left = 200
      Top = 29
      Width = 145
      Height = 28
      BevelOuter = bvNone
      TabOrder = 3
    end
    object edtDescricao: TEdit
      Left = 30
      Top = 162
      Width = 315
      Height = 28
      TabOrder = 4
    end
  end
  object qryCadContas: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      ''
      'SELECT * FROM FIN_CONTAS;')
    Left = 456
  end
  object dsCadContas: TDataSource
    DataSet = qryCadContas
    Left = 424
  end
end
