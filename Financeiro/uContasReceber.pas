unit uContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.Buttons, PngSpeedButton,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls, PngBitBtn, Vcl.Grids,
  Vcl.DBGrids, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  Data.DB, uADCompDataSet, uADCompClient, uDmPrincipal;

type
  TfrmContasReceber = class(TfrmComum)
    lblID: TLabel;
    lblCredor: TLabel;
    lblUnidade: TLabel;
    lblDescricao: TLabel;
    lblValor: TLabel;
    lblDataLancamento: TLabel;
    lblDataVencimento: TLabel;
    lblStatus: TLabel;
    lblObservacao: TLabel;
    edtID: TEdit;
    dtDtLancamento: TDateTimePicker;
    dtDtVencimento: TDateTimePicker;
    cbbUnidade: TDBLookupComboBox;
    edtValor: TEdit;
    edtCredor: TEdit;
    btnPesquisar: TPngBitBtn;
    grdContasReceber: TDBGrid;
    edtDescricao: TEdit;
    edtStatus: TEdit;
    memoObservacao: TMemo;
    qryContasReceber: TADQuery;
    qryUnidade: TADQuery;
    qryGridContasReceber: TADQuery;
    dsContasReceber: TDataSource;
    dsUnidade: TDataSource;
    dsGridContasReceber: TDataSource;
    qryGridContasReceberID: TIntegerField;
    qryGridContasReceberCOD_DEVEDOR: TIntegerField;
    qryGridContasReceberCREDOR: TStringField;
    qryGridContasReceberCOD_UN: TIntegerField;
    qryGridContasReceberUNIDADE: TStringField;
    qryGridContasReceberDESCRICAO: TStringField;
    qryGridContasReceberVALOR: TBCDField;
    qryGridContasReceberDATA_LANCAMENTO: TSQLTimeStampField;
    qryGridContasReceberDATA_VENCIMENTO: TSQLTimeStampField;
    qryGridContasReceberOBSERVACAO: TBlobField;
    qryGridContasReceberSTATUS: TStringField;
    qryUnidadeID: TIntegerField;
    qryUnidadeNOME: TStringField;
    qryUnidadeID_EMPRESA: TIntegerField;
    edtIdCredor: TEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grdContasReceberCellClick(Column: TColumn);
    procedure qryGridContasReceberAfterScroll(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtIdCredorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    operacao : string;
    procedure PreencherCampos;
    procedure HabilitarCampos (campos : Boolean);
    procedure Excluir;
    procedure Cancelar;
    function  PersistirDados (operacao : string) : Boolean;
    function  ValidarCampos : Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

{$R *.dfm}
uses
  uPesquisarCredor;
procedure TfrmContasReceber.btnCancelarClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(False);
  Cancelar;
end;

procedure TfrmContasReceber.btnEditarClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(True);
  PreencherCampos;
  operacao := 'E';
end;

procedure TfrmContasReceber.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
  Cancelar;
end;

procedure TfrmContasReceber.btnGravarClick(Sender: TObject);
begin
  inherited;
  PersistirDados(operacao);
end;

procedure TfrmContasReceber.btnNovoClick(Sender: TObject);
begin
  inherited;
  Cancelar;
  HabilitarCampos(True);
  operacao := 'I';
end;

procedure TfrmContasReceber.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmPesquisarCredor,frmPesquisarCredor);
  try
    frmPesquisarCredor.ShowModal;
    edtIdCredor.Text := frmPesquisarCredor.IdCredor;
    edtCredor.Text   := frmPesquisarCredor.NomeCredor;
  finally
    FreeAndNil(frmPesquisarCredor);
  end;
end;

procedure TfrmContasReceber.Cancelar;
begin
  edtID.Clear;
  edtStatus.Clear;
  edtIdCredor.Clear;
  edtCredor.Clear;
  edtValor.Clear;
  edtDescricao.Clear;
  dtDtLancamento.DateTime := Now;
  dtDtVencimento.DateTime := Now;
  cbbUnidade.KeyValue     := 0;
  memoObservacao.Clear;

end;

procedure TfrmContasReceber.edtIdCredorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    btnPesquisar.Click;
  end;
end;

procedure TfrmContasReceber.Excluir;
begin
  if edtID.Text = '' then
  begin
    ShowMessage('Selecione um registro para excluir!');
    Exit;
  end
  else if Application.MessageBox('Tem certeza que deseja excluir?', 'Excluir registro', + MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    with qryContasReceber do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM FIN_CONTAS_RECEBER WHERE ID = :ID');
      ParamByName('ID').AsInteger := StrToInt(edtID.Text);
      try
        ExecSQL;
        ShowMessage('Registro exclu�do!');
        qryGridContasReceber.Refresh;
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
    end;

  end;
end;

procedure TfrmContasReceber.FormActivate(Sender: TObject);
begin
  inherited;
  Cancelar;
  qryUnidade.Open;
  qryGridContasReceber.Open;
end;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  inherited;
  HabilitarCampos(false);
end;

procedure TfrmContasReceber.grdContasReceberCellClick(Column: TColumn);
begin
  inherited;
  PreencherCampos;
end;

procedure TfrmContasReceber.HabilitarCampos(campos: Boolean);
begin
  edtIdCredor.Enabled    := campos;
  edtCredor.Enabled      := campos;
  edtValor.Enabled       := campos;
  edtDescricao.Enabled   := campos;
  dtDtVencimento.Enabled := campos;
  cbbUnidade.Enabled     := campos;
  memoObservacao.Enabled := campos;
  btnPesquisar.Enabled   := campos;
end;

function TfrmContasReceber.PersistirDados(operacao: string): Boolean;
begin
  if ValidarCampos = False then
  begin
    Exit;
  end;
  with qryContasReceber do
  begin
    Close;
    SQL.Clear;
    if operacao = 'I' then
    begin
      SQL.Add('INSERT INTO FIN_CONTAS_RECEBER (ID_CREDOR, ID_UNIDADE, ID_USUARIO, DESCRICAO, VALOR, DATA_LANCAMENTO, DATA_VENCIMENTO, STATUS, OBSERVACAO)');
      SQL.Add('VALUES (:ID_CREDOR, :ID_UNIDADE, 1, :DESCRICAO, :VALOR, :DATA_LANCAMENTO, :DATA_VENCIMENTO, 0, :OBSERVACAO)');
    end
    else
    if operacao = 'E' then
    begin
      SQL.Add('UPDATE FIN_CONTAS_RECEBER SET ID_CREDOR = :ID_CREDOR, ID_UNIDADE = :ID_UNIDADE, DESCRICAO = :DESCRICAO,');
      SQL.Add('                      VALOR = :VALOR, DATA_LANCAMENTO = :DATA_LANCAMENTO, DATA_VENCIMENTO = :DATA_VENCIMENTO,');
      SQL.Add('                      OBSERVACAO = :OBSERVACAO');
      SQL.Add('                      WHERE ID = :ID');
      ParamByName('ID').AsInteger           := StrToInt(edtID.Text);
    end;
    try
      if edtIdCredor.Text = '' then
      begin
        ParamByName('ID_CREDOR').DataType   := ftInteger;
        ParamByName('ID_CREDOR').Clear;
      end
      else
      begin
        ParamByName('ID_CREDOR').AsInteger  := StrToInt(edtIdCredor.Text);
      end;
      ParamByName('ID_UNIDADE').AsInteger   := cbbUnidade.KeyValue;
      ParamByName('DESCRICAO').AsString     := edtDescricao.Text;
      ParamByName('VALOR').AsFloat          := StrToFloat(edtValor.Text);
      ParamByName('DATA_LANCAMENTO').AsDate := dtDtLancamento.DateTime;
      ParamByName('DATA_VENCIMENTO').AsDate := dtDtVencimento.DateTime;
      if memoObservacao.Text = '' then
      begin
        ParamByName('OBSERVACAO').DataType  := ftMemo;
        ParambyName('OBSERVACAO').Clear;
      end
      else
      begin
        ParamByName('OBSERVACAO').AsString  := memoObservacao.Text;
      end;
      ExecSQL;
      ShowMessage('Dados gravados com sucesso!');
      qryGridContasReceber.Refresh;
      HabilitarBotoes(False);
      HabilitarCampos(False);
    except
      Result := False;
      ShowMessage('Erro ao gravar dados!');
      HabilitarBotoes(True);
    end;
  end;

end;

procedure TfrmContasReceber.PreencherCampos;
begin
  qryUnidade.Close;
  qryUnidade.Open;
  edtID.Text          := qryGridContasReceberID.AsString;
  edtStatus.Text      := qryGridContasReceberSTATUS.AsString;
  edtIdCredor.Text    := qryGridContasReceberCOD_DEVEDOR.AsString;
  edtCredor.Text      := qryGridContasReceberCREDOR.AsString;
  edtValor.Text       := FormatFloat('0.00',qryGridContasReceberVALOR.AsFloat);
  edtDescricao.Text   := qryGridContasReceberDESCRICAO.AsString;
  dtDtLancamento.Date := qryGridContasReceberDATA_LANCAMENTO.AsDateTime;
  dtDtVencimento.Date := qryGridContasReceberDATA_VENCIMENTO.AsDateTime;
  cbbUnidade.KeyValue := qryGridContasReceberCOD_UN.AsInteger;
  memoObservacao.Text := qryGridContasReceberOBSERVACAO.AsString;

end;

procedure TfrmContasReceber.qryGridContasReceberAfterScroll(DataSet: TDataSet);
begin
  inherited;
  PreencherCampos;
end;

function TfrmContasReceber.ValidarCampos: Boolean;
var erro : Integer;
begin
  Result := False;
  erro := 0;
  if cbbUnidade.KeyValue = 0 then
  begin
  Inc(erro);
  ShowMessage('Campo obrigat�rio!');;
  cbbUnidade.SetFocus;
  end
  else
  if edtValor.Text = '' then
  begin
    Inc(erro);
    ShowMessage('Campo obrigat�rio!');
    edtValor.SetFocus;
  end
  else
  if edtDescricao.Text = '' then
  begin
    Inc(erro);
    ShowMessage('Campo obrigat�rio!');
    edtDescricao.SetFocus;
  end;
  Result := erro = 0;
  HabilitarCampos(True);
end;

end.
