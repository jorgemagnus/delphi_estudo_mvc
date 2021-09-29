unit uDAO_Usuario;

interface

uses System.SysUtils, FireDAC.Stan.Param, System.Classes,
     Data.DB, Dialogs, uUsuario, uController_Log, uConexao_DAO;

type
  TDaoUsuario = Class(TDAOConexao)
  private
     var logController:TControllerLog;

  public
    function Model_Usuario_RetornaIDUsuario(Usuario:String):Integer;
    function Model_Usuario_VerificarSeJaExiste(Usuario:string):boolean;

    procedure Model_Usuario_Gravar(MUsuario:TUsuario);
    procedure Model_Usuario_Editar(MUsuario:TUsuario);

  end;

implementation

{TDaoUsuario}

function TDaoUsuario.Model_Usuario_VerificarSeJaExiste(Usuario:string):boolean;
begin
  Result := False;
    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'SELECT usu_usuario FROM tb_usuario WHERE usu_usuario=:usu_usuario ';
      Qry.ParamByName('usu_usuario').AsString := Usuario;
      Qry.Open;

      if (Qry.RecordCount <> 0) then
          result:=true

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao verificar se usuário já cadastrado.' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

function TDaoUsuario.Model_Usuario_RetornaIDUsuario(Usuario:String):Integer;
begin
  //função para uso apenas nessa unit.
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
          ShowMessage('Ocorreu um erro ao verificar usuário.' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

procedure TDaoUsuario.Model_Usuario_Gravar(MUsuario:TUsuario);
begin
  //Gravar Usuário;
  if (Model_Usuario_VerificarSeJaExiste(MUsuario.USU_USUARIO) = true) then
     begin
       ShowMessage('Usuário: '+UpperCase(MUsuario.USU_USUARIO)+' Já existe no sistema');
       abort;
     end;


    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'INSERT INTO tb_usuario(usu_usuario, usu_senha,usu_status) '
      +'VALUES(:usu_usuario, :usu_senha, :usu_status)';
      Qry.ParamByName('usu_usuario').AsString := MUsuario.USU_USUARIO;
      Qry.ParamByName('usu_senha').AsString   := MUsuario.USU_SENHA;
      Qry.ParamByName('usu_status').AsInteger := 1;
      Qry.ExecSQL;

      MUsuario.USU_CODIGO:=Model_Usuario_RetornaIDUsuario(MUsuario.USU_USUARIO);

      logController:=TControllerLog.Create;
      logController.OClog.log_idusuario :=MUsuario.USU_CODIGO;
      logController.OClog.log_operacao  :='INSERT';
      logController.OClog.log_tabela    :='tb_usuario';
      logController.OClog.log_registro  := IntTostr(MUsuario.USU_CODIGO) +' / '+ MUsuario.USU_USUARIO;
      logController.procIncluirLog;

      ShowMessage('REGISTRO GRAVADO COM SUCESSO!.');

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao gravar usuário!' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

procedure TDaoUsuario.Model_Usuario_Editar(MUsuario:TUsuario);
begin

    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'UPDATE tb_usuario SET usu_usuario=:usu_usuario, usu_senha=:usu_senha '
      +'usu_status=:usu_status WHERE idusuario=:idusuario';
      Qry.ParamByName('usu_usuario').AsString := MUsuario.USU_USUARIO;
      Qry.ParamByName('usu_senha').AsString   := MUsuario.USU_SENHA;
      Qry.ParamByName('usu_status').AsInteger := 1;
      Qry.ParamByName('idusuario').AsInteger  := MUsuario.USU_CODIGO;
      Qry.ExecSQL;

      logController:=TControllerLog.Create;
      logController.OClog.log_idusuario :=MUsuario.USU_CODIGO;
      logController.OClog.log_operacao  :='UPDATE';
      logController.OClog.log_tabela    :='tb_usuario';
      logController.OClog.log_registro  := IntTostr(MUsuario.USU_CODIGO) +' / '+ MUsuario.USU_USUARIO;
      logController.procIncluirLog;

      ShowMessage('REGISTRO ATUALIZADO COM SUCESSO!.');

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao editar usuário!.' + sLineBreak + E.Message);
          abort;
        end;
    end;

end;


end.
