object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'frmLogin'
  ClientHeight = 408
  ClientWidth = 482
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 114
    Width = 476
    Height = 20
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Usu'#225'rio'
    ExplicitWidth = 50
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 171
    Width = 476
    Height = 20
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Senha'
    ExplicitTop = 174
    ExplicitWidth = 40
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 268
    Width = 476
    Height = 15
    Align = alTop
    Alignment = taRightJustify
    Caption = 'Esqueceu a senha?'
    DragCursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    ParentFont = False
    ExplicitTop = 274
    ExplicitWidth = 98
  end
  object Image1: TImage
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 476
    Height = 105
    Align = alTop
    ExplicitLeft = 192
    ExplicitTop = 40
    ExplicitWidth = 105
  end
  object edtUsuario: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 137
    Width = 476
    Height = 28
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 122
    ExplicitWidth = 482
  end
  object edtSenha: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 194
    Width = 476
    Height = 28
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 170
    ExplicitWidth = 482
  end
  object btnEntrar: TBitBtn
    AlignWithMargins = True
    Left = 3
    Top = 228
    Width = 476
    Height = 34
    Align = alTop
    Caption = '&Entrar'
    TabOrder = 2
    ExplicitTop = 234
  end
end
