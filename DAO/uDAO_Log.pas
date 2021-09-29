unit uDAO_Log;

interface
uses System.SysUtils, FireDAC.Stan.Param, System.Classes,
     Data.DB, Dialogs, uConexao_DAO, uLog;


type
  TDAO_log = Class(TDAOConexao)
  private

  public
    procedure Log_DAO_GravarLog(Mlog:TClasselog);
  End;

implementation

 procedure TDAO_log.Log_DAO_GravarLog(Mlog:TClasselog);
 begin
   //Gravação do log.
    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'INSERT INTO tb_log(log_idusuario, log_operacao, log_tabela, log_data, log_hora, log_registro) '
      +'VALUES(:log_idusuario, :log_operacao, :log_tabela, :log_data, :log_hora, :log_registro)';
      Qry.ParamByName('log_idusuario').AsInteger := Mlog.log_idusuario;
      Qry.ParamByName('log_operacao').AsString   := Mlog.log_operacao;
      Qry.ParamByName('log_tabela').AsString     := mlog.log_tabela;
      Qry.ParamByName('log_data').AsDate         := Date;
      Qry.ParamByName('log_hora').AsTime         := Time;
      Qry.ParamByName('log_registro').AsString   := Mlog.log_registro;
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
