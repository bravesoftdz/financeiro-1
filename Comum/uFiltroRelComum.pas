unit uFiltroRelComum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton, uDmPrincipal,
  Vcl.ExtCtrls;

type
  TfrmFiltroRelComum = class(TForm)
    pnlTitulo: TPanel;
    pnlCentro: TPanel;
    pnlBotoes: TPanel;
    btnVisualizar: TPngSpeedButton;
    btnImprimir: TPngSpeedButton;
    btnFechar: TPngSpeedButton;
    pnlStatus: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroRelComum: TfrmFiltroRelComum;

implementation

{$R *.dfm}

end.
