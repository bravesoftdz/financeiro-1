unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnlBarraLateral: TPanel;
    pnlConteudo: TPanel;
    pnlSuperior: TPanel;
    edtPesquisar: TEdit;
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
    procedure FormShow(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AlterarTela(Acao : Char);
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uConfiguraBanco;

procedure TfrmPrincipal.btnConfiguracaoClick(Sender: TObject);
begin
  frmConfiguraBanco := TfrmConfiguraBanco.Create(frmPrincipal);
  frmConfiguraBanco.Visible := True;
  frmConfiguraBanco.AbrirConfiguracao;
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
end.
