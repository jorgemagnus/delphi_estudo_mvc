unit Controller_Acesso;
//Unit de controle de acesso ao sistema pelo usuário.

interface
uses SysUtils,Model_Acesso;

//funções
function Controller_Acesso_ValidarStatus(Usuario:string):boolean;
function Controller_Acesso_ValidarAcesso(Usuario,Senha:String):boolean;
function Controller_Acesso_EntradaAcessoLogin(Usuario,Senha:String):integer;
function Controller_Acesso_ExisteOUsuario(Usuario:string):Boolean;

//procedimentos

//Variáveis
var Acesso:TAcesso;

implementation

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

function Controller_Acesso_EntradaAcessoLogin(Usuario,Senha:String):integer;
begin
   result:=0;

   if (Usuario.IsEmpty) then
       Result:=1;

   if (Senha.IsEmpty) then
       Result:=2;

   if ((Usuario.IsEmpty) and (Senha.IsEmpty))  then
       Result:=3;
end;

function Controller_Acesso_ExisteOUsuario(Usuario:string):Boolean;
begin
  Result:=false;
  Acesso:=TAcesso.Create;
  if (Acesso.Model_Acesso_UsuarioExiste(Usuario)=true) then
     Result:=true;
end;

end.
