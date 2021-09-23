unit Model_Conexao_Parametros;
{Conex�o do sistema com base nas configura��es do arquivo INI.}

interface

  uses DateUtils, IniFiles, StrUtils, SysUtils;


Function FDataBase():string;
Function FHostName():string;
Function FUserName():string;
Function FPassword():string;
Function FVendorLib():string;


implementation

uses Funcoes_Gerais;

Function FDataBase():string;
var DataBase:String;
begin
  DataBase:=LerArquivoIni('conexao', 'Database','');
  Result:=DataBase;
end;

Function FHostName():string;
Var HostName:String;
begin
  HostName:= LerArquivoIni('conexao', 'HostName','');
  Result:=HostName;
end;

Function FUserName():string;
 Var UserName:string;
begin
  UserName:=LerArquivoIni('conexao', 'UserName','');
  Result:=UserName;
end;

Function FPassword():string;
Var Password:string;
begin
  Password:=LerArquivoIni('conexao', 'Password','');
  Result:=Password;
end;

Function FVendorLib():string;
Var VendorLib:string;
begin
  VendorLib:=LerArquivoIni('conexao', 'VendorLib','');
  Result:=VendorLib;
end;





end.
