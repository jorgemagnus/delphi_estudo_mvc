unit View_UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

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

implementation

{$R *.dfm}

uses View_UFrmPrincipal, Controller_Acesso;

procedure TView_FrmLogin.BtnEntrarClick(Sender: TObject);
begin
    //Entrar no sistema.

     case (Controller_Acesso_EntradaAcessoLogin(EdtUsuario.Text,EdtSenha.Text)) of
       1:begin
           ShowMessage('AVISO - INFORME USU�RIO!.');
           EdtUsuario.SetFocus;
           exit;
        end;
       2:begin
           ShowMessage('AVISO - INFORME SENHA!.');
           EdtSenha.SetFocus;
           Exit;
        end;
       3:begin
           ShowMessage('AVISO - INFORME USU�RIO E SENHA!.');
           EdtUsuario.SetFocus;
           Exit;
        end;
     end;


     if (Controller_Acesso_ExisteOUsuario(EdtUsuario.Text) = false) then
         begin
           ShowMessage('AVISO - USU�RIO N�O EXISTE!.');
           EdtUsuario.SetFocus;
           Exit;
         end;


     if (Controller_Acesso_ValidarStatus(EdtUsuario.Text)=false) then
         begin
           ShowMessage('AVISO - US�ARIO ENCONTRA-SE INATIVO NO SISTEMA.!.');
           EdtUsuario.SetFocus;
           Exit;
         end;


     if (Controller_Acesso_ValidarAcesso(EdtUsuario.Text,EdtSenha.Text)=true) then
           begin
             with (View_FrmPrincipal) do
              begin
                 BarraStatusPrincipal.Panels[0].Text:=DateToStr(Date);
                 BarraStatusPrincipal.Panels[2].Text:=UpperCase(EdtUsuario.Text);
                 BarraStatusPrincipal.Panels[3].Text:=UpperCase('BEM-VINDO AO SISTEMA : '+UpperCase(EdtUsuario.Text));
              end;
             View_FrmLogin.Close;
             View_FrmPrincipal.Show;
           end
      else
          begin
            EdtUsuario.Clear;
            EdtSenha.Clear;
            EdtUsuario.SetFocus;
            ShowMessage('OPS!! - VERIFIQUE SEU USUARIO E SENHA!. -(DUV�DAS ENTRE EM CONTATO COM O SUPORTE).');
          end;
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
  //Usando a tecla enter ao inv�s do Tab.
  if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

end.
