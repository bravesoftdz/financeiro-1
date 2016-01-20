unit uCadContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons, PngSpeedButton, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, Data.DB, uADCompDataSet, uADCompClient, uDmPrincipal, uTiposConta,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroContas = class(TfrmComum)
    cbbTipoConta: TDBLookupComboBox;
    edtID: TEdit;
    lblID: TLabel;
    lblTipoContas: TLabel;
    cbbUnidade: TDBLookupComboBox;
    lblUnidade: TLabel;
    lblStatus: TLabel;
    lblDescricao: TLabel;
    qryCadContas: TADQuery;
    dsCadContas: TDataSource;
    qryTipoConta: TADQuery;
    qryUnidade: TADQuery;
    dsTipoConta: TDataSource;
    dsUnidade: TDataSource;
    cbbStatus: TComboBox;
    edtDesc: TEdit;
    gridCadContas: TDBGrid;
    dsGridCadContas: TDataSource;
    qryGridCadContas: TADQuery;
    qryGridCadContasCONTA: TIntegerField;
    qryGridCadContasNOME: TStringField;
    qryGridCadContasTIPO: TStringField;
    qryGridCadContasSTATUS: TIntegerField;
    qryGridCadContasID_UNIDADE: TIntegerField;
    qryTipoContaID: TIntegerField;
    qryTipoContaDESCRICAO: TStringField;
    qryGridCadContasID_TIPO_CONTA: TIntegerField;
    qryGridCadContasUNIDADE: TStringField;
    qryUnidadeID_UNIDADE: TIntegerField;
    qryUnidadeUNIDADE: TStringField;
    qryGridCadContasDESCRICAO_STATUS: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure gridCadContasCellClick(Column: TColumn);
    procedure qryGridCadContasAfterScroll(DataSet: TDataSet);
  private
    operacao : string;
    procedure PreencherCampos;
    procedure HabilitarCampos(status : Boolean);
    procedure Excluir;
    function PersisteDados(operacao: string) : Boolean;
    procedure Cancelar;
     { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroContas: TfrmCadastroContas;

implementation

{$R *.dfm}

procedure TfrmCadastroContas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  qryGridCadContas.Refresh;
  HabilitarCampos(false);
  Cancelar;
end;

procedure TfrmCadastroContas.btnEditarClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(true);
  PreencherCampos;
  operacao := 'E';
end;

procedure TfrmCadastroContas.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TfrmCadastroContas.btnGravarClick(Sender: TObject);
begin
  inherited;
  qryGridCadContas.Refresh;
  HabilitarCampos(false);
  PersisteDados(operacao);
end;

procedure TfrmCadastroContas.btnNovoClick(Sender: TObject);
begin
  inherited;
  Cancelar;
  HabilitarCampos(True);
  operacao := 'I';
end;

procedure TfrmCadastroContas.Cancelar;
begin
  cbbStatus.ClearSelection;
  edtID.Clear;
  edtDesc.Clear;
  cbbTipoConta.KeyValue := 0;
  cbbUnidade.KeyValue := 0;
end;

procedure TfrmCadastroContas.Excluir;
begin
  with qryCadContas do
  begin
    Close;
    SQL.Clear;
    if edtID.Text <> '' then
    begin
    SQL.Add('DELETE FROM FIN_CONTAS WHERE ID = :ID');
    ParamByName('ID').AsInteger := StrToInt(edtID.Text);
    end
    else
      begin
        showMessage('Selecione o registro que seja excluir!');
        Exit;
      end;
    try
      ExecSQL;
      ShowMessage('Registro excluido!');
      qryGridCadContas.Refresh;
    except
     ShowMessage('Erro ao excluir registro');
    end;
  end;
end;

procedure TfrmCadastroContas.FormActivate(Sender: TObject);
begin
  inherited;
  qryUnidade.Open;
  qryTipoConta.Open;
  qryGridCadContas.Open;
end;

procedure TfrmCadastroContas.FormCreate(Sender: TObject);
begin
  inherited;
  HabilitarCampos(false);
end;

procedure TfrmCadastroContas.gridCadContasCellClick(Column: TColumn);
begin
  inherited;
  PreencherCampos;
end;

procedure TfrmCadastroContas.HabilitarCampos(status: Boolean);
begin
  cbbStatus.Enabled    := status;
  cbbUnidade.Enabled   := status;
  cbbTipoConta.Enabled := status;
  edtDesc.Enabled      := status;
  btnNovo.Enabled      := not status;
  btnGravar.Enabled    := status;
  btnEditar.Enabled    := not status;
  btnCancelar.Enabled  := status;
  btnExcluir.Enabled   := not status;
end;

function TfrmCadastroContas.PersisteDados(operacao : string):Boolean;
begin
  with qryCadContas do
  begin
    Close;
    SQL.Clear;
    if operacao = 'I' then
    begin
      SQL.Add('INSERT INTO FIN_CONTAS (STATUS, ID_UNIDADE, ID_TIPO_CONTAS, DESCRICAO) VALUES (:STATUS, :ID_UNIDADE, :ID_TIPO_CONTAS, :DESCRICAO)');
    end
    else
    if operacao = 'E' then
    begin
      SQL.Add('UPDATE FIN_CONTAS SET STATUS = :STATUS, ID_UNIDADE = :ID_UNIDADE, ID_TIPO_CONTAS = :ID_TIPO_CONTAS, DESCRICAO = :DESCRICAO WHERE ID = :ID');
      ParamByName('ID').AsInteger              := StrToInt(edtID.Text);
    end;
    try
      ParamByName('STATUS').AsInteger          := cbbStatus.ItemIndex;
      ParamByName('ID_UNIDADE').AsString       := cbbUnidade.KeyValue;
      ParamByName('ID_TIPO_CONTAS').AsString   := cbbTipoConta.KeyValue;
      ParamByName('DESCRICAO').AsString        := Trim(edtDesc.Text);
      ExecSQL;
      ShowMessage('Dados gravados com sucesso!');
      qryGridCadContas.Refresh;
      Result := True;
    except
      Result := False;
      ShowMessage('Erro ao gravar dados!');
    end;
  end;
end;

procedure TfrmCadastroContas.PreencherCampos;
begin
  qryUnidade.Close;
  qryUnidade.Open;
  qryTipoConta.Close;
  qryTipoConta.Open;
  cbbStatus.ItemIndex := qryGridCadContasSTATUS.AsInteger;
  edtID.Text := qryGridCadContasCONTA.AsString;
  cbbUnidade.KeyValue := qryGridCadContasID_UNIDADE.AsInteger;
  cbbTipoConta.KeyValue := qryGridCadContasID_TIPO_CONTA.AsInteger;
  edtDesc.Text := qryGridCadContasNOME.AsString;

end;

procedure TfrmCadastroContas.qryGridCadContasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  PreencherCampos;
end;

end.
