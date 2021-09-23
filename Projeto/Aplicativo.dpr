program Aplicativo;

uses
  Vcl.Forms,
  View_UFrmPrincipal in '..\View\View_UFrmPrincipal.pas' {View_FrmPrincipal},
  View_UFrmLogin in '..\View\View_UFrmLogin.pas' {View_FrmLogin},
  View_UFrmPadraoSimples in '..\View\Heranca\View_UFrmPadraoSimples.pas' {View_FrmPadraoSimples},
  View_UFrmPadraoCadastro in '..\View\Heranca\View_UFrmPadraoCadastro.pas' {View_FrmPadraoCadastro},
  Model_Conexao in '..\Model\Model_Conexao.pas',
  Model_Conexao_Parametros in '..\Model\Model_Conexao_Parametros.pas',
  Funcoes_Gerais in '..\Arquivo\Funcoes_Gerais\Funcoes_Gerais.pas',
  UDataModel in '..\Model\UDataModel.pas' {DataModel: TDataModule},
  Controller_Acesso in '..\Controller\Controller_Acesso.pas',
  Model_Acesso in '..\Model\Model_Acesso.pas',
  Controller_Configuracao in '..\Controller\Controller_Configuracao.pas',
  Model_Configuracao in '..\Model\Model_Configuracao.pas',
  View_UFrmConfiguracao in '..\View\View_UFrmConfiguracao.pas' {View_FrmConfiguracao},
  Controller_Usuario in '..\Controller\Controller_Usuario.pas',
  Model_Usuario in '..\Model\Model_Usuario.pas',
  View_UFrmCadUsuario in '..\View\View_UFrmCadUsuario.pas' {View_FrmCadUsuario},
  Model_Conexao_DAO in '..\Model\Model_Conexao_DAO.pas';

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
