object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos Demonstrativo para ARECO'
  ClientHeight = 435
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPrincipal
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gridProdutos: TDBGrid
    Left = 0
    Top = 0
    Width = 754
    Height = 416
    Align = alClient
    DataSource = dmPrincipal.dsListagemProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridProdutosDblClick
    OnKeyDown = gridProdutosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 359
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_CUSTO'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_VENDA'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUE'
        Width = 106
        Visible = True
      end>
  end
  object statMain: TStatusBar
    Left = 0
    Top = 416
    Width = 754
    Height = 19
    Panels = <>
    ExplicitLeft = 336
    ExplicitTop = 224
    ExplicitWidth = 0
  end
  object mmPrincipal: TMainMenu
    Left = 592
    Top = 80
    object MenuArquivo: TMenuItem
      Caption = '&Arquivo'
      object MenuFechar: TMenuItem
        Caption = '&Fechar'
        OnClick = MenuFecharClick
      end
    end
    object MenuProdutos: TMenuItem
      Caption = '&Produtos'
      object CadastrosProdutos: TMenuItem
        Caption = '&Cadastros'
        OnClick = CadastrosProdutosClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object AlterarProdutos: TMenuItem
        Caption = '&Alterar'
        OnClick = AlterarProdutosClick
      end
      object ExcluirProdutos: TMenuItem
        Caption = '&Excluir'
        OnClick = ExcluirProdutosClick
      end
    end
    object MenuAjuda: TMenuItem
      Caption = '&Ajuda'
      object Sobre: TMenuItem
        Caption = '&Sobre'
        OnClick = SobreClick
      end
    end
  end
end
