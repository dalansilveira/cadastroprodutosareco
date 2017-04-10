object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 469
  Width = 676
  object conPrincipal: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\DALAN\Desktop\TesteProdutos\Win32\Debug\DADOS.' +
        'FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    BeforeConnect = conPrincipalBeforeConnect
    Left = 104
    Top = 56
  end
  object qryListagemProdutos: TFDQuery
    Connection = conPrincipal
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 104
    Top = 136
    object qryListagemProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListagemProdutosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 250
    end
    object qryListagemProdutosVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'VALOR_CUSTO'
      DisplayFormat = 'R$ ###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryListagemProdutosVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      DisplayFormat = 'R$ ###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryListagemProdutosESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      DisplayFormat = 'UN #######0'
      Precision = 18
      Size = 3
    end
    object qryListagemProdutosESTOQUE_MINIMO: TBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = 'ESTOQUE_MINIMO'
      DisplayFormat = 'UN #######0'
      Precision = 18
      Size = 3
    end
    object qryListagemProdutosESTOQUE_CRITICO: TBCDField
      FieldName = 'ESTOQUE_CRITICO'
      Origin = 'ESTOQUE_CRITICO'
      DisplayFormat = 'UN #######0'
      Precision = 18
      Size = 3
    end
  end
  object dsListagemProdutos: TDataSource
    DataSet = qryListagemProdutos
    Left = 104
    Top = 192
  end
  object qryProdutos: TFDQuery
    AfterInsert = qryProdutosAfterInsert
    Connection = conPrincipal
    SQL.Strings = (
      'SELECT * FROM PRODUTOS WHERE ID = :ID')
    Left = 232
    Top = 144
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 250
    end
    object qryProdutosVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'VALOR_CUSTO'
      DisplayFormat = 'R$ ###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      DisplayFormat = 'R$ ###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      DisplayFormat = 'UN #######0'
      Precision = 18
      Size = 3
    end
    object qryProdutosESTOQUE_MINIMO: TBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = 'ESTOQUE_MINIMO'
      DisplayFormat = 'UN #######0'
      Precision = 18
      Size = 3
    end
    object qryProdutosESTOQUE_CRITICO: TBCDField
      FieldName = 'ESTOQUE_CRITICO'
      Origin = 'ESTOQUE_CRITICO'
      DisplayFormat = 'UN #######0'
      Precision = 18
      Size = 3
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 232
    Top = 192
  end
end
