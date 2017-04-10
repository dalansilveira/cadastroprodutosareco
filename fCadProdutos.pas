unit fCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Data.DB;

type
  TFrmCadProdutos = class(TForm)
    pnlTitulo: TPanel;
    tlbProdutos: TToolBar;
    Label1: TLabel;
    edtNOME: TDBEdit;
    Label2: TLabel;
    edtVALOR_CUSTO: TDBEdit;
    Label3: TLabel;
    edtVALOR_VENDA: TDBEdit;
    Label4: TLabel;
    edtESTOQUE: TDBEdit;
    Label5: TLabel;
    edtESTOQUE_MINIMO: TDBEdit;
    Label6: TLabel;
    edtESTOQUE_CRITICO: TDBEdit;
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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProdutos: TFrmCadProdutos;

implementation

uses
   uDMPrincipal;

{$R *.dfm}

procedure TFrmCadProdutos.btnExcluirClick(Sender: TObject);
begin
   if dmPrincipal.qryProdutos.State in [dsEdit] then
   begin
      dmPrincipal.qryProdutos.Delete;
      ShowMessage('Registro Apagado!');
      Close;
   end;
end;

procedure TFrmCadProdutos.btnNovoClick(Sender: TObject);
begin
   if dmPrincipal.qryProdutos.State in [dsEdit, dsInsert] then
   begin
      dmPrincipal.qryProdutos.Cancel;
      dmPrincipal.qryProdutos.Insert;
      edtNOME.SetFocus;
   end;
end;

procedure TFrmCadProdutos.btnSalvarClick(Sender: TObject);
begin
   if dmPrincipal.qryProdutos.State in [dsEdit, dsInsert] then
   begin
      dmPrincipal.qryProdutos.Post;
      ShowMessage('As alterações foram salvas!');
      dmPrincipal.qryProdutos.Insert;
      edtNOME.SetFocus;
   end;
end;

procedure TFrmCadProdutos.btnVoltarClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCadProdutos.FormCreate(Sender: TObject);
begin
   dmPrincipal.qryProdutos.Close;
   dmPrincipal.qryProdutos.ParamByName('ID').AsInteger := 0;
   dmPrincipal.qryProdutos.Open();
   dmPrincipal.qryProdutos.Insert;
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

end.
