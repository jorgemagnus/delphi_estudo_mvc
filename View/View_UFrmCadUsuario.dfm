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
        ExplicitTop = -2
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
          Width = 168
          Height = 21
          MaxLength = 20
          TabOrder = 1
        end
        object EdtSenha: TEdit
          Left = 112
          Top = 87
          Width = 168
          Height = 21
          MaxLength = 10
          PasswordChar = '*'
          TabOrder = 2
        end
        object EdtRepetiSenha: TEdit
          Left = 112
          Top = 114
          Width = 168
          Height = 21
          MaxLength = 10
          PasswordChar = '*'
          TabOrder = 3
        end
        object GbAlterarSenha: TGroupBox
          Left = 112
          Top = 141
          Width = 168
          Height = 49
          Enabled = False
          TabOrder = 4
          Visible = False
          object CHAlterarSenha: TCheckBox
            Left = 6
            Top = 14
            Width = 154
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
        object DBG_Ativos: TDBGrid
          Left = 2
          Top = 15
          Width = 1003
          Height = 380
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgTitleClick]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'idusuario'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'usu_usuario'
              Title.Alignment = taCenter
              Title.Caption = 'Usu'#225'rio'
              Visible = True
            end>
        end
      end
    end
    inherited Aba03: TTabSheet
      Caption = 'USU'#193'RIOS (INATIVOS)'
      inherited GBAba03: TGroupBox
        Caption = ''
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 1003
          Height = 380
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgTitleClick]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'idusuario'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'usu_usuario'
              Title.Alignment = taCenter
              Title.Caption = 'Usu'#225'rio'
              Visible = True
            end>
        end
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
