object frmFiltroRelComum: TfrmFiltroRelComum
  Left = 0
  Top = 0
  Caption = 'Filtro Relatorio Comum'
  ClientHeight = 282
  ClientWidth = 395
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
  end
  object pnlCentro: TPanel
    Left = 0
    Top = 78
    Width = 395
    Height = 190
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
  end
  object pnlBotoes: TPanel
    AlignWithMargins = True
    Left = 30
    Top = 41
    Width = 335
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
    object btnVisualizar: TPngSpeedButton
      Left = 0
      Top = 0
      Width = 105
      Height = 37
      Caption = 'Visualizar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PngImage.Data = {
        89504E470D0A1A0A0000000D494844520000001A0000001A0806000000A94A4C
        CE00000006624B474400FF00FF00FFA0BDA793000001784944415478DAEDD63D
        2846511CC7F1F3E4A52C2203937759BC94C7E065A2A744C920039332986CCAE6
        6551288B32181E9B2CC84B560CF464108A944298240A8908DF7FE7AADBD3ED3E
        3CF75C0C4E7D9673CFE977EE3DE79E7302EA874AE037833230FCC5FE8FE8C77D
        3C41B938FDC6608F508B9B78838630E8D2B713D378C7261AF1E067D0287AB18B
        106EFD0AAA4301A6B08D06DCF911249FED1AF928C50E6AF06C2AA80393517529
        48461ECE4C053915693FF01FF4A783B2F1A4F42A7CF3332811C528C2090EF16A
        3A288830CA6C75B20F7661CB5450160E94FE8FC6114185D25B936494980A921F
        B71BF5D8B0D557CADB60DE54D09ED273117478B68A2A5341C7B852FA5C8A2E0B
        08990A9A412BCA955E009F2547E9B98BB8058D58DC8A1C742F68C2222ED0A3F4
        BCC8FC4C287D84547B39CAE7D06E8D7A1D9956709AAD8D9C4BB248669D82D2D1
        1723442E236328C41A52D1827D342BBD059D630597D2C1CB752BC9FAFEF2466D
        58726BECF55E27739380E5580D3F00583074B3C49F7E350000000049454E44AE
        426082}
    end
    object btnImprimir: TPngSpeedButton
      Left = 111
      Top = 0
      Width = 105
      Height = 37
      Caption = 'Imprimir'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PngImage.Data = {
        89504E470D0A1A0A0000000D494844520000001A0000001A0806000000A94A4C
        CE00000006624B474400FF00FF00FFA0BDA793000001334944415478DA6364A0
        13601C7116B500B10D91661D01E21A722DDA00C47E40FC88803A3920DE04C401
        9458E400C40204D47D00E203A31681002B10F300F112064862502060D1030648
        628801E22F40FC9B9045FC40BC0A889D809885813CF00788F7007104107FC465
        5107109703F122207E4EA64552401C0BC4ED405C85CB22904BD480580F888B81
        B807D9552480C7407C03885D7159B49F01121F3E40BC8F019210AE9361D17D06
        48BC3912B24891CC6023DB2250A29023D2F047D05020CB22503EF227D2A28D0C
        887C4496452E0C9038C307B6304012124916A900B13D943F13884D19882B194E
        03713A947F1088EF10B2C8014DEC3310F311B0E81310F3A2891DC0675124036A
        E4C701B10C03A4C4C0074079ED090324A3C30028712CC765113AA06BE94D978A
        8F6E5539D5C0F0B3080060134F1BC74BE9980000000049454E44AE426082}
    end
    object btnFechar: TPngSpeedButton
      Left = 222
      Top = 0
      Width = 105
      Height = 37
      Caption = 'Fechar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
  end
  object pnlStatus: TPanel
    Left = 0
    Top = 268
    Width = 395
    Height = 14
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
  end
end
