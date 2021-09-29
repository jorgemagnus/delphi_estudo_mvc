object DataModel: TDataModel
  OldCreateOrder = False
  Height = 141
  Width = 312
  object DBConexao: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=db_clinica'
      'User_Name=root'
      'Password=349823')
    Connected = True
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
  object DB_MySQL_DriverLink: TFDPhysMySQLDriverLink
    Left = 160
    Top = 24
  end
end
