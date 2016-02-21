unit uPesquisarComum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, PngSpeedButton;

type
  TfrmPesquisarComum = class(TForm)
    pnlStatus: TPanel;
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    pnlCentro: TPanel;
    grdPesquisar: TDBGrid;
    edtPesquisar: TEdit;
    btnFechar: TPngSpeedButton;
    btnSelecionar: TPngSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisarComum: TfrmPesquisarComum;

implementation

{$R *.dfm}

end.
