unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmPrincipal = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
