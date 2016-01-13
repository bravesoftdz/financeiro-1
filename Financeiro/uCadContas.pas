unit uCadContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons, PngSpeedButton, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, Data.DB, uADCompDataSet, uADCompClient, uDmPrincipal, uTiposConta;

type
  TfrmCadastroContas = class(TfrmComum)
    cbbTipoConta: TDBLookupComboBox;
    edtID: TEdit;
    lblID: TLabel;
    lblTipoContas: TLabel;
    cbbUnidade: TDBLookupComboBox;
    lblUnidade: TLabel;
    lblStatus: TLabel;
    edtStatus: TEdit;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    btnGravar: TPngSpeedButton;
    btnEditar: TPngSpeedButton;
    btnExcluir: TPngSpeedButton;
    qryCadContas: TADQuery;
    dsCadContas: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroContas: TfrmCadastroContas;

implementation

{$R *.dfm}

end.
