inherited frmConfiguraBanco: TfrmConfiguraBanco
  Caption = 'Configurar banco de dados'
  ClientHeight = 386
  ClientWidth = 680
  ExplicitWidth = 696
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Top = 372
    Width = 680
    ExplicitTop = 372
    ExplicitWidth = 680
  end
  inherited pnlBotoes: TPanel
    Width = 620
    ExplicitWidth = 620
    inherited btnNovo: TPngSpeedButton
      Left = 424
      Visible = False
      ExplicitLeft = 424
    end
    inherited btnGravar: TPngSpeedButton
      Left = 0
      ExplicitLeft = 0
    end
    inherited btnEditar: TPngSpeedButton
      Left = 515
      Visible = False
      ExplicitLeft = 515
    end
    inherited btnCancelar: TPngSpeedButton
      Left = 244
      ExplicitLeft = 244
    end
    inherited btnExcluir: TPngSpeedButton
      Left = 350
      Visible = False
      ExplicitLeft = 350
    end
    object btnTestarConexao: TPngSpeedButton
      Left = 91
      Top = 0
      Width = 147
      Height = 37
      Caption = 'Testar Conex'#227'o'
      Flat = True
      PngImage.Data = {
        89504E470D0A1A0A0000000D494844520000001A0000001A0806000000A94A4C
        CE00000006624B474400FF00FF00FFA0BDA793000001364944415478DA6364A0
        13601CB1161900F1041C7205407C815A163900F17E207E0BC45FA0623C402C0C
        C48E407C80DA162502F102A8580210CF1FF2169D07E2475031392036A4B64536
        40BC05CAE686D25FA1B40F101FA19645C80096C20C48D134322C3A0CC4BC78F4
        A841E95B78D47C06625B42167D808ADF27D3224520FE0FC402C45874008803C8
        0CBA0D0C90EC30422C8A02E2695036A8B0FC0BC4DFA17C3D064829802FC3824A
        8B4B503E27103333200ADF2C205E06B3288101526E1D05E23750310D20566780
        44AE0203FE22E8010324F1DC04E21B50791120B66680968FE81621975B0D405C
        8F6611AE4215665123541F03035A413C6016BD04E21F50315064F2A35984ABE2
        8359F49101929840800388C5D12DF200E20A06EC2002882518F057E52F807805
        0EF90E20DE31E81A2743C722006920651BB8F49BAA0000000049454E44AE4260
        82}
    end
  end
  inherited pnlCentro: TPanel
    Width = 680
    Height = 288
    ExplicitWidth = 680
    ExplicitHeight = 288
    object Label1: TLabel
      Left = 30
      Top = 16
      Width = 129
      Height = 20
      Caption = 'Caminho do banco:'
    end
    object edtCaminho: TEdit
      Left = 30
      Top = 42
      Width = 546
      Height = 28
      TabOrder = 0
    end
    object btnCaminho: TButton
      Left = 582
      Top = 42
      Width = 27
      Height = 28
      Caption = '...'
      TabOrder = 1
      OnClick = btnCaminhoClick
    end
  end
  inherited pnlTitulo: TPanel
    Width = 680
    ExplicitWidth = 680
  end
  object OpenDialog: TOpenDialog
    Left = 584
    Top = 160
  end
end
