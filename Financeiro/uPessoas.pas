unit uPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.Buttons, PngSpeedButton,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, uDmPrincipal,
  uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager,
  uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB,
  uADCompDataSet, uADCompClient;

type
  TfrmPessoas = class(TfrmComum)
    lblID: TLabel;
    lblTipo: TLabel;
    lblNome: TLabel;
    lblDataCadastro: TLabel;
    edtID: TEdit;
    edtNome: TEdit;
    dtDataCadastro: TDateTimePicker;
    cbbTipo: TComboBox;
    grdPessoas: TDBGrid;
    qryPessoas: TADQuery;
    qryGridPessoas: TADQuery;
    dsPessoas: TDataSource;
    dsGridPessoas: TDataSource;
    qryGridPessoasID: TIntegerField;
    qryGridPessoasNOME: TStringField;
    qryGridPessoasTIPO: TStringField;
    qryGridPessoasCBBTIPO: TStringField;
    qryGridPessoasDATA_CADASTRO: TSQLTimeStampField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure grdPessoasCellClick(Column: TColumn);
    procedure qryGridPessoasAfterScroll(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
  private
    operacao : string;
    procedure Cancelar;
    procedure HabilitarCampos(campos : Boolean);
    procedure PreencherCampos;
    procedure Excluir;
    function  PersistirDados(operacao : string): Boolean;
    function  ValidarCampos : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

{$R *.dfm}

{ TfrmPessoas }

procedure TfrmPessoas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(False);
  Cancelar;
end;

procedure TfrmPessoas.btnEditarClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(True);
  PreencherCampos;
  operacao := 'E';
end;

procedure TfrmPessoas.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
  Cancelar;
  qryGridPessoas.Refresh;
end;

procedure TfrmPessoas.btnGravarClick(Sender: TObject);
begin
  inherited;
  PersistirDados(operacao);
end;

procedure TfrmPessoas.btnNovoClick(Sender: TObject);
begin
  inherited;
  Cancelar;
  HabilitarCampos(True);
  operacao := 'I';

end;

procedure TfrmPessoas.Cancelar;
begin
  edtID.Clear;
  dtDataCadastro.DateTime := Now;
  cbbTipo.ClearSelection;
  edtNome.Clear;
end;

procedure TfrmPessoas.Excluir;
begin
  if edtID.Text = '' then
  begin
    ShowMessage('Selecione um registro para excluir!');
    Exit;
  end
  else
  if Application.MessageBox('Tem certeza que deseja excluir?', 'Excluir registro', MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    with qryPessoas do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM PES_PESSOAS WHERE ID = :ID');
      ParamByName('ID').AsInteger := StrToInt(edtID.Text);
      try
        ExecSQL;
        ShowMessage('Registro exclu�do!');
        qryGridPessoas.Refresh;
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
  end
  else
  begin
    Cancelar;
    qryGridPessoas.Refresh;
  end;
end;

procedure TfrmPessoas.FormActivate(Sender: TObject);
begin
  inherited;
  qryGridPessoas.Open;
  Cancelar;
end;

procedure TfrmPessoas.FormCreate(Sender: TObject);
begin
  inherited;
  HabilitarCampos(false);
end;

procedure TfrmPessoas.grdPessoasCellClick(Column: TColumn);
begin
  inherited;
  PreencherCampos;
end;

procedure TfrmPessoas.HabilitarCampos(campos: Boolean);
begin
  cbbTipo.Enabled        := campos;
  edtNome.Enabled        := campos;
end;

function TfrmPessoas.PersistirDados(operacao: string): Boolean;
begin
  if ValidarCampos = False then
  begin
    Exit;
  end;
  with qryPessoas do
  begin
    Close;
    SQL.Clear;
    if operacao = 'I' then
    begin
      SQL.Add('INSERT INTO PES_PESSOAS (NOME, TIPO, DATA_CADASTRO)');
      SQL.Add('VALUES (:NOME, :TIPO, :DATA_CADASTRO)');
      ParamByName('DATA_CADASTRO').AsDateTime := dtDataCadastro.DateTime;
    end
    else
    if operacao = 'E' then
    begin
      SQL.Add('UPDATE PES_PESSOAS SET NOME = :NOME, TIPO = :TIPO WHERE ID = :ID');
      ParamByName('ID').AsInteger             := StrToInt(edtID.Text);
    end;
    try
      ParamByName('NOME').AsString            := edtNome.Text;
      if cbbTipo.ItemIndex = 0 then
      begin
        ParamByName('TIPO').AsString          := 'F';
      end
      else
      begin
        ParamByName('TIPO').AsString          := 'J';
      end;
      ExecSQL;
      ShowMessage('Dados gravados com sucesso!');
      qryGridPessoas.Refresh;
      Result := True;
      HabilitarCampos(False);
      HabilitarBotoes(False);
    except
      Result := False;
      ShowMessage('Erro ao gravar dados!');
    end;

  end;
  
end;

procedure TfrmPessoas.PreencherCampos;
begin
  edtID.Text          := qryGridPessoasID.AsString;
  dtDataCadastro.Date := qryGridPessoasDATA_CADASTRO.AsDateTime;
  cbbTipo.ItemIndex   := qryGridPessoasCBBTIPO.AsInteger;
  edtNome.Text        := qryGridPessoasNOME.AsString;
end;

procedure TfrmPessoas.qryGridPessoasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  PreencherCampos;
end;

function TfrmPessoas.ValidarCampos: Boolean;
  var erro : Integer;
begin
  Result := False;
  erro := 0;
  if cbbTipo.ItemIndex = -1 then
  begin
    Inc(erro);
    ShowMessage('Campo obrigat�rio!');
    cbbTipo.SetFocus;
  end
  else
  if Trim(edtNome.Text) = '' then
  begin
    Inc(erro);
    ShowMessage('Campo obrigat�rio!');
    edtNome.SetFocus;
  end;
  Result := erro = 0;
  HabilitarBotoes(True);
end;

end.