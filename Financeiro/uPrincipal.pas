unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  PngSpeedButton;

type
  TfrmPrincipal = class(TForm)
    pnlBarraLateral: TPanel;
    pnlConteudo: TPanel;
    pnlMenu: TPanel;
    pnlJanela: TPanel;
    pnlSuperior: TPanel;
    edtPesquisar: TEdit;
    btnVoltar: TPngSpeedButton;
    pnlTitulo: TPanel;
    btnCadTipoConta: TPngSpeedButton;
    btnCadContas: TPngSpeedButton;
    btnLancamentos: TPngSpeedButton;
    btnRelatorios: TPngSpeedButton;
    btnConfigurarBanco: TPngSpeedButton;
    btnPessoas: TPngSpeedButton;
    btnLogoff: TPngSpeedButton;
    btnContasReceber: TPngSpeedButton;
    btnContasPagar: TPngSpeedButton;
    btnFavoritos: TPngSpeedButton;
    btnPrincipal: TPngSpeedButton;
    btnMenu: TPngSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCadContasClick(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnCadTipoContaClick(Sender: TObject);
    procedure btnLancamentosClick(Sender: TObject);
    procedure btnPessoasClick(Sender: TObject);
    procedure btnConfigurarBancoClick(Sender: TObject);
    procedure btnLogoffClick(Sender: TObject);
    procedure PngSpeedButton3Click(Sender: TObject);
    procedure btnContasPagarClick(Sender: TObject);
    procedure btnContasReceberClick(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
  private
    procedure AbrirTela(Form: TComponentClass);
    procedure FecharTela;
    { Private declarations }
  public
    procedure AlterarTela(Acao : Char);

    { Public declarations }
  end;

var
  frmPrincipal : TfrmPrincipal;
  FormPrincipal: TForm;

implementation

{$R *.dfm}

uses
  uConfiguraBanco, uLogin, uCadContas, uDmPrincipal, uTiposConta, uLancamentos, uPessoas, uContasPagar, uContasReceber, uRelatorios;

procedure TfrmPrincipal.btnCadContasClick(Sender: TObject);
begin
AbrirTela(TfrmCadastroContas);
pnlTitulo.Caption := 'Cadastro de Contas';
end;

procedure TfrmPrincipal.btnCadTipoContaClick(Sender: TObject);
begin
  AbrirTela(TfrmTiposConta);
  pnlTitulo.Caption := 'Cadastro Tipo de Conta';
end;

procedure TfrmPrincipal.btnConfiguracaoClick(Sender: TObject);
begin
  AbrirTela(TfrmConfiguraBanco);
  pnlTitulo.Caption := 'Configurar Banco de Dados';
end;

procedure TfrmPrincipal.btnContasPagarClick(Sender: TObject);
begin
  AbrirTela(TFrmContasPagar);
  pnlTitulo.Caption := 'Contas � Pagar';
end;

procedure TfrmPrincipal.btnMenuClick(Sender: TObject);
begin
  if pnlMenu.Visible then
  begin
    AlterarTela('F')
  end
  else
  begin
    AlterarTela('A');
  end;
end;

procedure TfrmPrincipal.btnPessoasClick(Sender: TObject);
begin
  AbrirTela(TfrmPessoas);
end;

procedure TfrmPrincipal.btnRelatoriosClick(Sender: TObject);
begin
  AbrirTela(TfrmRelatorios);
  pnlTitulo.Caption := 'Relat�rios';
end;

procedure TfrmPrincipal.btnUsuarioClick(Sender: TObject);
begin
  AbrirTela(TfrmLogin);
end;

procedure TfrmPrincipal.btnVoltarClick(Sender: TObject);
begin
  FecharTela;
  pnlTitulo.Caption := 'Financeiro';
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  AlterarTela('F');
end;

procedure TfrmPrincipal.btnConfigurarBancoClick(Sender: TObject);
begin
  AbrirTela(TfrmConfiguraBanco);
  pnlTitulo.Caption := 'Configurar Banco de Dados'
end;

procedure TfrmPrincipal.PngSpeedButton3Click(Sender: TObject);
begin
  AbrirTela(TfrmPessoas);
  pnlTitulo.Caption := 'Pessoas';
end;

procedure TfrmPrincipal.btnLogoffClick(Sender: TObject);
begin
  AbrirTela(TfrmLogin);
  pnlTitulo.Caption := 'Trocar de Usu�rio'
end;

procedure TfrmPrincipal.btnContasReceberClick(Sender: TObject);
begin
  AbrirTela(TfrmContasReceber);
  pnlTitulo.Caption := 'Contas � Receber'
end;

procedure TfrmPrincipal.btnLancamentosClick(Sender: TObject);
begin
  AbrirTela(TfrmLancamentos);
  pnlTitulo.Caption := 'Lan�amentos';
end;

procedure TfrmPrincipal.AlterarTela(Acao : Char);
begin
  case Acao of
    'A':
    begin
      pnlBarraLateral.Width := 241;
      pnlMenu.Visible := True;
    end;
    'F':
    begin
      pnlBarraLateral.Width := 41;
      pnlMenu.Visible := False;
    end;
    else ShowMessage('Op��o inv�lida.');
  end;
end;

procedure TfrmPrincipal.AbrirTela(Form: TComponentClass);
begin
  btnVoltar.Visible := True;

  Application.CreateForm(Form,TForm(Form));
  FormPrincipal := TForm(Form);
  TForm(FormPrincipal).Visible := True;
  TForm(FormPrincipal).Dock(frmPrincipal.pnlJanela,frmPrincipal.pnlJanela.ClientRect);

  AlterarTela('F');
end;

procedure TfrmPrincipal.FecharTela;
begin
  btnVoltar.Visible := False;

  FormPrincipal.Visible := False;
  FreeAndNil(FormPrincipal);

  AlterarTela('F');
end;

end.
