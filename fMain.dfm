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
  object statMain: TStatusBar
    Left = 0
    Top = 416
    Width = 754
    Height = 19
    Panels = <>
  end
  object lvProdutos: TListView
    Left = 0
    Top = 0
    Width = 754
    Height = 416
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Columns = <
      item
        AutoSize = True
        Caption = 'Nome'
      end
      item
        AutoSize = True
        Caption = 'Valor Venda'
      end
      item
        AutoSize = True
        Caption = 'Estoque'
      end>
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = lvProdutosDblClick
    OnKeyDown = lvProdutosKeyDown
    ExplicitTop = -6
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
      object N2: TMenuItem
        Caption = '-'
      end
      object AtualizarLista: TMenuItem
        Caption = 'Atualizar'
        OnClick = AtualizarListaClick
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
