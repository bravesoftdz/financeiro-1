unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms;

type
  TdmPrincipal = class(TDataModule)
  private
    { Private declarations }
  public
    function ConfigurarConexao: Boolean;
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function  TdmPrincipal.ConfigurarConexao : Boolean;
var
  sCaminho, sLinha : string;
  txtArquivo : TextFile;

begin
  Result := False;
  sCaminho := ExtractFilePath(Application.ExeName);
  sCaminho := sCaminho + 'Config.ini';
  if FileExists(sCaminho) then
  begin
    AssignFile(txtArquivo,sCaminho);
    Reset(txtArquivo);
    Readln(txtArquivo,sLinha);
    CloseFile(txtArquivo);
    Result := True;
  end else
  begin
    sLinha := 'Teste';
    AssignFile(txtArquivo,sCaminho);
    Rewrite(txtArquivo);
    Writeln(txtArquivo,sLinha);
    CloseFile(txtArquivo);
    Result := True;
  end;
end;

end.
