object DataModel: TDataModel
  OldCreateOrder = False
  Height = 140
  Width = 367
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
  object DB_MySQL_DriverLink: TFDPhysMySQLDriverLink
    Left = 160
    Top = 24
  end
  object DB_FB_DriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_3_0\fbclient.dll'
    Left = 272
    Top = 24
  end
end
