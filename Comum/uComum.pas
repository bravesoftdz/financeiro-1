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
  private

    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmComum: TfrmComum;

implementation

{$R *.dfm}

{ TfrmComum }



{ TfrmComum }

end.
