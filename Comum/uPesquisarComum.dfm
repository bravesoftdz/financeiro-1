object frmPesquisarComum: TfrmPesquisarComum
  Left = 0
  Top = 0
  Caption = 'frmPesquisarComum'
  ClientHeight = 330
  ClientWidth = 477
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object pnlStatus: TPanel
    Left = 0
    Top = 316
    Width = 477
    Height = 14
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
  end
  object pnlBotoes: TPanel
    AlignWithMargins = True
    Left = 30
    Top = 41
    Width = 417
    Height = 37
    Margins.Left = 30
    Margins.Top = 0
    Margins.Right = 30
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = 14540253
    ParentBackground = False
    TabOrder = 2
    object btnFechar: TPngSpeedButton
      Left = 328
      Top = 0
      Width = 89
      Height = 37
      Align = alRight
      Caption = 'Fechar'
      Flat = True
      PngImage.Data = {
        89504E470D0A1A0A0000000D494844520000001A0000001A0806000000A94A4C
        CE00000006624B474400FF00FF00FFA0BDA793000001934944415478DAE5D54F
        28046118C7F177290717CA611D1739A0284E480E4E8A5AFF9DE4402922A11C68
        979C289172F72729F957C2C5454249925222C445B970407BC1F76D9EAD492B3B
        333B0EBCF56967A6B7F7B7CFCCF3CE78D42F0DCFBF084AC5A2C3751BF1F05390
        0F3778C693C5806424210DB7D1060D21683148CF0FB81154866CCC49F5AE0415
        E048D65887DFADA0726CCAF1210A6315548444390EE11803C8C1B09C3B0ECAC0
        05E24DF35EB08535ACE02D164193E84407DA918E7D142301DBA8C0A09320BD37
        EE708A3E1C604A82F5C6AE954AA7F1E824A81763A84183FC66E21D9798410AAA
        4C6B9460CF6A50139AD18673ACA20EE3E84216EE31825265B47D3E4EEC3C2325
        8B4EC82D5B90393B5F2A093AB975E111309DBF2AA3D57505BB7683E294F106D7
        2FC790E97A3F5A95B1775AE40F5562C36E901E7E79169186AE4477E215AE91A7
        8CC6B015A4BBAA3AC2F50F8CCAB16E866E65B4F7B29D202FE695F1469E55DF0F
        AF54A49F67AE546529C8A7A2FF4CE8EAF426AEC7925B1585E7EA7967E851C67E
        D3A2FA94BB32FE5ED027B282841BA2836F250000000049454E44AE426082}
    end
    object btnSelecionar: TPngSpeedButton
      Left = 0
      Top = 0
      Width = 105
      Height = 37
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Selecionar'
      Flat = True
      PngImage.Data = {
        89504E470D0A1A0A0000000D494844520000001A0000001A0806000000A94A4C
        CE00000006624B474400FF00FF00FFA0BDA793000000DB4944415478DAEDD2BF
        0EC14000C7F156E221240D9EC32E12AB841760117F46DE80CD9F74110FC1C06C
        65C0E23544C268F1BDA8449AEB39EDD5A2BFE4BBB5F9E47AB5AD1FCD4EA0BF86
        9A74A7799C90405CDA53418071407D1AD0964A748DE34452C434D4A3A10C3109
        7569443B19620AEAD058859880B4103F54A614AD349106CDE84045BAA81E7E41
        693A518E2AB4FE80D43DE4A883F84FE4D0C6C36AB40878A74D139DCF1504F9B1
        2A2D4D20324885B5681A06098264981305514162790FCB58CF9F45FBE2BF85DE
        B17314440712CBD22D0AA20B19590285DE03E8A73B1B148C0AEF000000004945
        4E44AE426082}
    end
  end
  object pnlCentro: TPanel
    Left = 0
    Top = 78
    Width = 477
    Height = 238
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object grdPesquisar: TDBGrid
      AlignWithMargins = True
      Left = 30
      Top = 37
      Width = 417
      Height = 198
      Margins.Left = 30
      Margins.Right = 30
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -15
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object edtPesquisar: TEdit
      AlignWithMargins = True
      Left = 30
      Top = 3
      Width = 417
      Height = 28
      Margins.Left = 30
      Margins.Right = 30
      Align = alTop
      TabOrder = 1
      TextHint = 'Pesquisar'
    end
  end
end