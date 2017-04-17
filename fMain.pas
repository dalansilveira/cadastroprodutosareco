unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Graphics, Vcl.ComCtrls,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.DApt, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  fCadProdutos;

type
  TConexao = class
    private
    FConn: TFDConnection;
    FDatabase: String;
     procedure SetConn(const Value: TFDConnection);
    procedure SetDatabase(const Value: String);
    public
     constructor Create;
     property Conn: TFDConnection read FConn write SetConn;
     property Database: String read FDatabase write SetDatabase;
     function Conectar: Boolean;
  end;

type
  TFrmMain = class(TForm)
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
    lvProdutos: TListView;
    AtualizarLista: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuFecharClick(Sender: TObject);
    procedure CadastrosProdutosClick(Sender: TObject);
    procedure AlterarProdutosClick(Sender: TObject);
    procedure ExcluirProdutosClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure AtualizarListaClick(Sender: TObject);
    procedure lvProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvProdutosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  Conexao: TConexao;
  Produtos: TProdutos;

implementation

uses
   fSobre;

{$R *.dfm}

procedure TFrmMain.AlterarProdutosClick(Sender: TObject);
begin
   with TFrmCadProdutos.Create(Self) do
   begin
      if lvProdutos.ItemFocused = nil then
         Abort;

      ID := lvProdutos.ItemFocused.ImageIndex;

      Produtos.Carregar(ID);

      MostrarProduto;

      ShowModal;

      Free;

      Produtos.Listar(lvProdutos);
   end;
end;

procedure TFrmMain.ExcluirProdutosClick(Sender: TObject);
begin
   if Application.MessageBox('Você tem certeza que deseja excluir o registro selecionado?' +
       #13#10 + 'Esta ação é irreversível! Deseja prosseguir?', 'Exclusão?',
       MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) <> mrYes then
      Abort;

   if Produtos.Excluir(lvProdutos.ItemFocused.ImageIndex) then
   begin
      Produtos.Listar(lvProdutos);

      ShowMessage('Produto excluído com sucesso!');
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

   Conexao := TConexao.Create;
   Conexao.Database := ExtractFilePath(Application.ExeName) + 'DADOS.FDB';

   if Conexao.Conectar = False then
   begin
      ShowMessage('Não foi possível conectar à: '+Conexao.Database);
      Application.Terminate;
   end else
   begin
      Produtos := TProdutos.Create;
      Produtos.Listar(lvProdutos);
   end;
end;

procedure TFrmMain.lvProdutosDblClick(Sender: TObject);
begin
   AlterarProdutosClick(Sender);
end;

procedure TFrmMain.lvProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then
      ExcluirProdutosClick(Sender);
end;

procedure TFrmMain.AtualizarListaClick(Sender: TObject);
begin
   Produtos.Listar(lvProdutos);
end;

procedure TFrmMain.CadastrosProdutosClick(Sender: TObject);
begin
   With TFrmCadProdutos.Create(Self) do
   begin
      ShowModal;
      Free;

      Produtos.Listar(lvProdutos);
   end;
end;

{ TConexao }

function TConexao.Conectar: Boolean;
begin
   Conn.DriverName := 'FB';
   Conn.Params.Database := Database;
   Conn.Params.UserName := 'SYSDBA';
   Conn.Params.Password := 'masterkey';

   Conn.Open;

   Result := True;
end;

constructor TConexao.Create;
begin
   Conn := TFDConnection.Create(nil);
   Conn.LoginPrompt := False;
end;

procedure TConexao.SetConn(const Value: TFDConnection);
begin
   FConn := Value;
end;

procedure TConexao.SetDatabase(const Value: String);
begin
   FDatabase := Value;
end;

end.
