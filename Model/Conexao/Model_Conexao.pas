unit Model_Conexao;
{Respons�vel pela conex�o com o banco de dados}

interface

uses Data.DB,Dialogs,System.SysUtils;

function AtivarConecao(StatusConexao:integer):Boolean;


implementation

uses Model_Conexao_Parametros,UDataModel;

function AtivarConecao(StatusConexao:integer):Boolean;
begin
    Result:=false;

    try
      case StatusConexao of
        1:begin
           //Ativar conex�o com o banco de dados.
          DataModel.DBConexao.Params.Values['Database']   :=FDataBase;
          DataModel.DBConexao.Params.Values['User_Name']  :=FUserName;
          DataModel.DBConexao.Params.Values['Password']   :=FPassword;
          DataModel.DbMySQLLink.VendorLib                 :=FVendorLib;
          DataModel.DBConexao.Connected                   :=True;
          Result                                          :=true;
        end;
        2:begin
           DataModel.DBConexao.Connected := false;
           Result := false;
        end;
      end;
    Except
       on E: EDatabaseError do
           begin
		        ShowMessage(E.Message+' - VERIFIQUE SUA CONEX�O COM O BANCO DE DADOS!. (ver Fun��o AtivarConexao em Model_Conexao');
            abort;
           end;
    end;
end;

end.
