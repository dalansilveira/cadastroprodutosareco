unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls;

type
  TFrmMain = class(TForm)
    gridProdutos: TDBGrid;
    mmPrincipal: TMainMenu;
    MenuArquivo: TMenuItem;
    MenuProdutos: TMenuItem;
    MenuFechar: TMenuItem;
    MenuAjuda: TMenuItem;
    CadastrosProdutos: TMenuItem;
    Sobre: TMenuItem;
    statMain: TStatusBar;
    AlterarProdutos: TMenuItem;
    ExcluirProdutos: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuFecharClick(Sender: TObject);
    procedure CadastrosProdutosClick(Sender: TObject);
    procedure AlterarProdutosClick(Sender: TObject);
    procedure ExcluirProdutosClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure gridProdutosDblClick(Sender: TObject);
    procedure gridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
   uDMPrincipal, fCadProdutos, fSobre;

{$R *.dfm}

procedure TFrmMain.AlterarProdutosClick(Sender: TObject);
begin
   if dmPrincipal.qryListagemProdutos.RecordCount > 0 then
   begin
      with TFrmCadProdutos.Create(Self) do
      begin
         dmPrincipal.qryProdutos.Cancel;
         dmPrincipal.qryProdutos.Close;
         dmPrincipal.qryProdutos.ParamByName('ID').AsInteger :=
            dmPrincipal.qryListagemProdutos.FieldByName('ID').AsInteger;
         dmPrincipal.qryProdutos.Open;
         dmPrincipal.qryProdutos.Edit;
         ShowModal;
         Free;
         dmPrincipal.qryListagemProdutos.Close;
         dmPrincipal.qryListagemProdutos.Open();
      end;
   end;
end;

procedure TFrmMain.ExcluirProdutosClick(Sender: TObject);
begin
   if dmPrincipal.qryListagemProdutos.RecordCount > 0 then
   begin
      dmPrincipal.qryProdutos.Cancel;
      dmPrincipal.qryProdutos.Close;
      dmPrincipal.qryProdutos.ParamByName('ID').AsInteger :=
         dmPrincipal.qryListagemProdutos.FieldByName('ID').AsInteger;
      dmPrincipal.qryProdutos.Open;
      dmPrincipal.qryProdutos.Delete;
      dmPrincipal.qryListagemProdutos.Close;
      dmPrincipal.qryListagemProdutos.Open();
   end;
end;

procedure TFrmMain.MenuFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmMain.SobreClick(Sender: TObject);
begin
   With TFrmSobre.Create(Self) do
   begin
      ShowModal;
      Free;
   end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   WindowState := wsMaximized;
   dmPrincipal := TdmPrincipal.Create(Application);
   dmPrincipal.conPrincipal.Open();
   dmPrincipal.qryListagemProdutos.Open();
end;

procedure TFrmMain.gridProdutosDblClick(Sender: TObject);
begin
   AlterarProdutosClick(Sender);
end;

procedure TFrmMain.gridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then
      ExcluirProdutosClick(Sender);
end;

procedure TFrmMain.CadastrosProdutosClick(Sender: TObject);
begin
   With TFrmCadProdutos.Create(Self) do
   begin
      ShowModal;
      dmPrincipal.qryListagemProdutos.Close;
      dmPrincipal.qryListagemProdutos.Open();
      Free;
   end;
end;

end.
