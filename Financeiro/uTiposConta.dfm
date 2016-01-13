inherited frmTiposConta: TfrmTiposConta
  Caption = 'Tipos de Conta'
  ExplicitWidth = 622
  ExplicitHeight = 357
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlTitulo: TPanel
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 606
  end
  inherited pnlBotoes: TPanel
    ExplicitLeft = 30
    ExplicitTop = 44
    ExplicitWidth = 546
  end
  inherited pnlCentro: TPanel
    ExplicitLeft = 0
    ExplicitTop = 91
    ExplicitWidth = 606
    ExplicitHeight = 216
  end
  object qryTiposConta: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT * FROM FIN_TIPO_CONTAS;')
    Left = 576
  end
  object dsTiposConta: TDataSource
    DataSet = qryTiposConta
    Left = 544
  end
end
