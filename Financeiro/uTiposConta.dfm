inherited frmTiposConta: TfrmTiposConta
  Caption = 'Tipos de Conta'
  ClientHeight = 354
  ClientWidth = 534
  ExplicitWidth = 550
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 20
  inherited pnlStatus: TPanel
    Top = 340
    Width = 534
    ExplicitTop = -14
    ExplicitWidth = 120
  end
  inherited pnlBotoes: TPanel
    Width = 474
    ExplicitWidth = 60
  end
  inherited pnlCentro: TPanel
    Width = 534
    Height = 256
    ExplicitWidth = 120
  end
  inherited pnlTitulo: TPanel
    Width = 534
    ExplicitWidth = 120
  end
  object qryTiposConta: TADQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT ID, DESCRICAO FROM FIN_TIPO_CONTAS;')
    Left = 576
  end
  object dsTiposConta: TDataSource
    DataSet = qryTiposConta
    Left = 544
  end
end
