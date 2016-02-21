unit uPesquisarCredor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPesquisarComum, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls,
  uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager,
  uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB,
  uADCompDataSet, uADCompClient, uDmPrincipal;

type
  TfrmPesquisarCredor = class(TfrmPesquisarComum)
    qryPesquisarCredor: TADQuery;
    dsPesquisarCredor: TDataSource;
    qryPesquisarCredorID: TIntegerField;
    qryPesquisarCredorNOME: TStringField;
    qryPesquisarCredorTIPO: TStringField;
    cbbFiltro: TComboBox;
    procedure btnFecharClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure grdPesquisarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    IdCredor   : string;
    NomeCredor : string;
    { Public declarations }
  end;

var
  frmPesquisarCredor: TfrmPesquisarCredor;

implementation

{$R *.dfm}

uses
  uContasPagar;

procedure TfrmPesquisarCredor.btnFecharClick(Sender: TObject);
begin
  inherited;
  frmPesquisarCredor.Close;
end;

procedure TfrmPesquisarCredor.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  IdCredor   := qryPesquisarCredorID.AsString;
  NomeCredor := qryPesquisarCredorNOME.AsString;
  Close;
end;

procedure TfrmPesquisarCredor.edtPesquisarChange(Sender: TObject);
begin
  inherited;
  if cbbFiltro.ItemIndex = 0 then
  begin
    qryPesquisarCredor.Filter := 'UPPER (NOME) LIKE ' + QuotedStr('%' + UpperCase(edtPesquisar.Text) + '%');
    qryPesquisarCredor.Filtered := True;
  end
  else
  if cbbFiltro.ItemIndex = 1 then
  begin
    qryPesquisarCredor.Filter := '(ID) LIKE ' + QuotedStr('%' + edtPesquisar.Text + '%');
    qryPesquisarCredor.Filtered := True;
  end;
end;

procedure TfrmPesquisarCredor.FormCreate(Sender: TObject);
begin
  inherited;
  qryPesquisarCredor.Close;
  qryPesquisarCredor.Open;
end;

procedure TfrmPesquisarCredor.grdPesquisarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    btnSelecionar.Click;
  end;

end;

end.
