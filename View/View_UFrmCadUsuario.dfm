inherited View_FrmCadUsuario: TView_FrmCadUsuario
  Caption = 'APLICATIVO - Cadastro/Controle de Usu'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PGControle: TPageControl
    inherited Aba01: TTabSheet
      Caption = 'DADOS DO USU'#193'RIO'
      inherited GBAba01: TGroupBox
        Caption = ''
        Enabled = False
        object Label1: TLabel [0]
          Left = 66
          Top = 68
          Width = 40
          Height = 13
          Caption = 'Usu'#225'rio:'
        end
        object Label4: TLabel [1]
          Left = 72
          Top = 94
          Width = 34
          Height = 13
          Caption = 'Senha:'
        end
        object Label5: TLabel [2]
          Left = 34
          Top = 122
          Width = 72
          Height = 13
          Caption = 'Repetir Senha:'
        end
        object Label6: TLabel [3]
          Left = 15
          Top = 42
          Width = 91
          Height = 13
          Caption = 'C'#243'digo do Usu'#225'rio:'
        end
        inherited EdtCodigo: TEdit
          Left = 112
          Top = 34
          Width = 46
          Alignment = taCenter
          ExplicitLeft = 112
          ExplicitTop = 34
          ExplicitWidth = 46
        end
        object EdtUsuario: TEdit
          Left = 112
          Top = 60
          Width = 163
          Height = 21
          MaxLength = 20
          TabOrder = 1
        end
        object EdtSenha: TEdit
          Left = 112
          Top = 87
          Width = 163
          Height = 21
          MaxLength = 10
          PasswordChar = '*'
          TabOrder = 2
        end
        object EdtRepetiSenha: TEdit
          Left = 112
          Top = 114
          Width = 163
          Height = 21
          MaxLength = 10
          PasswordChar = '*'
          TabOrder = 3
        end
        object GbAlterarSenha: TGroupBox
          Left = 281
          Top = 82
          Width = 361
          Height = 54
          Caption = 'Marca essa Op'#231#227'o Para Modificar Senha(Somente no Modo de Edi'#231#227'o)'
          Enabled = False
          TabOrder = 4
          Visible = False
          object CHAlterarSenha: TCheckBox
            Left = 24
            Top = 24
            Width = 209
            Height = 17
            Caption = 'Quero MODIFICAR a Senha.'
            TabOrder = 0
          end
        end
      end
    end
    inherited Aba02: TTabSheet
      Caption = 'USU'#193'RIOS (ATIVOS)'
      inherited GBAba02: TGroupBox
        Caption = ''
      end
    end
    inherited Aba03: TTabSheet
      Caption = 'USU'#193'RIOS (INATIVOS)'
      inherited GBAba03: TGroupBox
        Caption = ''
      end
    end
    inherited Aba04: TTabSheet
      TabVisible = False
    end
    inherited AbaPesquisar: TTabSheet
      TabVisible = False
    end
  end
end
