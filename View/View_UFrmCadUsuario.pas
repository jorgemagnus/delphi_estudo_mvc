unit View_UFrmCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View_UFrmPadraoCadastro, Data.DB,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin;

type
  TView_FrmCadUsuario = class(TView_FrmPadraoCadastro)
    EdtUsuario: TEdit;
    Label1: TLabel;
    EdtSenha: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtRepetiSenha: TEdit;
    GbAlterarSenha: TGroupBox;
    CHAlterarSenha: TCheckBox;
    Label6: TLabel;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  View_FrmCadUsuario: TView_FrmCadUsuario;

implementation

{$R *.dfm}

uses Controller_Usuario, Funcoes_Gerais;

procedure TView_FrmCadUsuario.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  CHAlterarSenha.Checked :=false;
  GbAlterarSenha.Enabled:=false;
  GbAlterarSenha.Visible:=false;
end;

procedure TView_FrmCadUsuario.BtnEditarClick(Sender: TObject);
begin
  inherited;
  GbAlterarSenha.Enabled:=true;
  GbAlterarSenha.Visible:=true;
end;

procedure TView_FrmCadUsuario.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  CHAlterarSenha.Checked :=false;
end;

procedure TView_FrmCadUsuario.BtnGravarClick(Sender: TObject);
begin
  //Gravar ou Editar registro.
  Controller_Usuario_CamposObrigatoriosParaGravar;

  case operacao of
   1:begin

     if (VerificarSenhaDigitadasSaoIguais(EdtSenha.Text,EdtRepetiSenha.Text)=false) then
      begin
       ShowMessage('Senhas s�o diferentes');
       EdtSenha.SetFocus;
       Exit;
      end;

     Controller_Usuario_Gravar(EdtUsuario.Text,EdtSenha.Text);
   end;
   2:begin

      if EdtCodigo.Text = '' then
        begin
          ShowMessage('Campo C�digo do Usu�rio N�o Pode Esta em Branco!');
          exit;
        end;


      if (CHAlterarSenha.Checked=true) then
        begin
           if (VerificarSenhaDigitadasSaoIguais(EdtSenha.Text,EdtRepetiSenha.Text)=false) then
              begin
                ShowMessage('Senhas s�o diferentes');
                EdtSenha.SetFocus;
                Exit;
              end;
        end;

        Controller_Usuario_Editar(StrToInt(EdtCodigo.Text),EdtUsuario.Text,EdtSenha.Text,1);

     end;
  end;

  inherited;

end;

procedure TView_FrmCadUsuario.BtnNovoClick(Sender: TObject);
begin
  inherited;
  EdtUsuario.SetFocus;
  GbAlterarSenha.Enabled:=false;
  GbAlterarSenha.Visible:=false;
end;

end.
