unit uRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uComum, Vcl.Buttons, PngSpeedButton,
  Vcl.ExtCtrls;

type
  TfrmRelatorios = class(TfrmComum)
    btnRelLancamentos: TPngSpeedButton;
    PngSpeedButton2: TPngSpeedButton;
    PngSpeedButton3: TPngSpeedButton;
    PngSpeedButton4: TPngSpeedButton;
    PngSpeedButton5: TPngSpeedButton;
    procedure btnRelLancamentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}
uses
  uFiltroRelLancamentos;

procedure TfrmRelatorios.btnRelLancamentosClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmFiltroRelLancamentos,frmFiltroRelLancamentos);
  try
    frmFiltroRelLancamentos.ShowModal;
  finally
    FreeAndNil(frmFiltroRelLancamentos);
  end;
end;

end.
