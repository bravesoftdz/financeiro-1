unit uComum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmComum = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    pnlStatus: TPanel;
    pnlCentro: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComum: TfrmComum;

implementation

{$R *.dfm}

end.
