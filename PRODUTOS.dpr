program PRODUTOS;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {FrmMain},
  fCadProdutos in 'fCadProdutos.pas' {FrmCadProdutos},
  fSobre in 'fSobre.pas' {FrmSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
