program financeiro;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDmPrincipal in '..\Comum\uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uComum in '..\Comum\uComum.pas' {frmComum},
  uConfiguraBanco in '..\Comum\uConfiguraBanco.pas' {frmConfiguraBanco},
  uLogin in '..\Comum\uLogin.pas' {frmLogin},
  uCadContas in 'uCadContas.pas' {frmCadastroContas},
  uTiposConta in 'uTiposConta.pas' {frmTiposConta};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroContas, frmCadastroContas);
  Application.CreateForm(TfrmTiposConta, frmTiposConta);
  Application.Run;
end.
