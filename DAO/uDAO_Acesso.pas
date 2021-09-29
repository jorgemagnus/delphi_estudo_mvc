unit uDAO_Acesso;

interface
uses System.SysUtils, FireDAC.Stan.Param, System.Classes,
     Data.DB, Dialogs, uConexao_DAO;


type
  TDAOAcesso = Class(TDAOConexao)
  private
    //M�todos Privados
  public
    //M�todos P�blicos.
    function DAO_Acesso_ValidarUsuarioStatus(Usuario:string):boolean;
    function DAO_Acesso_ValidarUsuario(Usuario,Senha:string):boolean;
    function DAO_Acesso_UsuarioExiste(Usuario:string):boolean;
  End;


implementation


function TDAOAcesso.DAO_Acesso_ValidarUsuarioStatus(Usuario:string):boolean;
begin
  //se o usu�rio estiver ativo no sistema 1(true) se n�o 0(false)
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
          ShowMessage('Ocorreu um erro ao verificar status do usu�rio!' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

function TDAOAcesso.DAO_Acesso_ValidarUsuario(Usuario,Senha:string):boolean;
begin
  //Valida se o usu�rio e a senha est�o corretos.
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
          ShowMessage('Ocorreu um erro ao verificar acesso do usu�rio,verifique seu Usu�rio/Senha!.' + sLineBreak + E.Message);
          abort;
        end;
    end;
end;

function TDAOAcesso.DAO_Acesso_UsuarioExiste(Usuario:string):boolean;
begin
  //Valida se o usu�rio e a senha est�o corretos.
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
          ShowMessage('Ocorreu um erro ao verificar usu�rio!.' + sLineBreak + E.Message);
          abort;
        end;
    end;

end;

end.

