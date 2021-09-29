unit View_UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  uController_Acesso, uUsuario;

type
  TView_FrmLogin = class(TForm)
    GBUsuario: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    PSombra2: TPanel;
    PSombra1: TPanel;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    BtnEntrar: TButton;
    BtnSair: TButton;
    BarraStatusLogin: TStatusBar;
    ImgLogin: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEntrarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  View_FrmLogin: TView_FrmLogin;
  CAcesso:TControllerAcesso;
  CUsuario:TUsuario;


implementation

{$R *.dfm}

uses View_UFrmPrincipal;

procedure TView_FrmLogin.BtnEntrarClick(Sender: TObject);
begin
  //Entrar no Sistema.
  CAcesso:=TControllerAcesso.Create;
  CUsuario:=TUsuario.Create;
  CUsuario.USU_USUARIO:=EdtUsuario.Text;
  CUsuario.USU_SENHA:=EdtSenha.Text;
  CAcesso.Controller_Acesso_Sistema(CUsuario);
end;

procedure TView_FrmLogin.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TView_FrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
  View_FrmLogin:=nil;
end;

procedure TView_FrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Usando a tecla enter ao invés do Tab.
  if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

end.
