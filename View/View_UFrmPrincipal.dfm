object View_FrmPrincipal: TView_FrmPrincipal
  Left = 0
  Top = 0
  Caption = 'APLICATIVO'
  ClientHeight = 449
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MenuPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BarraStatusPrincipal: TStatusBar
    Left = 0
    Top = 430
    Width = 714
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Data Sistema'
        Width = 100
      end
      item
        Text = 'USU'#193'RIO LOGADO:'
        Width = 110
      end
      item
        Alignment = taCenter
        Text = 'Usuario'
        Width = 200
      end
      item
        Alignment = taCenter
        Text = 'Mensagem'
        Width = 50
      end>
  end
  object MenuPrincipal: TMainMenu
    Left = 568
    Top = 16
    object mnuArquivo: TMenuItem
      Caption = '&Arquivo'
      object mnuCadastro: TMenuItem
        Caption = 'Cadastros'
      end
      object mnuSair: TMenuItem
        Caption = '&Sair'
        ShortCut = 16467
        OnClick = mnuSairClick
      end
    end
    object mnuAcesso: TMenuItem
      Caption = 'A&cesso'
      object mnuUsuario: TMenuItem
        Caption = 'Usu'#225'rio...'
        OnClick = mnuUsuarioClick
      end
    end
    object mnuUtil: TMenuItem
      Caption = '&Util'
      object mnuAlterarSenha: TMenuItem
        Caption = 'Alterar Senha...'
      end
      object mnuConfigSistema: TMenuItem
        Caption = 'Configura'#231#245'es do Sistema'
        object mnuLocalFotos: TMenuItem
          Caption = 'Local Fotos...'
          OnClick = mnuLocalFotosClick
        end
      end
    end
    object mnuAuditoria: TMenuItem
      Caption = 'A&uditoria'
      object mnuLogSistema: TMenuItem
        Caption = 'Log(s)...'
      end
    end
    object mnuSobre: TMenuItem
      Caption = '&Sobre'
      object mnuSobreOSistema: TMenuItem
        Caption = 'Sobre o Sistema...'
      end
    end
  end
end
