inherited frmConfiguraBanco: TfrmConfiguraBanco
  Caption = 'Configurar banco de dados'
  ClientWidth = 680
  ExplicitWidth = 696
  ExplicitHeight = 357
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlTitulo: TPanel
    Width = 680
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 606
  end
  inherited pnlBotoes: TPanel
    Width = 620
    ExplicitLeft = 30
    ExplicitTop = 44
    ExplicitWidth = 546
  end
  inherited pnlStatus: TPanel
    Width = 680
  end
  inherited pnlCentro: TPanel
    Width = 680
    ExplicitLeft = 96
    ExplicitTop = 82
    ExplicitWidth = 606
    ExplicitHeight = 216
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
  object OpenDialog: TOpenDialog
    Left = 584
    Top = 96
  end
end
