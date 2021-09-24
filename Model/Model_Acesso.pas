unit Model_Acesso;

interface
uses System.SysUtils, FireDAC.Stan.Param, System.Classes,
     Data.DB, Dialogs, Model_Conexao_DAO;


type
  TAcesso = Class(TDAOConexao)
  private
    //Métodos Privados
  public
    //Métodos Públicos.
    function Model_Acesso_ValidarUsuarioStatus(Usuario:string):boolean;overload;
    function Model_Acesso_ValidarUsuario(Usuario,Senha:string):boolean;overload;
    function Model_Acesso_UsuarioExiste(Usuario:string):boolean;overload;
  End;


implementation

uses UDataModel, Model_Conexao;

function TAcesso.Model_Acesso_ValidarUsuarioStatus(Usuario:string):boolean;
begin
  //se o usuário estiver ativo no sistema 1(true) se não 0(false)
  Result := False;
    try

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'SELECT usu_status FROM tb_usuario WHERE usu_usuario=:usu_usuario AND usu_status=:usu_status;';
      Qry.ParamByName('usu_usuario').AsString := Usuario;
      Qry.ParamByName('usu_status').AsInteger := 1;
      Qry.Open;

      if (Qry.RecordCount <> 0) then
          result:=true

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao verificar status do usuário!' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

function TAcesso.Model_Acesso_ValidarUsuario(Usuario,Senha:string):boolean;
begin
  //Valida se o usuário e a senha estão corretos.
  Result := False;
    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'SELECT usu_usuario, usu_senha FROM tb_usuario '
      +'WHERE usu_usuario=:usu_usuario and usu_senha=:usu_senha';
      Qry.ParamByName('usu_usuario').AsString := Usuario;
      Qry.ParamByName('usu_senha').AsString   := senha;
      Qry.Open;

      if not(Qry.IsEmpty) then
          result:=true

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao verificar acesso do usuário,verifique seu Usuário/Senha!.' + sLineBreak + E.Message);
          abort;
        end;
    end;
end;

function TAcesso.Model_Acesso_UsuarioExiste(Usuario:string):boolean;
begin
  //Valida se o usuário e a senha estão corretos.
  Result := False;

    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'SELECT usu_usuario FROM tb_usuario '
      +'WHERE usu_usuario=:usu_usuario;';
      Qry.ParamByName('usu_usuario').AsString := Usuario;
      Qry.Open;

      if not(Qry.IsEmpty) then
          result:=true

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao verificar usuário!.' + sLineBreak + E.Message);
          abort;
        end;
    end;

end;

end.
