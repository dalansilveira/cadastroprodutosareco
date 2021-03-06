object FrmCadProdutos: TFrmCadProdutos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Produtos'
  ClientHeight = 263
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 124
    Width = 83
    Height = 13
    Caption = 'Nome do Produto'
    FocusControl = edtNOME
  end
  object Label2: TLabel
    Left = 40
    Top = 164
    Width = 70
    Height = 13
    Caption = 'Valor de Custo'
    FocusControl = edtVALOR_CUSTO
  end
  object Label3: TLabel
    Left = 40
    Top = 204
    Width = 72
    Height = 13
    Caption = 'Valor de Venda'
    FocusControl = edtVALOR_VENDA
  end
  object Label4: TLabel
    Left = 432
    Top = 124
    Width = 67
    Height = 13
    Caption = 'Estoque Atual'
    FocusControl = edtESTOQUE
  end
  object Label5: TLabel
    Left = 432
    Top = 164
    Width = 74
    Height = 13
    Caption = 'Estoque M'#237'nimo'
    FocusControl = edtESTOQUE_MINIMO
  end
  object Label6: TLabel
    Left = 432
    Top = 204
    Width = 72
    Height = 13
    Caption = 'Estoque Cr'#237'tico'
    FocusControl = edtESTOQUE_CRITICO
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Cadastro de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object tlbProdutos: TToolBar
    Left = 0
    Top = 36
    Width = 576
    Height = 72
    ButtonHeight = 65
    ButtonWidth = 89
    Caption = 'tlbProdutos'
    TabOrder = 1
    object btnVoltar: TSpeedButton
      Left = 0
      Top = 0
      Width = 144
      Height = 65
      Caption = '&Voltar'
      OnClick = btnVoltarClick
    end
    object btnNovo: TSpeedButton
      Left = 144
      Top = 0
      Width = 144
      Height = 65
      Caption = '&Novo'
      OnClick = btnNovoClick
    end
    object btnSalvar: TSpeedButton
      Left = 288
      Top = 0
      Width = 144
      Height = 65
      Caption = '&Salvar'
      OnClick = btnSalvarClick
    end
    object btnExcluir: TSpeedButton
      Left = 432
      Top = 0
      Width = 144
      Height = 65
      Caption = '&Excluir'
      OnClick = btnExcluirClick
    end
  end
  object edtNOME: TEdit
    Left = 40
    Top = 140
    Width = 377
    Height = 21
    TabOrder = 2
  end
  object edtVALOR_CUSTO: TEdit
    Left = 40
    Top = 180
    Width = 174
    Height = 21
    TabOrder = 3
  end
  object edtVALOR_VENDA: TEdit
    Left = 40
    Top = 220
    Width = 174
    Height = 21
    TabOrder = 4
  end
  object edtESTOQUE: TSpinEdit
    Left = 432
    Top = 140
    Width = 95
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
  end
  object edtESTOQUE_MINIMO: TSpinEdit
    Left = 432
    Top = 180
    Width = 95
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 6
    Value = 0
  end
  object edtESTOQUE_CRITICO: TSpinEdit
    Left = 432
    Top = 220
    Width = 95
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 7
    Value = 0
  end
end
