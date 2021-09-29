program Aplicativo;

uses
  Vcl.Forms,
  View_UFrmPrincipal in '..\View\View_UFrmPrincipal.pas' {View_FrmPrincipal},
  View_UFrmLogin in '..\View\View_UFrmLogin.pas' {View_FrmLogin},
  View_UFrmPadraoSimples in '..\View\Heranca\View_UFrmPadraoSimples.pas' {View_FrmPadraoSimples},
  View_UFrmPadraoCadastro in '..\View\Heranca\View_UFrmPadraoCadastro.pas' {View_FrmPadraoCadastro},
  uController_Acesso in '..\Controller\uController_Acesso.pas',
  uDAO_Acesso in '..\DAO\uDAO_Acesso.pas',
  uController_Configuracao in '..\Controller\uController_Configuracao.pas',
  uDAO_Configuracao in '..\DAO\uDAO_Configuracao.pas',
  View_UFrmConfiguracao in '..\View\View_UFrmConfiguracao.pas' {View_FrmConfiguracao},
  View_UFrmCadUsuario in '..\View\View_UFrmCadUsuario.pas' {View_FrmCadUsuario},
  uConexao in '..\DAO\Conexao\uConexao.pas',
  uConexao_Parametros in '..\DAO\Conexao\uConexao_Parametros.pas',
  uDAO_DataModel in '..\DAO\Conexao\uDAO_DataModel.pas' {DataModel: TDataModule},
  Rotinas in '..\Arquivo\Rotinas\Rotinas.pas',
  uDAO_Log in '..\DAO\uDAO_Log.pas',
  uController_Log in '..\Controller\uController_Log.pas',
  uUsuario in '..\Classes\uUsuario.pas',
  uController_Usuario in '..\Controller\uController_Usuario.pas',
  uDAO_Usuario in '..\DAO\uDAO_Usuario.pas',
  uLog in '..\Classes\uLog.pas',
  uConexao_DAO in '..\DAO\Conexao\uConexao_DAO.pas',
  uPessoa in '..\Classes\uPessoa.pas',
  uController_Pessoa in '..\Controller\uController_Pessoa.pas',
  uDAO_Pessoa in '..\DAO\uDAO_Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  {$WARN SYMBOL_PLATFORM OFF} //tira o aviso de DebugHook quanto a especificar a plataforma.
  ReportMemoryLeaksOnShutdown := (DebugHook = 1);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TView_FrmPrincipal, View_FrmPrincipal);
  Application.CreateForm(TView_FrmLogin, View_FrmLogin);
  Application.CreateForm(TDataModel, DataModel);
  Application.Run;
end.
