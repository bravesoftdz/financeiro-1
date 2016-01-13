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
    btnInicial: TSpeedButton;
    btnMenu: TSpeedButton;
    btnFavorito: TSpeedButton;
    btnConfiguracao: TSpeedButton;
    btnUsuario: TSpeedButton;
    pnlMenu: TPanel;
    btnContasReceber: TSpeedButton;
    btnContasPagar: TSpeedButton;
    btnLancamentos: TSpeedButton;
    btnPessoas: TSpeedButton;
    btnCadContas: TSpeedButton;
    pnlJanela: TPanel;
    pnlSuperior: TPanel;
    edtPesquisar: TEdit;
    btnVoltar: TPngSpeedButton;
    pnlTitulo: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCadContasClick(Sender: TObject);
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
  uConfiguraBanco, uLogin, uCadContas, uDmPrincipal, uTiposConta;

procedure TfrmPrincipal.btnCadContasClick(Sender: TObject);
begin
AbrirTela(TfrmCadastroContas);
end;

procedure TfrmPrincipal.btnConfiguracaoClick(Sender: TObject);
begin
  AbrirTela(TfrmConfiguraBanco);
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

procedure TfrmPrincipal.btnUsuarioClick(Sender: TObject);
begin
  AbrirTela(TfrmLogin);
end;

procedure TfrmPrincipal.btnVoltarClick(Sender: TObject);
begin
  FecharTela;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  AlterarTela('F');
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
    else ShowMessage('Opção inválida.');
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
