unit uController_Configuracao;
////Unit de controle das configurações do sistema.

interface
uses DateUtils, IniFiles, StrUtils, SysUtils, Dialogs, uDAO_Configuracao;


//procedimentos
procedure Controller_Configuracao_Gravar(id:integer;Configuracao:string;campo:integer);
procedure Controller_Configuracao_PreencherCamposLocalFoto;


//Variáveis
var Configuracao_:TConfiguracao;
    id_:Integer;
    localFoto:string;



implementation

uses  View_UFrmConfiguracao;

procedure Controller_Configuracao_Gravar(id:integer;Configuracao:string;campo:integer);
begin
    Configuracao_:=TConfiguracao.Create;

    case (campo) of
     1:begin
        if (Configuracao.IsEmpty) then
            begin
              ShowMessage('Obrigatório informar local para gravação das fotos!.');
              abort;
            end
        else
           Configuracao_.Model_Configuracao_Gravar(id,Configuracao,campo)
       end;
    end;
end;

procedure Controller_Configuracao_PreencherCamposLocalFoto;
begin
  //preencher tela.
  Configuracao_:=TConfiguracao.Create;
  Configuracao_.Model_Configuracao_PreencherCampoLocalFoto(1);
  View_FrmConfiguracao.EdtIDLocalFoto.Text:=IntTostr(id_);
  View_FrmConfiguracao.EdtLocalFoto.Text:=localFoto;
end;




end.
