unit uTiposConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.ExtCtrls, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, uDmPrincipal, Vcl.ComCtrls, Vcl.Buttons, PngSpeedButton,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmTiposConta = class(TfrmComum)
    qryTiposConta: TADQuery;
    dsTiposConta: TDataSource;
    edtID: TEdit;
    edtDescricao: TEdit;
    lblID: TLabel;
    lblDescricao: TLabel;
    DBGrid1: TDBGrid;
    qryGridTipoContas: TADQuery;
    dsGridTipoContas: TDataSource;
    qryGridTipoContasID: TIntegerField;
    qryGridTipoContasDESCRICAO: TStringField;
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    operacao : string;
    function PersisteDados (operacao : string) : Boolean;
    procedure Cancelar;
    procedure PreencheCampos;
    procedure Excluir;
    procedure HabilitarCamposTContas (status : boolean);
    function ValidarCampos : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTiposConta: TfrmTiposConta;

implementation

{$R *.dfm}

{ TfrmTiposConta }

procedure TfrmTiposConta.btnCancelarClick(Sender: TObject);
begin
  inherited;
  HabilitarCamposTContas(false);
  Cancelar;
end;

procedure TfrmTiposConta.btnEditarClick(Sender: TObject);
begin
  inherited;
  HabilitarCamposTContas(true);
  PreencheCampos;
  operacao := 'E';
end;

procedure TfrmTiposConta.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
  Cancelar;
  qryGridTipoContas.Refresh;
end;

procedure TfrmTiposConta.btnGravarClick(Sender: TObject);
begin
  inherited;
  PersisteDados(operacao);
  qryGridTipoContas.Refresh;
end;

procedure TfrmTiposConta.btnNovoClick(Sender: TObject);
begin
  inherited;
  Cancelar;
  HabilitarCamposTContas(true);
  operacao := 'I';
end;

procedure TfrmTiposConta.Cancelar;
  var i: Integer;
begin
  for i := 0 to ComponentCount -1 do
  if Components[i] is TEdit then
  begin
    TEdit(Components[i]).Text := '';
  end;

end;

procedure TfrmTiposConta.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  PreencheCampos;
end;

procedure TfrmTiposConta.Excluir;
begin
  if edtID.Text = '' then
  begin
    ShowMessage('Selecione um registro para excluir!');
    Exit;
  end
  else
  if Application.MessageBox('Tem certeza que deseja excluir?', 'Exluir Registro', MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    with qryTiposConta do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM FIN_TIPO_CONTAS WHERE ID = :ID');
      ParamByName('ID').AsInteger := StrToInt(edtID.Text);
      try
        ExecSQL;
        ShowMessage('Registro Excluido!');
        qryGridTipoContas.Refresh;
      except
        on E:Exception do
        begin
            if Pos('FOREIGN', E.Message) > 0 then
            begin
              ShowMessage('N�o � poss�vel excluir um registro com v�nculos!');
            end
            else
              ShowMessage('Erro ao excluir registro!');
        end

      end;
    end
  end
  else
  begin
    Cancelar;
    qryGridTipoContas.Refresh;
  end;

end;

procedure TfrmTiposConta.FormActivate(Sender: TObject);
begin
  inherited;
  qryGridTipoContas.Open;
end;

procedure TfrmTiposConta.FormCreate(Sender: TObject);
begin
  inherited;
  HabilitarCamposTContas(false);

end;

procedure TfrmTiposConta.HabilitarCamposTContas(status: boolean);
begin
  edtDescricao.Enabled := status;
end;

function TfrmTiposConta.PersisteDados(operacao: string): Boolean;
begin
  if ValidarCampos = False then
  begin
    Exit;
  end;
  with qryTiposConta do
  begin
    Close;
    SQL.Clear;
    if operacao = 'I' then
    begin
      SQL.Add('INSERT INTO FIN_TIPO_CONTAS (ID, DESCRICAO) VALUES (:ID, :DESCRICAO)')
    end
    else
    if operacao = 'E' then
    begin
      SQL.Add('UPDATE FIN_TIPO_CONTAS SET DESCRICAO = :DESCRICAO WHERE ID = :ID');
      ParamByName('ID').AsInteger        := StrToInt(edtID.Text);
    end;
    try
      ParamByName('DESCRICAO').AsString := edtDescricao.Text;
      ExecSQL;
      ShowMessage('Dados gravados com sucesso!');
      qryGridTipoContas.Refresh;
      Result := True;
      HabilitarBotoes(false);
      HabilitarCamposTContas(false);
    except
      Result := False;
      ShowMessage('Erro ao gravar dados!');
    end;

  end;
end;

procedure TfrmTiposConta.PreencheCampos;
begin
  with qryGridTipoContas do
    begin
      edtID.Text := qryGridTipoContasID.AsString;
      edtDescricao.Text := qryGridTipoContasDESCRICAO.AsString;
    end;
end;

function TfrmTiposConta.ValidarCampos: Boolean;
var erro : Integer;
begin
  Result := False;
  erro := 0;
  if edtDescricao.Text = '' then
  begin
    Inc(erro);
    ShowMessage('Campo obrigat�rio!');
    edtDescricao.SetFocus;
  end;
  Result := erro = 0;
  HabilitarBotoes(true);
end;

end.
