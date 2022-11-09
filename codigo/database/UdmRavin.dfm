object dmRavin: TdmRavin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 421
  Width = 603
  object cnxBancoDeDados: TFDConnection
    Params.Strings = (
      'Database=ravin'
      'User_Name=root'
      'Server=localhost'
      'Password=root'
      'DriverID=MySQL')
    UpdateOptions.AssignedValues = [uvUpdateMode]
    Left = 40
    Top = 24
  end
  object drvBancoDeDados: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\vgzampieri\Documents\ravin\bibliotecas\libmysql.dll'
    Left = 40
    Top = 80
  end
  object wtcBancoDeDados: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 136
  end
end
