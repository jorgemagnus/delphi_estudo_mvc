unit View_UFrmPadraoSimples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TView_FrmPadraoSimples = class(TForm)
    BarraStatusPadrao: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  View_FrmPadraoSimples: TView_FrmPadraoSimples;

implementation

{$R *.dfm}

procedure TView_FrmPadraoSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
  View_FrmPadraoSimples:=nil;
end;

procedure TView_FrmPadraoSimples.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Usando a tecla enter ao inv?s do Tab.
  if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;


procedure TView_FrmPadraoSimples.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Fechar a tela usando ESC.
  If (Key = #27) Then
      Close;
end;

end.
