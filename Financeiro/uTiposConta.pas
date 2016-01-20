unit uTiposConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.ExtCtrls, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, uDmPrincipal, Vcl.ComCtrls, Vcl.Buttons, PngSpeedButton;

type
  TfrmTiposConta = class(TfrmComum)
    qryTiposConta: TADQuery;
    dsTiposConta: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTiposConta: TfrmTiposConta;

implementation

{$R *.dfm}

end.
