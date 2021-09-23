unit Funcoes_Gerais;

interface

uses DateUtils, IniFiles, StrUtils, SysUtils, Dialogs, Forms;

//BLOCO FUNÇÕES
Function LerArquivoIni(NomedaSessao,ValorDaSessao,Variavel:string):string;
function VerificarSenhaDigitadasSaoIguais(senha_1,senha_2:string):Boolean;

//BLOCO DE PROCEDURES

implementation

Function LerArquivoIni(NomedaSessao,ValorDaSessao,Variavel:string):string;
Var ArquivoIni:TIniFile;
    CaminhoArquivo:string;
begin
  //Verifico Primeiro se tem o arquivo.
  CaminhoArquivo:= 'C:\Projetos\DELPHI\Aplicativo\Arquivo\INI\Config.ini';
  //caso positivo leio seus dados.
  ArquivoIni:=TIniFile.Create(CaminhoArquivo);
  Result:=ArquivoIni.ReadString(NomedaSessao,ValorDaSessao,Variavel);
  ArquivoIni.Free;
end;

function VerificarSenhaDigitadasSaoIguais(senha_1,senha_2:string):Boolean;
begin
   Result:=false;
   if (senha_1 = senha_2) then
   Result:=true;
end;


end.
