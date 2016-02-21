unit uContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.Buttons, PngSpeedButton,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls, PngBitBtn, Vcl.Grids,
  Vcl.DBGrids, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  Data.DB, uADCompDataSet, uADCompClient, uDmPrincipal;

type
  TfrmContasPagar = class(TfrmComum)
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
    grdContasPagar: TDBGrid;
    edtDescricao: TEdit;
    edtStatus: TEdit;
    memoObservacao: TMemo;
    qryContasPagar: TADQuery;
    qryUnidade: TADQuery;
    qryGridContasPagar: TADQuery;
    dsContasPagar: TDataSource;
    dsUnidade: TDataSource;
    dsGridContasPagar: TDataSource;
    qryGridContasPagarID: TIntegerField;
    qryGridContasPagarCOD_DEVEDOR: TIntegerField;
    qryGridContasPagarCREDOR: TStringField;
    qryGridContasPagarCOD_UN: TIntegerField;
    qryGridContasPagarUNIDADE: TStringField;
    qryGridContasPagarDESCRICAO: TStringField;
    qryGridContasPagarVALOR: TBCDField;
    qryGridContasPagarDATA_LANCAMENTO: TSQLTimeStampField;
    qryGridContasPagarDATA_VENCIMENTO: TSQLTimeStampField;
    qryGridContasPagarOBSERVACAO: TBlobField;
    qryGridContasPagarSTATUS: TStringField;
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
    procedure grdContasPagarCellClick(Column: TColumn);
    procedure qryGridContasPagarAfterScroll(DataSet: TDataSet);
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
  frmContasPagar: TfrmContasPagar;

implementation

{$R *.dfm}
uses
  uPesquisarCredor;
procedure TfrmContasPagar.btnCancelarClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(False);
  Cancelar;
end;

procedure TfrmContasPagar.btnEditarClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(True);
  PreencherCampos;
  operacao := 'E';
end;

procedure TfrmContasPagar.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
  Cancelar;
end;

procedure TfrmContasPagar.btnGravarClick(Sender: TObject);
begin
  inherited;
  PersistirDados(operacao);
end;

procedure TfrmContasPagar.btnNovoClick(Sender: TObject);
begin
  inherited;
  Cancelar;
  HabilitarCampos(True);
  operacao := 'I';
end;

procedure TfrmContasPagar.btnPesquisarClick(Sender: TObject);
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

procedure TfrmContasPagar.Cancelar;
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

procedure TfrmContasPagar.edtIdCredorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    btnPesquisar.Click;
  end;
end;

procedure TfrmContasPagar.Excluir;
begin
  if edtID.Text = '' then
  begin
    ShowMessage('Selecione um registro para excluir!');
    Exit;
  end
  else if Application.MessageBox('Tem certeza que deseja excluir?', 'Excluir registro', + MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    with qryContasPagar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM FIN_CONTAS_PAGAR WHERE ID = :ID');
      ParamByName('ID').AsInteger := StrToInt(edtID.Text);
      try
        ExecSQL;
        ShowMessage('Registro exclu�do!');
        qryGridContasPagar.Refresh;
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

procedure TfrmContasPagar.FormActivate(Sender: TObject);
begin
  inherited;
  Cancelar;
  qryUnidade.Open;
  qryGridContasPagar.Open;
end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  inherited;
  HabilitarCampos(false);
end;

procedure TfrmContasPagar.grdContasPagarCellClick(Column: TColumn);
begin
  inherited;
  PreencherCampos;
end;

procedure TfrmContasPagar.HabilitarCampos(campos: Boolean);
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

function TfrmContasPagar.PersistirDados(operacao: string): Boolean;
begin
  if ValidarCampos = False then
  begin
    Exit;
  end;
  with qryContasPagar do
  begin
    Close;
    SQL.Clear;
    if operacao = 'I' then
    begin
      SQL.Add('INSERT INTO FIN_CONTAS_PAGAR (ID_DEVEDOR, ID_UNIDADE, ID_USUARIO, DESCRICAO, VALOR, DATA_LANCAMENTO, DATA_VENCIMENTO, STATUS, OBSERVACAO)');
      SQL.Add('VALUES (:COD_DEVEDOR, :ID_UNIDADE, 1, :DESCRICAO, :VALOR, :DATA_LANCAMENTO, :DATA_VENCIMENTO, 0, :OBSERVACAO)');
    end
    else
    if operacao = 'E' then
    begin
      SQL.Add('UPDATE FIN_CONTAS_PAGAR SET ID_DEVEDOR = :COD_DEVEDOR, ID_UNIDADE = :ID_UNIDADE, DESCRICAO = :DESCRICAO,');
      SQL.Add('                      VALOR = :VALOR, DATA_LANCAMENTO = :DATA_LANCAMENTO, DATA_VENCIMENTO = :DATA_VENCIMENTO,');
      SQL.Add('                      OBSERVACAO = :OBSERVACAO');
      SQL.Add('                      WHERE ID = :ID');
      ParamByName('ID').AsInteger            := StrToInt(edtID.Text);
    end;
    try
      if edtIdCredor.Text = '' then
      begin
        ParamByName('COD_DEVEDOR').DataType  := ftInteger;
        ParamByName('COD_DEVEDOR').Clear;
      end
      else
      begin
        ParamByName('COD_DEVEDOR').AsInteger := StrToInt(edtIdCredor.Text);
      end;
      ParamByName('ID_UNIDADE').AsInteger    := cbbUnidade.KeyValue;
      ParamByName('DESCRICAO').AsString      := edtDescricao.Text;
      ParamByName('VALOR').AsFloat           := StrToFloat(edtValor.Text);
      ParamByName('DATA_LANCAMENTO').AsDate  := dtDtLancamento.DateTime;
      ParamByName('DATA_VENCIMENTO').AsDate  := dtDtVencimento.DateTime;
      if memoObservacao.Text = '' then
      begin
        ParamByName('OBSERVACAO').DataType   := ftMemo;
        ParamByName('OBSERVACAO').Clear;
      end
      else
      begin
        ParamByName('OBSERVACAO').AsString   := memoObservacao.Text;
      end;
      ExecSQL;
      ShowMessage('Dados gravados com sucesso!');
      qryGridContasPagar.Refresh;
      HabilitarBotoes(False);
      HabilitarCampos(False);
    except
      Result := False;
      ShowMessage('Erro ao gravar dados!');
      HabilitarBotoes(True);
    end;
  end;

end;

procedure TfrmContasPagar.PreencherCampos;
begin
  qryUnidade.Close;
  qryUnidade.Open;
  edtID.Text          := qryGridContasPagarID.AsString;
  edtStatus.Text      := qryGridContasPagarSTATUS.AsString;
  edtIdCredor.Text    := qryGridContasPagarCOD_DEVEDOR.AsString;
  edtCredor.Text      := qryGridContasPagarCREDOR.AsString;
  edtValor.Text       := FormatFloat('0.00',qryGridContasPagarVALOR.AsFloat);
  edtDescricao.Text   := qryGridContasPagarDESCRICAO.AsString;
  dtDtLancamento.Date := qryGridContasPagarDATA_LANCAMENTO.AsDateTime;
  dtDtVencimento.Date := qryGridContasPagarDATA_VENCIMENTO.AsDateTime;
  cbbUnidade.KeyValue := qryGridContasPagarCOD_UN.AsInteger;
  memoObservacao.Text := qryGridContasPagarOBSERVACAO.AsString;

end;

procedure TfrmContasPagar.qryGridContasPagarAfterScroll(DataSet: TDataSet);
begin
  inherited;
  PreencherCampos;
end;

function TfrmContasPagar.ValidarCampos: Boolean;
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
