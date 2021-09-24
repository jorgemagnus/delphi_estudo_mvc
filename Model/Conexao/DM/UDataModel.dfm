object DataModel: TDataModel
  OldCreateOrder = False
  Height = 144
  Width = 193
  object DBConexao: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    LoginPrompt = False
    Transaction = DBTransacao
    Left = 40
    Top = 24
  end
  object DBTransacao: TFDTransaction
    Connection = DBConexao
    Left = 40
    Top = 80
  end
  object DbMySQLLink: TFDPhysMySQLDriverLink
    Left = 120
    Top = 24
  end
end
