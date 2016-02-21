program financeiro;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDmPrincipal in '..\Comum\uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uComum in '..\Comum\uComum.pas' {frmComum},
  uConfiguraBanco in '..\Comum\uConfiguraBanco.pas' {frmConfiguraBanco},
  uLogin in '..\Comum\uLogin.pas' {frmLogin},
  uCadContas in 'uCadContas.pas' {frmCadastroContas},
  uTiposConta in 'uTiposConta.pas' {frmTiposConta},
  uLancamentos in 'uLancamentos.pas' {frmLancamentos},
  uFiltroRelComum in '..\Comum\uFiltroRelComum.pas' {frmFiltroRelComum},
  uFiltroRelLancamentos in '..\Comum\uFiltroRelLancamentos.pas' {frmFiltroRelLancamentos},
  uContasPagar in 'uContasPagar.pas' {frmContasPagar},
  uPessoas in 'uPessoas.pas' {frmPessoas},
  uPesquisarComum in '..\Comum\uPesquisarComum.pas' {frmPesquisarComum},
  uPesquisarCredor in 'uPesquisarCredor.pas' {frmPesquisarCredor},
  uContasReceber in 'uContasReceber.pas' {frmContasReceber},
  uRelatorios in 'uRelatorios.pas' {frmRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
