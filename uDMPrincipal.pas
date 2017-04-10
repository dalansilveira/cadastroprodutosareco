unit uDMPrincipal;

interface

uses
  System.SysUtils, VCL.Forms, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TdmPrincipal = class(TDataModule)
    conPrincipal: TFDConnection;
    qryListagemProdutos: TFDQuery;
    dsListagemProdutos: TDataSource;
    qryProdutos: TFDQuery;
    dsProdutos: TDataSource;
    qryListagemProdutosID: TIntegerField;
    qryListagemProdutosNOME: TStringField;
    qryListagemProdutosVALOR_CUSTO: TBCDField;
    qryListagemProdutosVALOR_VENDA: TBCDField;
    qryListagemProdutosESTOQUE: TBCDField;
    qryListagemProdutosESTOQUE_MINIMO: TBCDField;
    qryListagemProdutosESTOQUE_CRITICO: TBCDField;
    qryProdutosID: TIntegerField;
    qryProdutosNOME: TStringField;
    qryProdutosVALOR_CUSTO: TBCDField;
    qryProdutosVALOR_VENDA: TBCDField;
    qryProdutosESTOQUE: TBCDField;
    qryProdutosESTOQUE_MINIMO: TBCDField;
    qryProdutosESTOQUE_CRITICO: TBCDField;
    procedure conPrincipalBeforeConnect(Sender: TObject);
    procedure qryProdutosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.conPrincipalBeforeConnect(Sender: TObject);
begin
   conPrincipal.Params.Database := ExtractFilePath(Application.exeName) + 'dados.fdb';
end;

procedure TdmPrincipal.qryProdutosAfterInsert(DataSet: TDataSet);
begin
   DataSet.FieldByName('ID').AsInteger := 0;
end;

end.
