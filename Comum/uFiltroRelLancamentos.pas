unit uFiltroRelLancamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFiltroRelComum, Vcl.Buttons,
  PngSpeedButton, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  Data.DB, uADCompDataSet, uADCompClient, uDmPrincipal;

type
  TfrmFiltroRelLancamentos = class(TfrmFiltroRelComum)
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dtDataInicial: TDateTimePicker;
    dtDataFinal: TDateTimePicker;
    cbbContas: TDBLookupComboBox;
    lblContas: TLabel;
    qryContas: TADQuery;
    dsContas: TDataSource;
    qryRelLancamentos: TADQuery;
    qryRelLancamentosCODIGO: TIntegerField;
    qryRelLancamentosDATA: TSQLTimeStampField;
    qryRelLancamentosID_CONTAS: TIntegerField;
    qryRelLancamentosDESCRICAO: TStringField;
    qryRelLancamentosID_CATEGORIA: TIntegerField;
    qryRelLancamentosTIPO: TStringField;
    qryRelLancamentosVALOR: TBCDField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroRelLancamentos: TfrmFiltroRelLancamentos;

implementation

{$R *.dfm}

procedure TfrmFiltroRelLancamentos.btnFecharClick(Sender: TObject);
begin
  inherited;
  frmFiltroRelLancamentos.Close;
end;

procedure TfrmFiltroRelLancamentos.FormCreate(Sender: TObject);
begin
  inherited;
  qryContas.Close;
  qryContas.Open;
  dtDataInicial.DateTime := Now;
  dtDataFinal.Date       := Now;
end;

end.