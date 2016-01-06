program financeiro;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDmPrincipal in '..\Comum\uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uComum in '..\Comum\uComum.pas' {frmComum},
  uConfiguraBanco in '..\Comum\uConfiguraBanco.pas' {frmConfiguraBanco};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
