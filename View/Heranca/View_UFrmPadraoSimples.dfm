object View_FrmPadraoSimples: TView_FrmPadraoSimples
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio Padr'#227'o Simples'
  ClientHeight = 436
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BarraStatusPadrao: TStatusBar
    Left = 0
    Top = 417
    Width = 691
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'ESC - FECHAR FORMUL'#193'RIO.'
        Width = 50
      end>
  end
end
