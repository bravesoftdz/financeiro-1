unit uComum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  PngSpeedButton;

type
  TfrmComum = class(TForm)
    pnlStatus: TPanel;
    pnlBotoes: TPanel;
    pnlCentro: TPanel;
    pnlTitulo: TPanel;
    btnNovo: TPngSpeedButton;
    btnGravar: TPngSpeedButton;
    btnEditar: TPngSpeedButton;
    btnCancelar: TPngSpeedButton;
    btnExcluir: TPngSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    procedure HabilitarBotoes(status : Boolean);
    { Public declarations }
  end;

var
  frmComum: TfrmComum;

implementation

{$R *.dfm}

{ TfrmComum }



{ TfrmComum }

{ TfrmComum }

procedure TfrmComum.btnCancelarClick(Sender: TObject);
begin
  HabilitarBotoes(False);
end;

procedure TfrmComum.btnEditarClick(Sender: TObject);
begin
  HabilitarBotoes(True);
end;

procedure TfrmComum.btnGravarClick(Sender: TObject);
begin
  HabilitarBotoes(false);
end;

procedure TfrmComum.btnNovoClick(Sender: TObject);
begin
  HabilitarBotoes(True);
end;

procedure TfrmComum.FormCreate(Sender: TObject);
begin
  HabilitarBotoes(false);
end;

procedure TfrmComum.HabilitarBotoes(status: Boolean);
begin
  btnNovo.Enabled      := not status;
  btnGravar.Enabled    := status;
  btnEditar.Enabled    := not status;
  btnCancelar.Enabled  := status;
  btnExcluir.Enabled   := not status;
end;

end.
