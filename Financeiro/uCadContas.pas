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
    lblEmpresa: TLabel;
    qryEmpresa: TADQuery;
    dsEmpresa: TDataSource;
    cbbEmpresa: TDBLookupComboBox;
    qryEmpresaID: TIntegerField;
    qryEmpresaNOME: TStringField;
    qryGridCadContasEMPRESA: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure gridCadContasCellClick(Column: TColumn);
    procedure qryGridCadContasAfterScroll(DataSet: TDataSet);
    procedure cbbEmpresaCloseUp(Sender: TObject);
    procedure cbbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure cbbEmpresaClick(Sender: TObject);
  private
    operacao : string;
    procedure PreencherCampos;
    procedure HabilitaCampos(status : Boolean);
    procedure Excluir;
    procedure Cancelar;
    function  PersisteDados(operacao: string) : Boolean;
    function  ValidaCampos : Boolean;
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
  qryUnidade.Close;
  qryGridCadContas.Refresh;
  Cancelar;
  HabilitaCampos(false);
end;

procedure TfrmCadastroContas.btnEditarClick(Sender: TObject);
begin
  inherited;
  HabilitaCampos(true);
  PreencherCampos;
  operacao := 'E';
end;

procedure TfrmCadastroContas.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
  Cancelar;
  qryGridCadContas.Refresh;
end;

procedure TfrmCadastroContas.btnGravarClick(Sender: TObject);
begin
  inherited;
  PersisteDados(operacao);
  qryGridCadContas.Refresh;


end;

procedure TfrmCadastroContas.btnNovoClick(Sender: TObject);
begin
  inherited;
  Cancelar;
  HabilitaCampos(True);
  operacao := 'I';
  qryUnidade.Close;
end;

procedure TfrmCadastroContas.Cancelar;
begin
  cbbStatus.ClearSelection;
  edtID.Clear;
  edtDesc.Clear;
  cbbEmpresa.KeyValue   := 0;
  cbbTipoConta.KeyValue := 0;
  cbbUnidade.KeyValue   := 0;
end;

procedure TfrmCadastroContas.cbbEmpresaClick(Sender: TObject);
begin
  inherited;
  qryUnidade.Close;
end;

procedure TfrmCadastroContas.cbbEmpresaCloseUp(Sender: TObject);
begin
  inherited;
  with qryUnidade do
  begin
   if cbbEmpresa.KeyValue = 0 then
   begin
     Close;
   end
   else
   begin
     ParamByName('ID_EMPRESA').AsInteger := qryEmpresaID.AsInteger;
     Open;
   end;
  end;
end;

procedure TfrmCadastroContas.cbbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  cbbEmpresaCloseUp(cbbUnidade);
end;

procedure TfrmCadastroContas.Excluir;
begin
  if edtID.Text = '' then
  begin
    ShowMessage('Selecione um registro para excluir!');
    Exit;
  end
  else
  if Application.MessageBox('Tem certeza que deseja excluir?', 'Exluir registro', MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    with qryCadContas do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM FIN_CONTAS WHERE ID = :ID');
      ParamByName('ID').AsInteger := StrToInt(edtID.Text);
      try
      ExecSQL;
      ShowMessage('Registro excluido!');
      qryGridCadContas.Refresh;
      except
        on E:Exception do
        begin
          if Pos('FOREIGN', E.Message) > 0 then
          begin
            ShowMessage('N�o � poss�vel excluir um registro com v�nculos!');
          end
          else
            ShowMessage('Erro ao excluir registro!');
        end;
      end;
    end
  end
  else
  begin
    Cancelar;
    qryGridCadContas.Refresh;
  end;
end;

procedure TfrmCadastroContas.FormActivate(Sender: TObject);
begin
  inherited;
  qryEmpresa.Open;
  qryTipoConta.Open;
  qryGridCadContas.Open;
  Cancelar;
end;

procedure TfrmCadastroContas.FormCreate(Sender: TObject);
begin
  inherited;
  HabilitaCampos(false);
end;

procedure TfrmCadastroContas.gridCadContasCellClick(Column: TColumn);
begin
  inherited;
  PreencherCampos;
end;

procedure TfrmCadastroContas.HabilitaCampos(status: Boolean);
begin
  cbbEmpresa.Enabled   := status;
  cbbStatus.Enabled    := status;
  cbbUnidade.Enabled   := status;
  cbbTipoConta.Enabled := status;
  edtDesc.Enabled      := status;
end;

function TfrmCadastroContas.PersisteDados(operacao : string):Boolean;
begin
  if ValidaCampos = False then
  begin
    Exit;
  end;
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
      HabilitaCampos(false);
      HabilitarBotoes(false);
    except
      Result := False;
      ShowMessage('Erro ao gravar dados!');
    end;
  end;
end;

procedure TfrmCadastroContas.PreencherCampos;
begin
  qryEmpresa.Close;
  qryEmpresa.Open;
  qryUnidade.Close;
  qryUnidade.Open;
  qryTipoConta.Close;
  qryTipoConta.Open;
  cbbEmpresaCloseUp(cbbUnidade);
  edtID.Text := qryGridCadContasCONTA.AsString;
  edtDesc.Text := qryGridCadContasNOME.AsString;
  cbbStatus.ItemIndex   := qryGridCadContasSTATUS.AsInteger;
  cbbEmpresa.KeyValue   := qryEmpresaID.AsInteger;
  cbbUnidade.KeyValue   := qryGridCadContasID_UNIDADE.AsInteger;
  cbbTipoConta.KeyValue := qryGridCadContasID_TIPO_CONTA.AsInteger;

end;

procedure TfrmCadastroContas.qryGridCadContasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  PreencherCampos;
end;

function TfrmCadastroContas.ValidaCampos : Boolean;
var erro : Integer;
begin
  Result := False;
  erro := 0;
  if cbbStatus.ItemIndex = -1 then
  begin
    Inc(erro);
    ShowMessage('Campo Obrigat�rio!');
    cbbStatus.SetFocus;
  end
  else
  if cbbEmpresa.KeyValue = 0 then
  begin
    Inc(erro);
    ShowMessage('Campo Obrigat�rio!');
    cbbEmpresa.SetFocus;
  end
  else
  if cbbUnidade.KeyValue = 0 then
  begin
    Inc(erro);
    ShowMessage('Campo Obrigat�rio!');
    cbbUnidade.SetFocus;
  end
  else
  if cbbTipoConta.KeyValue = 0 then
  begin
    Inc(erro);
    ShowMessage('Campo Obrigat�rio!');
    cbbTipoConta.SetFocus;
  end
  else
  if Trim(edtDesc.Text) = '' then
  begin
    Inc(erro);
    ShowMessage('Campo Obrigat�rio!');
    edtDesc.SetFocus;
  end;
  Result := erro = 0;
  HabilitarBotoes(true);
end;

end.
