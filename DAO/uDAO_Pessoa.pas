unit uDAO_Pessoa;

interface
uses System.SysUtils, FireDAC.Stan.Param, System.Classes,
     Data.DB, Dialogs, uConexao_DAO, uController_Log, uPessoa;
type
  TDaoPessoa = class(TDaoConexao)
    Private

    public
     //Métodos
     function DAO_Pessoa_SeJaExiste(CPessoa:TPessoa):Boolean;
     procedure DAO_Pessoa_Gravar(CPessoa:TPessoa);
     procedure DAO_Pessoa_Editar(CPessoa:TPessoa);
     procedure DAO_Pessoa_Excluir(CPessoa:TPessoa);
  end;

implementation

{TDaoPessoa}

function TDaoPessoa.DAO_Pessoa_SeJaExiste(CPessoa:TPessoa):boolean;
begin
   //Se já existe retorna true;
   Result:=false;
end;

procedure TDaoPessoa.DAO_Pessoa_Gravar(CPessoa:TPessoa);
begin
  //Insert into () values ();
end;
procedure TDaoPessoa.DAO_Pessoa_Editar(CPessoa:TPessoa);
begin
  //update tabela set valores=:valores Where ...
end;
procedure TDaoPessoa.DAO_Pessoa_Excluir(CPessoa:TPessoa);
begin
 //Delete from  where... ou caso so mudar status para inativo usar update.
end;

end.
