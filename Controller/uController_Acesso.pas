unit uController_Acesso;
//Unit de controle de acesso ao sistema pelo usuário.

interface
uses SysUtils, Dialogs, Forms, uUsuario, uDAO_Acesso;

type
TControllerAcesso = class
   private
    FOUSuarioAcesso   : TUsuario;
    FOUsuarioAcessoDAO: TDAOAcesso;
  public
    constructor Create;
    destructor Destroy; override;

    property OUsuarioAcesso: TUsuario read FOUSuarioAcesso write FOUSuarioAcesso;
    property OUsuarioAcessoDAO: TDAOAcesso read FOUsuarioAcessoDAO write FOUsuarioAcessoDAO;

    //funções
    function Controller_Acesso_ExisteOUsuario(Usuario:string):Boolean;
    function Controller_Acesso_ValidarStatus(Usuario:string):boolean;
    function Controller_Acesso_ValidarAcesso(Usuario,Senha:String):boolean;


    //procedimentos
    Procedure Controller_Acesso_VerificarCampos(VUsuario:TUsuario);
    procedure Controller_Acesso_Sistema(vUsuario:TUsuario);


    var DaoAcesso:TDAOAcesso;
end;


implementation

{ TControllerAcesso }

uses View_UFrmLogin, View_UFrmPrincipal;

constructor TControllerAcesso.Create;
begin
  Self.FOUSuarioAcesso    := TUsuario.Create;
  Self.FOUsuarioAcessoDAO := TDAOAcesso.Create;
end;

destructor TControllerAcesso.Destroy;
begin
  inherited;
  FreeAndNil(FOUSuarioAcesso);
  FreeAndNil(FOUsuarioAcessoDAO);
end;

function TControllerAcesso.Controller_Acesso_ExisteOUsuario(Usuario:string):Boolean;
begin
  Result:=false;
  DaoAcesso:=TDAOAcesso.Create;
  if (DaoAcesso.DAO_Acesso_UsuarioExiste(Usuario)=true) then
     Result:=true;
end;

function TControllerAcesso.Controller_Acesso_ValidarStatus(Usuario:string):boolean;
begin
   Result:=true;
   DaoAcesso:=TDAOAcesso.Create;
   if (DaoAcesso.DAO_Acesso_ValidarUsuarioStatus(Usuario)=false) then
      Result:=false;
end;

function TControllerAcesso.Controller_Acesso_ValidarAcesso(Usuario,Senha:String):boolean;
begin
   Result:=false;
   DaoAcesso:=TDAOAcesso.Create;
   if (DaoAcesso.DAO_Acesso_ValidarUsuario(Usuario,Senha)=true) then
      Result:=true;
end;

Procedure TControllerAcesso.Controller_Acesso_VerificarCampos(Vusuario:TUsuario);
begin
     if (VUsuario.USU_USUARIO.IsEmpty = true) then
             begin
                 ShowMessage('AVISO - INFORME USUÁRIO!.');
                 View_FrmLogin.EdtUsuario.SetFocus;
                 Abort;
              end;

     if (VUsuario.USU_SENHA.IsEmpty = true) then
             begin
                 ShowMessage('AVISO - INFORME SENHA DE ACESSO!.');
                 View_FrmLogin.EdtSenha.SetFocus;
                 Abort;
              end;

     if ((VUsuario.USU_USUARIO.IsEmpty = true) AND (VUsuario.USU_SENHA.IsEmpty = true)) then
             begin
                 ShowMessage('AVISO - OBRIGATÓRIO INFORMAR USUÁRIO E SENHA PARA ACESSO AO SISTEMA!.');
                 View_FrmLogin.EdtUsuario.SetFocus;
                 Abort;
              end;
end;

procedure TControllerAcesso.Controller_Acesso_Sistema(vUsuario:TUsuario);
begin

   //1 Passo, Verifico os campos.
   Controller_Acesso_VerificarCampos(vUsuario);

  //2 Passo, verifico se o usuário existe.
  if (Controller_Acesso_ExisteOUsuario(VUsuario.USU_USUARIO)=true) then
     begin

       //3 Passo, Verifico o status dele, se ativo, ok.
        if (Controller_Acesso_ValidarStatus(VUsuario.USU_USUARIO)=true) then
           begin

             //4 Passo, Aprovar o Acesso.
             if (Controller_Acesso_ValidarAcesso(VUsuario.USU_USUARIO,VUsuario.USU_SENHA)=true) then
                begin
                   //5 Passo, verifico o que o usuario tem acesso dos menus.
                     //Controller_Acesso_Menu(usuario);

                   with (View_FrmPrincipal) do
                      begin
                         BarraStatusPrincipal.Panels[0].Text:=DateToStr(Date);
                         BarraStatusPrincipal.Panels[2].Text:=UpperCase(VUsuario.USU_USUARIO);
                         BarraStatusPrincipal.Panels[3].Text:=UpperCase('BEM-VINDO AO SISTEMA : '+VUsuario.USU_USUARIO);
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
            ShowMessage('Usuário: '+UpperCase(VUsuario.USU_USUARIO)+' encontra-se inativo no sistema!.');
            View_FrmLogin.EdtUsuario.SetFocus;
            abort;
          end;


     end
  else
     begin
        ShowMessage('Usuário: '+UpperCase(VUsuario.USU_USUARIO)+' não existe!');
        View_FrmLogin.EdtUsuario.SetFocus;
        abort;
     end;


end;

end.
