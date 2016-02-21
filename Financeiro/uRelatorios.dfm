inherited frmRelatorios: TfrmRelatorios
  Align = alClient
  Caption = 'Relat'#243'rios'
  ClientWidth = 541
  ExplicitWidth = 557
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Width = 541
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Width = 481
    AutoSize = False
    ExplicitWidth = 60
    inherited btnNovo: TPngSpeedButton
      Visible = False
    end
    inherited btnGravar: TPngSpeedButton
      Visible = False
    end
    inherited btnEditar: TPngSpeedButton
      Visible = False
    end
    inherited btnCancelar: TPngSpeedButton
      Visible = False
    end
    inherited btnExcluir: TPngSpeedButton
      Visible = False
    end
  end
  inherited pnlCentro: TPanel
    Width = 541
    ExplicitWidth = 120
    object btnRelLancamentos: TPngSpeedButton
      AlignWithMargins = True
      Left = 30
      Top = 16
      Width = 100
      Height = 100
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Caption = 'Lan'#231'amentos'
      Layout = blGlyphTop
      OnClick = btnRelLancamentosClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F400000006624B474400FF00FF00FFA0BDA7930000009E4944415478DAEDD441
        0E4030100550BD01D7B07700129776050B7682352BCEC06F62D108DA4CCA64A4
        3FF9ABCAE4A52355117354003C9C6D84790D5AA22B1740A73D108B2F80EB9A4C
        708F16E8CC01A8D10C1DD0DC86780390A09581D037317D09D0DFC706623C6EE2
        12F1D63F704E87A69C80DB393E01A439E200AE8F93B2CC910BA0E45F00F615B0
        0328F917807D05EC004A02403EC057E4013E4900ECEE6546215DE33114000000
        0049454E44AE426082}
    end
    object PngSpeedButton2: TPngSpeedButton
      AlignWithMargins = True
      Left = 132
      Top = 16
      Width = 100
      Height = 100
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
    end
    object PngSpeedButton3: TPngSpeedButton
      AlignWithMargins = True
      Left = 30
      Top = 118
      Width = 100
      Height = 100
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
    end
    object PngSpeedButton4: TPngSpeedButton
      AlignWithMargins = True
      Left = 132
      Top = 118
      Width = 100
      Height = 100
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
    end
    object PngSpeedButton5: TPngSpeedButton
      AlignWithMargins = True
      Left = 234
      Top = 16
      Width = 100
      Height = 100
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
    end
  end
  inherited pnlTitulo: TPanel
    Width = 541
    ExplicitWidth = 120
  end
end
