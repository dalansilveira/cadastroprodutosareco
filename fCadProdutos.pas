unit fCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Data.DB, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.Samples.Spin;

type
  TProdutos = class
    private
     FNome: String;
     FValorCusto: Currency;
     FValorVenda: Currency;
     FEstoque: Integer;
     FEstoqueMinimo: Integer;
     FEstoqueCritico: Integer;
     FQuery: TFDQuery;
     FID: Integer;
     procedure SetEstoque(const Value: Integer);
     procedure SetEstoqueCritico(const Value: Integer);
     procedure SetEstoqueMinimo(const Value: Integer);
     procedure SetNome(const Value: String);
     procedure SetQuery(const Value: TFDQuery);
     procedure SetValorCusto(const Value: Currency);
     procedure SetValorVenda(const Value: Currency);
    procedure SetID(const Value: Integer);
    public
     constructor Create;
     //Campos
     property ID: Integer read FID write SetID;
     property Nome: String read FNome write SetNome;
     property ValorCusto: Currency read FValorCusto write SetValorCusto;
     property ValorVenda: Currency read FValorVenda write SetValorVenda;
     property Estoque: Integer read FEstoque write SetEstoque;
     property EstoqueMinimo: Integer read FEstoqueMinimo write SetEstoqueMinimo;
     property EstoqueCritico: Integer read FEstoqueCritico write SetEstoqueCritico;
     //componentes
     property Query: TFDQuery read FQuery write SetQuery;
     //métodos
     function Inserir: Boolean;
     function Alterar(ID: Integer): Boolean;
     function Excluir(ID: Integer): Boolean;
     function Listar(var lvProdutos: TListView): Boolean;
     function Carregar(ID: Integer): Boolean;
  end;

type
  TFrmCadProdutos = class(TForm)
    pnlTitulo: TPanel;
    tlbProdutos: TToolBar;
    Label1: TLabel;
    edtNOME: TEdit;
    Label2: TLabel;
    edtVALOR_CUSTO: TEdit;
    Label3: TLabel;
    edtVALOR_VENDA: TEdit;
    Label4: TLabel;
    edtESTOQUE: TSpinEdit;
    Label5: TLabel;
    edtESTOQUE_MINIMO: TSpinEdit;
    Label6: TLabel;
    edtESTOQUE_CRITICO: TSpinEdit;
    btnNovo: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnVoltar: TSpeedButton;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure LimparCampos;
    { Private declarations }
  public
    ID: Integer;
    procedure MostrarProduto;
    { Public declarations }
  end;

var
  FrmCadProdutos: TFrmCadProdutos;

implementation

uses
   fMain;

{$R *.dfm}

procedure TFrmCadProdutos.MostrarProduto;
begin
   ID := Produtos.ID;
   edtNOME.Text := Produtos.Nome;
   edtVALOR_CUSTO.Text := FloatToStr(Produtos.ValorCusto);
   edtVALOR_VENDA.Text := FloatToStr(Produtos.ValorVenda);
   edtESTOQUE.Value := Produtos.Estoque;
   edtESTOQUE_MINIMO.Value := Produtos.EstoqueMinimo;
   edtESTOQUE_CRITICO.Value := Produtos.EstoqueCritico;
end;

procedure TFrmCadProdutos.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Você tem certeza que deseja excluir o registro selecionado?' +
       #13#10 + 'Esta ação é irreversível! Deseja prosseguir?', 'Exclusão?',
       MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) <> mrYes then
      Abort;

   if Produtos.Excluir(ID) then
   begin
      LimparCampos;

      ShowMessage('Produto excluído com sucesso!');
   end;
end;

procedure TFrmCadProdutos.btnNovoClick(Sender: TObject);
begin
   LimparCampos;
end;

procedure TFrmCadProdutos.btnSalvarClick(Sender: TObject);
begin
   Produtos.Nome := edtNOME.Text;
   Produtos.ValorCusto := StrToFloatDef(edtVALOR_CUSTO.Text, 0);
   Produtos.ValorVenda := StrToFloatDef(edtVALOR_VENDA.Text, 0);
   Produtos.Estoque := edtESTOQUE.Value;
   Produtos.EstoqueMinimo := edtESTOQUE_MINIMO.Value;
   Produtos.EstoqueCritico := edtESTOQUE_CRITICO.Value;

   if ID > 0 then
   begin
      if Produtos.Alterar(ID) then
      begin
         ShowMessage('Produto alterado com sucesso!');
         LimparCampos;
      end
   end else
   begin
      if Produtos.Inserir then
      begin
         ShowMessage('Produto incluído com sucesso!');
         LimparCampos;
      end;
   end;
end;

procedure TFrmCadProdutos.btnVoltarClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCadProdutos.LimparCampos;
begin
   ID := 0;

   edtNOME.Text := '';
   edtVALOR_CUSTO.Text := '';
   edtVALOR_VENDA.Text := '';
   edtESTOQUE.Value := 0;
   edtESTOQUE_MINIMO.Value := 0;
   edtESTOQUE_CRITICO.Value := 0;
end;

procedure TFrmCadProdutos.FormCreate(Sender: TObject);
begin
   LimparCampos;
end;

procedure TFrmCadProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      Close;
   if Key = VK_RETURN then
      Key := VK_TAB;
end;

procedure TFrmCadProdutos.FormShow(Sender: TObject);
begin
   if edtNOME.CanFocus then
      edtNOME.SetFocus;
end;

{ TProdutos }

function TProdutos.Alterar(ID: Integer): Boolean;
begin
   Query.Close;
   Query.SQL.Clear;

   Query.SQL.Add('UPDATE PRODUTOS SET NOME = :NOME,');
   Query.SQL.Add('VALOR_CUSTO = :VALOR_CUSTO,');
   Query.SQL.Add('VALOR_VENDA = :VALOR_VENDA,');
   Query.SQL.Add('ESTOQUE = :ESTOQUE,');
   Query.SQL.Add('ESTOQUE_MINIMO = :ESTOQUE_MINIMO,');
   Query.SQL.Add('ESTOQUE_CRITICO = :ESTOQUE_CRITICO');
   Query.SQL.Add('WHERE ID = :ID');

   Query.ParamByName('NOME').AsString := Nome;
   Query.ParamByName('VALOR_CUSTO').AsCurrency := ValorCusto;
   Query.ParamByName('VALOR_VENDA').AsCurrency := ValorVenda;
   Query.ParamByName('ESTOQUE').AsInteger := Estoque;
   Query.ParamByName('ESTOQUE_MINIMO').AsInteger := EstoqueMinimo;
   Query.ParamByName('ESTOQUE_CRITICO').AsInteger := EstoqueCritico;
   Query.ParamByName('ID').AsInteger := ID;

   Query.ExecSQL;

   Result := True;
end;

function TProdutos.Carregar(ID: Integer): Boolean;
begin
   Query.Close;
   Query.SQL.Text := 'SELECT * FROM PRODUTOS WHERE ID = :ID';
   Query.Params.ParamByName('ID').AsInteger := ID;
   Query.Open();

   Produtos.ID := ID;
   Produtos.Nome := Query.FieldByName('NOME').AsString;
   Produtos.ValorCusto := Query.FieldByName('VALOR_CUSTO').AsCurrency;
   Produtos.ValorVenda := Query.FieldByName('VALOR_VENDA').AsCurrency;
   Produtos.Estoque := Query.FieldByName('ESTOQUE').AsInteger;
   Produtos.EstoqueMinimo := Query.FieldByName('ESTOQUE_MINIMO').AsInteger;
   Produtos.EstoqueCritico := Query.FieldByName('ESTOQUE_CRITICO').AsInteger;
end;

constructor TProdutos.Create;
begin
   FQuery := TFDQuery.Create(Conexao.Conn);
   FQuery.Connection := Conexao.Conn;
end;

function TProdutos.Excluir(ID: Integer): Boolean;
begin
   Query.Close;
   Query.SQL.Clear;
   Query.SQL.Add('DELETE FROM PRODUTOS WHERE ID = :ID');

   Query.ParamByName('ID').AsInteger := ID;

   Query.ExecSQL;

   Result := True;
end;

function TProdutos.Inserir: Boolean;
begin
   Query.Close;
   Query.SQL.Clear;

   Query.SQL.Add('INSERT INTO PRODUTOS(ID, NOME, VALOR_CUSTO, VALOR_VENDA,');
   Query.SQL.Add('ESTOQUE, ESTOQUE_MINIMO, ESTOQUE_CRITICO)');
   Query.SQL.Add('VALUES (0, :NOME, :VALOR_CUSTO, :VALOR_VENDA,');
   Query.SQL.Add(':ESTOQUE, :ESTOQUE_MINIMO, :ESTOQUE_CRITICO)');

   Query.ParamByName('NOME').AsString := Nome;
   Query.ParamByName('VALOR_CUSTO').AsCurrency := ValorCusto;
   Query.ParamByName('VALOR_VENDA').AsCurrency := ValorVenda;
   Query.ParamByName('ESTOQUE').AsInteger := Estoque;
   Query.ParamByName('ESTOQUE_MINIMO').AsInteger := EstoqueMinimo;
   Query.ParamByName('ESTOQUE_CRITICO').AsInteger := EstoqueCritico;

   Query.ExecSQL;

   Result := True;
end;

function TProdutos.Listar(var lvProdutos: TListView): Boolean;
begin
   Query.Close;
   Query.Open('SELECT * FROM PRODUTOS');

   try
      lvProdutos.Items.BeginUpdate;
      try
         lvProdutos.Clear;

         while not(Query.Eof) do
         begin
            with lvProdutos.Items.Add() do
            begin
               Caption :=  Query.FieldByName('NOME').AsString;
               ImageIndex := Query.FieldByName('ID').AsInteger;
               SubItems.Add(Query.FieldByName('VALOR_VENDA').AsString);
               SubItems.Add(Query.FieldByName('ESTOQUE').AsString);
            end;

            Query.Next;
         end;

         Result := True;
      finally
         lvProdutos.Items.EndUpdate;
      end;

   except
      on E: Exception do
         ShowMessage('Não foi possível listar os produtos: ' + #13#10 + E.Message);
   end;
end;

procedure TProdutos.SetEstoque(const Value: Integer);
begin
   FEstoque := Value;
end;

procedure TProdutos.SetEstoqueCritico(const Value: Integer);
begin
   FEstoqueCritico := Value;
end;

procedure TProdutos.SetEstoqueMinimo(const Value: Integer);
begin
   FEstoqueMinimo := Value;
end;

procedure TProdutos.SetID(const Value: Integer);
begin
   FID := Value;
end;

procedure TProdutos.SetNome(const Value: String);
begin
   FNome := Value;
end;

procedure TProdutos.SetQuery(const Value: TFDQuery);
begin
   FQuery := Value;
end;

procedure TProdutos.SetValorCusto(const Value: Currency);
begin
   FValorCusto := Value;
end;

procedure TProdutos.SetValorVenda(const Value: Currency);
begin
   FValorVenda := Value;
end;

end.
