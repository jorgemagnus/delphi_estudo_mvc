unit uConexao_Parametros;
{Conexão do sistema com base nas configurações do arquivo INI.}

interface

  uses IniFiles, SysUtils;


Function FDataBase():string;
Function FHostName():string;
Function FUserName():string;
Function FPassword():string;
Function FVendorLib():string;


implementation

uses Rotinas;

Function FDataBase():string;
begin
  Result:=LerArquivoIni('conexao', 'Database','');
end;

Function FHostName():string;
begin
  Result:=LerArquivoIni('conexao', 'HostName','');
end;

Function FUserName():string;
begin
  Result:=LerArquivoIni('conexao', 'UserName','');
end;

Function FPassword():string;
begin
  Result:=LerArquivoIni('conexao', 'Password','');
end;

Function FVendorLib():string;
begin
  Result:=LerArquivoIni('conexao', 'VendorLib','');
end;





end.
