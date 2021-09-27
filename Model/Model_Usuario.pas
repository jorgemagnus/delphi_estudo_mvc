unit Model_Usuario;

interface
uses System.SysUtils, FireDAC.Stan.Param, System.Classes,
     Data.DB, Dialogs, Model_Conexao_DAO;


type
  TUsuario_ = Class(TDAOConexao)
  private
    //M�todos Privados
    function Model_Usuario_RetornaIDUsuario(Usuario:string):Integer;
  public
    //M�todos P�blicos.

    //fun��es
    function Model_Usuario_VerificarSeJaExiste(Usuario:string):boolean;

    //procedures
    procedure Model_Usuario_Gravar(Usuario,Senha:string);
    procedure Model_Usuario_Editar(id:integer;Usuario,Senha:string;Status:integer);
  End;


implementation

uses Controller_Usuario, Controller_Log;

function TUsuario_.Model_Usuario_VerificarSeJaExiste(Usuario:string):boolean;
begin
  Result := False;
    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'SELECT usu_usuario FROM tb_usuario WHERE usu_usuario=:usu_usuario ';
      Qry.ParamByName('usu_usuario').AsString := Usuario;
      Qry.Open();

      if (Qry.RecordCount <> 0) then
          result:=true

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao verificar se usu�rio j� cadastrado.' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

function TUsuario_.Model_Usuario_RetornaIDUsuario(Usuario:string):Integer;
begin
  //fun��o para uso apenas nessa unit.
  result:=0;
    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text :='SELECT idusuario FROM tb_usuario WHERE usu_usuario=:usu_usuario;';
      Qry.ParamByName('usu_usuario').AsString := Usuario;
      Qry.Open;

      if (Qry.RecordCount <> 0) then
          result:=Qry.FieldByName('idusuario').AsInteger;

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao verificar usu�rio.' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

procedure TUsuario_.Model_Usuario_Gravar(Usuario,Senha:string);
begin
  //Gravar Usu�rio;
  if (Model_Usuario_VerificarSeJaExiste(Usuario) = true) then
     begin
       ShowMessage('Usu�rio: '+UpperCase(Usuario)+' J� existe no sistema');
       abort;
     end;


    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'INSERT INTO tb_usuario(usu_usuario, usu_senha,usu_status) '
      +'VALUES(:usu_usuario, :usu_senha, :usu_status)';
      Qry.ParamByName('usu_usuario').AsString := Usuario;
      Qry.ParamByName('usu_senha').AsString   := Senha;
      Qry.ParamByName('usu_status').AsInteger := 1;
      Qry.ExecSQL;

      IdUsuario:=Model_Usuario_RetornaIDUsuario(Usuario);
      Controller_Log_Gravar(IdUsuario,'INSERT','tb_usuario','usu_usuario ('+Usuario+')');

      ShowMessage('REGISTRO GRAVADO COM SUCESSO!.');

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao gravar usu�rio!' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

procedure TUsuario_.Model_Usuario_Editar(id:integer;Usuario,Senha:string;Status:integer);
begin

    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'UPDATE tb_usuario SET usu_usuario=:usu_usuario, usu_senha=:usu_senha '
      +'usu_status=:usu_status WHERE idusuario=:idusuario';
      Qry.ParamByName('usu_usuario').AsString := Usuario;
      Qry.ParamByName('usu_senha').AsString   := senha;
      Qry.ParamByName('usu_status').AsInteger := Status;
      Qry.ExecSQL;

      Controller_Log_Gravar(id,'UPDATE','tb_usuario','usu_usuario ('+Usuario+')');
      ShowMessage('REGISTRO ATUALIZADO COM SUCESSO!.');

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao editar usu�rio!.' + sLineBreak + E.Message);
          abort;
        end;
    end;

end;


end.
