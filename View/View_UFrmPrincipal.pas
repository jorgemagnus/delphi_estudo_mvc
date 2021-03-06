unit View_UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,  Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls;

type
  TView_FrmPrincipal = class(TForm)
    BarraStatusPrincipal: TStatusBar;
    MenuPrincipal: TMainMenu;
    mnuArquivo: TMenuItem;
    mnuSair: TMenuItem;
    mnuSobre: TMenuItem;
    mnuSobreOSistema: TMenuItem;
    mnuUtil: TMenuItem;
    mnuConfigSistema: TMenuItem;
    mnuAcesso: TMenuItem;
    mnuUsuario: TMenuItem;
    mnuLocalFotos: TMenuItem;
    mnuCadastro: TMenuItem;
    mnuAuditoria: TMenuItem;
    mnuLogSistema: TMenuItem;
    mnuAlterarSenha: TMenuItem;
    procedure mnuSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure mnuLocalFotosClick(Sender: TObject);
    procedure mnuUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  View_FrmPrincipal: TView_FrmPrincipal;

implementation

{$R *.dfm}

uses View_UFrmLogin, View_UFrmConfiguracao, View_UFrmCadUsuario;


procedure TView_FrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Mensagem para sair do sistema.
  if (messagebox(HANDLE,'DESEJA FECHAR APLICA??O?','AVISO - SISTEMA',MB_IconQuestion+MB_YesNo+MB_defbutton1) = IdYes) then
      Application.Terminate
  else
      Application.Run;
end;

procedure TView_FrmPrincipal.FormShow(Sender: TObject);
begin
  View_FrmLogin.ShowModal;
end;

procedure TView_FrmPrincipal.mnuLocalFotosClick(Sender: TObject);
begin
  Application.CreateForm(TView_FrmConfiguracao,View_FrmConfiguracao);
  View_FrmConfiguracao.ShowModal;
end;

procedure TView_FrmPrincipal.mnuSairClick(Sender: TObject);
begin
  close;
end;

procedure TView_FrmPrincipal.mnuUsuarioClick(Sender: TObject);
begin
  Application.CreateForm(TView_FrmCadUsuario,View_FrmCadUsuario);
  View_FrmCadUsuario.ShowModal;
end;

end.
