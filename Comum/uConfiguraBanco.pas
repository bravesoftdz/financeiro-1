unit uConfiguraBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, PngSpeedButton;

type
  TfrmConfiguraBanco = class(TfrmComum)
    Label1: TLabel;
    edtCaminho: TEdit;
    btnCaminho: TButton;
    OpenDialog: TOpenDialog;
    btnTestarConexao: TPngSpeedButton;
    procedure btnCaminhoClick(Sender: TObject);
  private

    { Private declarations }
  public
    procedure AbrirConfiguracao;
    { Public declarations }
  end;

var
  frmConfiguraBanco: TfrmConfiguraBanco;

implementation

{$R *.dfm}

uses
  uPrincipal;

procedure TfrmConfiguraBanco.AbrirConfiguracao;
begin

end;

procedure TfrmConfiguraBanco.btnCaminhoClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
  begin
    edtCaminho.Text := OpenDialog.FileName;
  end;
end;

end.
