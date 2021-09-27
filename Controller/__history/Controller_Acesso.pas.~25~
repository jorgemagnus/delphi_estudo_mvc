unit Controller_Acesso;
//Unit de controle de acesso ao sistema pelo usuário.

interface
uses SysUtils, Model_Acesso, Dialogs, Forms;

//funções
function Controller_Acesso_ExisteOUsuario(Usuario:string):Boolean;
function Controller_Acesso_ValidarStatus(Usuario:string):boolean;
function Controller_Acesso_ValidarAcesso(Usuario,Senha:String):boolean;

//procedimentos
Procedure Controller_Acesso_VerificarCampos;
Procedure Controller_Acesso_Sistema(Usuario,Senha:String);

//Variáveis
var Acesso:TAcesso;

implementation

uses View_UFrmLogin, View_UFrmPrincipal;

function Controller_Acesso_ExisteOUsuario(Usuario:string):Boolean;
begin
  Result:=false;
  Acesso:=TAcesso.Create;
  if (Acesso.Model_Acesso_UsuarioExiste(Usuario)=true) then
     Result:=true;
end;

function Controller_Acesso_ValidarStatus(Usuario:string):boolean;
begin
   Result:=true;
   Acesso:=TAcesso.Create;
   if (Acesso.Model_Acesso_ValidarUsuarioStatus(Usuario)=false) then
      Result:=false;
end;

function Controller_Acesso_ValidarAcesso(Usuario,Senha:String):boolean;
begin
   Result:=false;
   Acesso:=TAcesso.Create;
   if (Acesso.Model_Acesso_ValidarUsuario(Usuario,Senha)=true) then
      Result:=true;
end;

Procedure Controller_Acesso_VerificarCampos;
begin
   with View_FrmLogin do
    begin
         if (View_FrmLogin.EdtUsuario.Text = '') then
             begin
                 ShowMessage('AVISO - INFORME USUÁRIO!.');
                 EdtUsuario.SetFocus;
                 Abort;
              end;

        if (View_FrmLogin.EdtSenha.Text = '') then
             begin
                 ShowMessage('AVISO - INFORME SENHA DE ACESSO!.');
                 EdtSenha.SetFocus;
                 Abort;
              end;

        if ((View_FrmLogin.EdtUsuario.Text = '') AND (View_FrmLogin.EdtSenha.Text = '')) then
             begin
                 ShowMessage('AVISO - OBRIGATÓRIO INFORMAR USUÁRIO E SENHA PARA ACESSO AO SISTEMA!.');
                 EdtUsuario.SetFocus;
                 Abort;
              end;
    end;
end;

Procedure Controller_Acesso_Sistema(Usuario,Senha:String);
begin

   //1 Passo, Verifico os campos.
   Controller_Acesso_VerificarCampos;

  //2 Passo, verifico se o usuário existe.
  if (Controller_Acesso_ExisteOUsuario(Usuario)=true) then
     begin

       //3 Passo, Verifico o status dele, se ativo, ok.
        if (Controller_Acesso_ValidarStatus(Usuario)=true) then
           begin

             //4 Passo, Aprovar o Acesso.
             if (Controller_Acesso_ValidarAcesso(Usuario,Senha)=true) then
                begin
                   with (View_FrmPrincipal) do
                      begin
                         BarraStatusPrincipal.Panels[0].Text:=DateToStr(Date);
                         BarraStatusPrincipal.Panels[2].Text:=UpperCase(Usuario);
                         BarraStatusPrincipal.Panels[3].Text:=UpperCase('BEM-VINDO AO SISTEMA : '+Usuario);
                      end;
                      View_FrmLogin.Close;
                      View_FrmPrincipal.Show;
                end
             else
               begin
                 ShowMessage('ATENÇÃO!!! - Verique sua Senha!.');
                 View_FrmLogin.EdtSenha.SetFocus;
                 abort;
               end;


           end
        else
          begin
            ShowMessage('Usuário: '+UpperCase(Usuario)+' encontra-se inativo no sistema!.');
            View_FrmLogin.EdtUsuario.SetFocus;
            abort;
          end;


     end
  else
     begin
        ShowMessage('Usuário: '+UpperCase(Usuario)+' não existe!');
        View_FrmLogin.EdtUsuario.SetFocus;
        abort;
     end;


end;

end.
