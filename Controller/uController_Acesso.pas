unit uController_Acesso;
//Unit de controle de acesso ao sistema pelo usuário.

interface
uses SysUtils, Dialogs, Forms, uUsuario, uDAO_Acesso, Vcl.StdCtrls;

type
TControllerAcesso = class
   private
    FOUSuarioAcesso   : TUsuario;
    FOUsuarioAcessoDAO: TDAOAcesso;
    DaoAcesso:TDAOAcesso;
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
    procedure Controller_validarCampoUsuario(campo:TEdit;mensagem:string);
    procedure Controller_Acesso_Sistema(vUsuario:TUsuario);


    var LoginAprovado:Boolean;
end;


implementation

{ TControllerAcesso }

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
  if (DaoAcesso.DAO_Acesso_UsuarioExiste(Usuario)) then
     Result:=true;
end;

function TControllerAcesso.Controller_Acesso_ValidarStatus(Usuario:string):boolean;
begin
   Result:=false;
   DaoAcesso:=TDAOAcesso.Create;
   if (DaoAcesso.DAO_Acesso_ValidarUsuarioStatus(Usuario)) then
      Result:=true;
end;

function TControllerAcesso.Controller_Acesso_ValidarAcesso(Usuario,Senha:String):boolean;
begin
   Result:=false;
   DaoAcesso:=TDAOAcesso.Create;
   if (DaoAcesso.DAO_Acesso_ValidarUsuario(Usuario,Senha)) then
      Result:=true;
end;

procedure TControllerAcesso.Controller_validarCampoUsuario(campo:TEdit;mensagem:string);
begin
    if (campo.text) = EmptyStr then
      begin
       campo.SetFocus;
       ShowMessage('ATENÇÃO - '+mensagem);
       abort;
      end;
end;

procedure TControllerAcesso.Controller_Acesso_Sistema(vUsuario:TUsuario);
begin
   LoginAprovado:=false;
  //1 Passo, verifico se o usuário existe.
  if (Controller_Acesso_ExisteOUsuario(VUsuario.USU_USUARIO)) then
     begin
       //2 Passo, Verifico o status dele, se ativo, ok.
        if (Controller_Acesso_ValidarStatus(VUsuario.USU_USUARIO)) then
           begin
             //3 Passo, Aprovar o Acesso.
             if (Controller_Acesso_ValidarAcesso(VUsuario.USU_USUARIO,VUsuario.USU_SENHA)) then
                  LoginAprovado:=true
             else
               begin
                 ShowMessage('ATENÇÃO! - Seu Login não foi Aprovado, é provável que sua Senha Esteja Errada!.');
                 abort;
               end;
           end
        else
          begin
            ShowMessage('Usuário: '+UpperCase(VUsuario.USU_USUARIO)+' encontra-se inativo no sistema!.');
            abort;
          end;
     end
  else
     begin
        ShowMessage('Usuário: '+UpperCase(VUsuario.USU_USUARIO)+' não existe!');
        abort;
     end;


end;

end.
