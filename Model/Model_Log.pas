unit Model_Log;

interface
uses System.SysUtils, FireDAC.Stan.Param, System.Classes,
     Data.DB, Dialogs, Model_Conexao_DAO;


type
  Tlog_ = Class(TDAOConexao)
  private
    //M�todos Privados

  public
    //M�todos P�blicos.

    //procedures
    procedure Log_Model_GravarLog(idusuario:integer;Operacao,Tabela,Registro:string);

  End;

implementation

 procedure Tlog_.Log_Model_GravarLog(idusuario:integer;Operacao,Tabela,Registro:string);
 begin
   //Grava��o do log.
    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'INSERT INTO tb_log(log_idusuario, log_operacao, log_tabela, log_data, log_hora, log_registro) '
      +'VALUES(:log_idusuario, :log_operacao, :log_tabela, :log_data, :log_hora, :log_registro)';
      Qry.ParamByName('log_idusuario').AsInteger := idusuario;
      Qry.ParamByName('log_operacao').AsString   := Operacao;
      Qry.ParamByName('log_tabela').AsString     := tabela;
      Qry.ParamByName('log_data').AsDate         := Date;
      Qry.ParamByName('log_hora').AsTime         := Time;
      Qry.ParamByName('log_registro').AsString   := Registro;
      Qry.ExecSQL;

    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao gravar log!' + sLineBreak + E.Message);
          Abort;
        end;
    end;

 end;

end.