inherited View_FrmConfiguracao: TView_FrmConfiguracao
  BorderIcons = [biSystemMenu]
  Caption = 'APLICATIVO - Configura'#231#245'es do Sistema.'
  ClientHeight = 126
  ClientWidth = 771
  OnShow = FormShow
  ExplicitWidth = 777
  ExplicitHeight = 155
  PixelsPerInch = 96
  TextHeight = 13
  inherited BarraStatusPadrao: TStatusBar
    Top = 107
    Width = 771
    ExplicitTop = 107
    ExplicitWidth = 771
  end
  object GbConfiguracao: TGroupBox
    Left = 0
    Top = 0
    Width = 771
    Height = 107
    Align = alClient
    Caption = 'CONFIGURA'#199#195'O - Local da Foto'
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 29
      Width = 135
      Height = 13
      Caption = 'Local Base Arquivo de Fotos'
    end
    object EdtLocalFoto: TEdit
      Left = 9
      Top = 43
      Width = 552
      Height = 21
      Enabled = False
      TabOrder = 0
      TextHint = 'Local onde ser'#225' armazenado o arquivo de fotos.'
    end
    object BtnLocalFoto: TButton
      Left = 573
      Top = 43
      Width = 84
      Height = 21
      Caption = 'Local'
      TabOrder = 1
      OnClick = BtnLocalFotoClick
    end
    object BtnGravarLocal: TButton
      Left = 661
      Top = 43
      Width = 103
      Height = 21
      Caption = 'Gravar Local'
      TabOrder = 2
      OnClick = BtnGravarLocalClick
    end
    object EdtIDLocalFoto: TEdit
      Left = 562
      Top = 43
      Width = 11
      Height = 21
      Enabled = False
      TabOrder = 3
      TextHint = 'Local onde ser'#225' armazenado o arquivo de fotos.'
      Visible = False
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'foto.jpg'
    Filter = 'Arquivos *.JPG|*.jpg'
    InitialDir = 'c:\'
    Left = 672
    Top = 80
  end
end
