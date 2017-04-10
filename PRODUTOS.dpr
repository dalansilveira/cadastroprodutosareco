program PRODUTOS;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {FrmMain},
  uDMPrincipal in 'uDMPrincipal.pas' {dmPrincipal: TDataModule},
  fCadProdutos in 'fCadProdutos.pas' {FrmCadProdutos},
  fSobre in 'fSobre.pas' {FrmSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
