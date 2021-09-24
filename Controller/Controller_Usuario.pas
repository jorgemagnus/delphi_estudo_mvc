unit Controller_Usuario;

interface
uses SysUtils, Dialogs, Model_Usuario;

//procedures
procedure Controller_Usuario_VerificarSeJaExiste(Usuario:string);
procedure Controller_Usuario_Gravar(Usuario,Senha:string);
procedure Controller_Usuario_Editar(id:integer;Usuario,Senha:string;Status:integer);
procedure Controller_Usuario_CamposObrigatoriosParaGravar;

var Usuario_:TUsuario_;
    IdUsuario:integer;

implementation

uses View_UFrmCadUsuario;

procedure Controller_Usuario_VerificarSeJaExiste(Usuario:string);
begin
   Usuario_:=TUsuario_.Create;
   Usuario_.Model_Usuario_VerificarSeJaExiste(Usuario);
end;

procedure Controller_Usuario_Gravar(Usuario,Senha:string);
begin
   Usuario_:=TUsuario_.Create;
   Usuario_.Model_Usuario_Gravar(Usuario,Senha);
   View_FrmCadUsuario.EdtCodigo.Text:=IntToStr(IdUsuario);
end;

procedure Controller_Usuario_Editar(id:integer;Usuario,Senha:string;Status:integer);
begin
  Usuario_:=TUsuario_.Create;
  Usuario_.Model_Usuario_Editar(id,Usuario,Senha,Status);
end;

procedure Controller_Usuario_CamposObrigatoriosParaGravar;
begin
  //Campos obrigatórios ao Gravar ou Editar registro.
  if (View_FrmCadUsuario.EdtUsuario.Text = '') then
   begin
       ShowMessage('OBRIGATÓRIO USUÁRIO');
       View_FrmCadUsuario.EdtUsuario.SetFocus;
       Abort;
   end;

   if (View_FrmCadUsuario.EdtUsuario.Text = '') then
   begin
       ShowMessage('OBRIGATÓRIO SENHA');
       View_FrmCadUsuario.EdtSenha.SetFocus;
       Abort;
   end;

end;




end.
