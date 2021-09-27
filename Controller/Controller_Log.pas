unit Controller_Log;

interface

uses SysUtils, Dialogs, Model_Log;

//procedures
procedure Controller_Log_Gravar(idusuario:integer;Operacao,Tabela,Registro:string);

var Ulog:Tlog_;

implementation

procedure Controller_Log_Gravar(idusuario:integer;Operacao,Tabela,Registro:string);
begin
   Ulog:=Tlog_.Create;
   Ulog.Log_Model_GravarLog(idusuario,Operacao,Tabela,Registro);
end;



end.
