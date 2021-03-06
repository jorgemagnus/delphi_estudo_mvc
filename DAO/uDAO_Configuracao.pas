unit uDAO_Configuracao;

interface
uses System.SysUtils, FireDAC.Stan.Param, System.Classes,
     Data.DB, Dialogs, uConexao_DAO;


type
  TConfiguracao = Class(TDAOConexao)
  private
    //M?todos Privados
  public
    //M?todos P?blicos.
    procedure Model_Configuracao_Gravar(id:integer;Configuracao:string;campo:integer);
    procedure Model_Configuracao_PreencherCampoLocalFoto(id:integer);
  End;


implementation

uses uController_Configuracao;

procedure TConfiguracao.Model_Configuracao_Gravar(id:integer;Configuracao:string;campo:integer);
begin
  //Gravar registro de configura??o.
    try
      Qry.Close;
      Qry.SQL.Clear;
      case campo of
      1:begin
          Qry.SQL.Text := 'UPDATE tb_configuracao set con_local_foto=:con_local_foto '+
          'WHERE idconfiguracao=:idconfiguracao ';
          Qry.ParamByName('con_local_foto').AsString  := Configuracao;
          Qry.ParamByName('idconfiguracao').AsInteger := id;
        end;
      end;
      Qry.ExecSQL;
      ShowMessage('REGISTRO GRAVADO COM SUCESSO!.');
    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao atualizar registro!' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;

procedure TConfiguracao.Model_Configuracao_PreencherCampoLocalFoto(id:integer);
begin

    try
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'select idconfiguracao,con_local_foto from tb_configuracao '+
      'WHERE idconfiguracao=:idconfiguracao ';
      Qry.ParamByName('idconfiguracao').AsInteger := id;
      Qry.open;
      case id of
       1:begin
         //Local das fotos.
         id_       :=Qry.FieldByName('idconfiguracao').AsInteger;
         localFoto :=Qry.FieldByName('con_local_foto').AsString;
       end;
      end;
    except
      on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao atualizar registro!' + sLineBreak + E.Message);
          Abort;
        end;
    end;
end;


end.
