unit uLancamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.Buttons, PngSpeedButton,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBLookup, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager,
  uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB,
  uADCompDataSet, uADCompClient, uDmPrincipal, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TfrmLancamentos = class(TfrmComum)
    edtID: TEdit;
    ID: TLabel;
    lblConta: TLabel;
    lblCategoria: TLabel;
    lblTipo: TLabel;
    cbbTipo: TComboBox;
    lblData: TLabel;
    lblValor: TLabel;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    grdLancamentos: TDBGrid;
    qryLancamentos: TADQuery;
    qryContas: TADQuery;
    qryCategoria: TADQuery;
    qryGridLancamentos: TADQuery;
    dsGirdLancamentos: TDataSource;
    dsCategoria: TDataSource;
    dsContas: TDataSource;
    dsLancamentos: TDataSource;
    qryGridLancamentosID: TIntegerField;
    qryGridLancamentosDESCRICAO: TStringField;
    qryGridLancamentosCATEGORIA: TStringField;
    qryGridLancamentosID_CONTAS: TIntegerField;
    qryGridLancamentosCONTA: TStringField;
    qryGridLancamentosVALOR: TBCDField;
    qryGridLancamentosDATA: TSQLTimeStampField;
    qryGridLancamentosTIPO: TStringField;
    edtValor: TEdit;
    qryContasDESCRICAO: TStringField;
    qryContasSTATUS: TIntegerField;
    cbbCategoria: TDBLookupComboBox;
    cbbContas: TDBLookupComboBox;
    qryCategoriaID: TIntegerField;
    qryCategoriaDESCRICAO: TStringField;
    qryGridLancamentosID_UNIDADE: TIntegerField;
    qryGridLancamentosID_CATEGORIA: TIntegerField;
    qryGridLancamentosCBBTIPO: TStringField;
    cbbUnidade: TDBLookupComboBox;
    lblUnidade: TLabel;
    dsUnidade: TDataSource;
    qryUnidade: TADQuery;
    qryUnidadeID: TIntegerField;
    qryUnidadeNOME: TStringField;
    qryContasID_CONTAS: TIntegerField;
    dtData: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryGridLancamentosAfterScroll(DataSet: TDataSet);
    procedure grdLancamentosCellClick(Column: TColumn);
    procedure cbbUnidadeCloseUp(Sender: TObject);
    procedure cbbUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure cbbUnidadeClick(Sender: TObject);
  private
    operacao : string;
    procedure PreencherCampos;
    procedure HabilitaCampos(status : Boolean);
    procedure Exculir;
    procedure Cancelar;
    function PersisteDados (operacao : string) : Boolean;
    function ValidarCampos : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancamentos: TfrmLancamentos;

implementation

{$R *.dfm}

procedure TfrmLancamentos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  qryContas.Close;
  qryGridLancamentos.Refresh;
  Cancelar;
  HabilitaCampos(False);
end;

procedure TfrmLancamentos.btnEditarClick(Sender: TObject);
begin
  inherited;
  HabilitaCampos(True);
  PreencherCampos;
  operacao := 'E';
end;

procedure TfrmLancamentos.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Exculir;
  Cancelar;
end;

procedure TfrmLancamentos.btnGravarClick(Sender: TObject);
begin
  inherited;
  PersisteDados(operacao);
end;

procedure TfrmLancamentos.btnNovoClick(Sender: TObject);
begin
  inherited;
  Cancelar;
  HabilitaCampos(True);
  operacao := 'I';
  qryContas.Close;
end;

procedure TfrmLancamentos.Cancelar;
begin
  edtID.Clear;
  dtData.DateTime := Now;
  cbbTipo.ClearSelection;
  cbbUnidade.KeyValue      := 0;
  cbbContas.KeyValue       := 0;
  cbbCategoria.KeyValue    := 0;
  edtValor.Clear;
  edtDescricao.Clear;
end;

procedure TfrmLancamentos.cbbUnidadeClick(Sender: TObject);
begin
  inherited;
  qryContas.Close;
end;

procedure TfrmLancamentos.cbbUnidadeCloseUp(Sender: TObject);
begin
  inherited;
  with qryContas do
  begin
    if cbbUnidade.KeyValue = 0 then
    begin
      Close;
    end
    else
    begin
      ParamByName('ID_UNIDADE').AsInteger := qryUnidadeID.AsInteger;
      Open;
    end;

  end;
end;

procedure TfrmLancamentos.cbbUnidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  cbbUnidadeCloseUp(cbbContas);
end;

procedure TfrmLancamentos.Exculir;
begin
  if edtID.Text = '' then
  begin
    ShowMessage('Selecione um registro para excluir!');
    Exit;
  end
  else
  if Application.MessageBox('Tem certeza que deseja excluir?', 'Excluir registro', MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    with qryLancamentos do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM FIN_LANCAMENTOS WHERE ID = :ID');
      ParamByName('ID').AsInteger := StrToInt(edtID.Text);
      try
        ExecSQL;
        ShowMessage('Registro excluído!');
        qryGridLancamentos.Refresh;
      except
        on E:Exception do
        begin
          if Pos('FOREIGN', E.Message) > 0 then
          begin
            ShowMessage('Não é possível excluir um registro com vínculos!');
          end
          else
            ShowMessage('Erro ao excluir registro!');
        end;
      end;
    end;
  end
  else
  begin
    Cancelar;
    qryGridLancamentos.Refresh;
  end;
end;

procedure TfrmLancamentos.FormActivate(Sender: TObject);
begin
  inherited;
  qryGridLancamentos.Open;
  qryUnidade.Open;
  qryCategoria.Open;
  Cancelar;
end;

procedure TfrmLancamentos.FormCreate(Sender: TObject);
begin
  inherited;
  HabilitaCampos(false);
end;

procedure TfrmLancamentos.grdLancamentosCellClick(Column: TColumn);
begin
  inherited;
  PreencherCampos;
end;

procedure TfrmLancamentos.HabilitaCampos(status: Boolean);
begin
  dtData.Enabled       := status;
  cbbUnidade.Enabled   := status;
  cbbContas.Enabled    := status;
  cbbTipo.Enabled      := status;
  cbbCategoria.Enabled := status;
  edtValor.Enabled     := status;
  edtDescricao.Enabled := status;
end;

function TfrmLancamentos.PersisteDados(operacao: string): Boolean;
begin
  if ValidarCampos = False then
  begin
    Exit;
  end;
  with qryLancamentos do
  begin
    Close;
    SQL.Clear;
    if operacao = 'I' then
    begin
      SQL.Add('INSERT INTO FIN_LANCAMENTOS (DESCRICAO, ID_CATEGORIA, ID_CONTAS, VALOR, DATA, ID_USUARIO, TIPO, ID_UNIDADE)');
      SQL.Add('VALUES (:DESCRICAO, :ID_CATEGORIA, :ID_CONTAS, :VALOR, :DATA, 1, :TIPO, :ID_UNIDADE)');

    end
    else
    if operacao = 'E' then
    begin
      SQL.Add('UPDATE FIN_LANCAMENTOS SET DESCRICAO = :DESCRICAO, ID_CATEGORIA = :ID_CATEGORIA, ID_CONTAS = :ID_CONTAS, VALOR = :VALOR, DATA = :DATA, ID_USUARIO = 1, TIPO = :TIPO, ID_UNIDADE = :ID_UNIDADE WHERE ID = :ID');
      ParamByName('ID').AsInteger           := StrToInt(edtID.Text);
    end;
    try
      ParamByName('DESCRICAO').AsString     := Trim(edtDescricao.Text);
      ParamByName('ID_CATEGORIA').AsInteger := cbbCategoria.KeyValue;
      ParamByName('ID_CONTAS').AsInteger    := cbbContas.KeyValue;
      ParamByName('VALOR').AsFloat          := StrToFloat(edtValor.Text);
      ParamByName('DATA').AsDateTime        := dtData.DateTime;
      if cbbTipo.ItemIndex = 1 then
      begin
        ParamByName('TIPO').AsString        := 'D';
      end
      else
      begin
        ParamByName('TIPO').AsString        := 'C';
      end;
      ParamByName('ID_UNIDADE').AsInteger   := cbbUnidade.KeyValue;
      ExecSQL;
      ShowMessage('Dados gravados com sucesso!');
      qryGridLancamentos.Refresh;
      Result := True;
      HabilitaCampos(False);
      HabilitarBotoes(False);
    except
      Result := False;
      ShowMessage('Erro ao gravar dados!');
    end;
  end;
end;

procedure TfrmLancamentos.PreencherCampos;
begin
  qryUnidade.Close;
  qryUnidade.Open;
  qryContas.Close;
  qryContas.Open;
  qryCategoria.Close;
  qryCategoria.Open;
  cbbUnidadeCloseUp(cbbContas);
  edtID.Text            := qryGridLancamentosID.AsString;
  dtData.Date           := qryGridLancamentosDATA.AsDateTime;
  edtValor.Text         := FormatFloat('0.00',qryGridLancamentosVALOR.AsFloat);
  edtDescricao.Text     := qryGridLancamentosDESCRICAO.AsString;
  cbbUnidade.KeyValue   := qryGridLancamentosID_UNIDADE.AsInteger;
  cbbContas.KeyValue    := qryGridLancamentosID_CONTAS.AsInteger;
  cbbCategoria.KeyValue := qryGridLancamentosID_CATEGORIA.AsInteger;
  cbbTipo.ItemIndex     := qryGridLancamentosCBBTIPO.AsInteger;

end;

procedure TfrmLancamentos.qryGridLancamentosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  PreencherCampos;
end;

function TfrmLancamentos.ValidarCampos: Boolean;
var erro: Integer;
begin
  Result := False;
  erro := 0;
  if cbbUnidade.KeyValue = 0 then
  begin
    Inc(erro);
    ShowMessage('Campo obrigatório!');
    cbbUnidade.SetFocus;
  end
  else
  if cbbContas.KeyValue = 0 then
  begin
    Inc(erro);
    ShowMessage('Campo obrigatório!');
    cbbContas.SetFocus;
  end
  else
  if cbbTipo.ItemIndex = -1 then
  begin
    Inc(erro);
    ShowMessage('Campo obrigatório!');
    cbbTipo.SetFocus;
  end
  else
  if cbbCategoria.KeyValue = 0 then
  begin
    Inc(erro);
    ShowMessage('Campo obrigatório!');
    cbbCategoria.SetFocus;
  end
  else
  if Trim(edtValor.Text) = '' then
  begin
    Inc(erro);
    ShowMessage('Campo obrigatório!');
    edtValor.SetFocus;
  end
  else
  if Trim(edtDescricao.Text) = '' then
  begin
    Inc(erro);
    ShowMessage('Campo obrigatório!');
    edtDescricao.SetFocus;
  end;
  Result := erro = 0;
  HabilitarBotoes(True);

end;

end.
