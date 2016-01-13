object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 342
  Width = 539
  object Conexao: TADConnection
    Params.Strings = (
      'User_Name=ROOT'
      'Password=ROOT'
      
        'Database=C:\Projetos\Controle Financeiro\BD\CONTROLEFINANCEIRO.F' +
        'DB'
      'Server=localhost'
      'CharacterSet=ISO8859_1'
      'PageSize=4096'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object adDriver: TADPhysIBDriverLink
    Left = 64
    Top = 8
  end
  object adCursor: TADGUIxWaitCursor
    Left = 104
    Top = 8
  end
end
