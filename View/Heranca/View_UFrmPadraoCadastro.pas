unit View_UFrmPadraoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin, Vcl.Menus, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls;

type
  TView_FrmPadraoCadastro = class(TForm)
    BarraStatusPadraoCadastro: TStatusBar;
    ListaDeImagens: TImageList;
    PMenuGridCadastro: TPopupMenu;
    xxxxxxxxxxx1: TMenuItem;
    BarraBotoes: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnEditar: TToolButton;
    BtnCancelar: TToolButton;
    BtnExcluir: TToolButton;
    PGControle: TPageControl;
    Aba01: TTabSheet;
    GBAba01: TGroupBox;
    EdtCodigo: TEdit;
    AbaPesquisar: TTabSheet;
    GbPesquisar: TGroupBox;
    CbPesquisar: TComboBox;
    EdtPesquisar: TEdit;
    BtnPesquisar: TButton;
    GbResultadoPesquisa: TGroupBox;
    DBPesquisa: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Separador: TToolButton;
    BtnSair: TToolButton;
    Aba02: TTabSheet;
    Aba03: TTabSheet;
    Aba04: TTabSheet;
    GBAba02: TGroupBox;
    GBAba03: TGroupBox;
    GBAba04: TGroupBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LimparEdit;
    procedure AbasEstado(opcao:integer);
    procedure Botoes(botaoNum:Integer);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBPesquisaDblClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var opcao:string;
        operacao:Integer;
  end;

var
  View_FrmPadraoCadastro: TView_FrmPadraoCadastro;

implementation

{$R *.dfm}

procedure TView_FrmPadraoCadastro.LimparEdit;
var
i: Integer;
begin
    for i := 0 to ComponentCount -1 do
    begin
      if Components[i] is TEdit then
         TEdit(Components[i]).Clear;
    end;
end;

 procedure TView_FrmPadraoCadastro.AbasEstado(opcao:integer);
 begin
  case opcao of
  1:begin
       GBAba01.Enabled:=true;
       GBAba02.Enabled:=true;
       GBAba03.Enabled:=true;
       GBAba04.Enabled:=true;
    end;
  2:begin
       GBAba01.Enabled:=false;
       GBAba02.Enabled:=false;
       GBAba03.Enabled:=false;
       GBAba04.Enabled:=false;
    end;
  end;
 end;

procedure TView_FrmPadraoCadastro.Botoes(botaoNum:Integer);
begin

  //Controle dos bot?es
  case botaoNum of
    0:begin //Novo Registro
       BtnNovo.Enabled    :=False;
       BtnGravar.Enabled  :=true;
       BtnEditar.Enabled  :=False;
       BtnCancelar.Enabled:=true;
       BtnExcluir.Enabled :=False;
       LimparEdit;
       AbasEstado(1);
       operacao:=1;
      end;
    1:begin //Bot?o Gravar
       BtnNovo.Enabled    :=true;
       BtnGravar.Enabled  :=false;
       BtnEditar.Enabled  :=true;
       BtnCancelar.Enabled:=false;
       BtnExcluir.Enabled :=true;
       AbasEstado(2);
       operacao:=0;
      end;
    2:begin //Bot?o Editar
       BtnNovo.Enabled    :=false;
       BtnGravar.Enabled  :=true;
       BtnEditar.Enabled  :=false;
       BtnCancelar.Enabled:=true;
       BtnExcluir.Enabled :=false;
       AbasEstado(1);
       operacao:=2;
      end;
    3:begin //Bot?o Limpar/Cancelar
       BtnNovo.Enabled    :=true;
       BtnGravar.Enabled  :=false;
       BtnEditar.Enabled  :=false;
       BtnCancelar.Enabled:=false;
       BtnExcluir.Enabled :=false;
       LimparEdit;
       AbasEstado(2);
       operacao:=0;
      end;
    4:begin //Bot?o Excluir
       BtnNovo.Enabled    :=true;
       BtnGravar.Enabled  :=false;
       BtnEditar.Enabled  :=false;
       BtnCancelar.Enabled:=true;
       BtnExcluir.Enabled :=false;
       LimparEdit;
       AbasEstado(2);
       operacao:=0;
      end;
    5:begin //carregando formul?rio
       BtnNovo.Enabled    :=true;
       BtnGravar.Enabled  :=False;
       BtnEditar.Enabled  :=False;
       BtnCancelar.Enabled:=False;
       BtnExcluir.Enabled :=False;
       AbasEstado(2);
       operacao:=0;
      end;
    6:begin //carregando aba01 do Grid com duploclick.
       BtnNovo.Enabled    :=false;
       BtnGravar.Enabled  :=true;
       BtnEditar.Enabled  :=false;
       BtnCancelar.Enabled:=true;
       BtnExcluir.Enabled :=false;
       AbasEstado(1);
       Aba01.Show;
       operacao:=2;
      end;

  end;
end;

procedure TView_FrmPadraoCadastro.BtnEditarClick(Sender: TObject);
begin
  Botoes(2);
end;

procedure TView_FrmPadraoCadastro.BtnExcluirClick(Sender: TObject);
begin
  opcao:='N';
if (messagebox(HANDLE,'DESEJA EXCLUIR O REGISTRO?','AVISO - SISTEMA',MB_IconQuestion+MB_YesNo+MB_defbutton1) = IdYes) then
      Begin
        opcao:='S';//(Sim para Excluir)
        Botoes(4);
      End;
end;

procedure TView_FrmPadraoCadastro.BtnGravarClick(Sender: TObject);
begin
  Botoes(1);
end;

procedure TView_FrmPadraoCadastro.BtnCancelarClick(Sender: TObject);
begin
  opcao:='N';
  if (messagebox(HANDLE,'DESEJA CANCELAR?','AVISO - SISTEMA',MB_IconQuestion+MB_YesNo+MB_defbutton1) = IdYes) then
      begin
        opcao:='S';//Sim para Cancelar Edi??o.
        Botoes(3);
      end;
end;

procedure TView_FrmPadraoCadastro.BtnNovoClick(Sender: TObject);
begin
  Botoes(0);
end;

procedure TView_FrmPadraoCadastro.BtnPesquisarClick(Sender: TObject);
begin
   if (CbPesquisar.Text = '') then
      begin
        ShowMessage('Obrigat?rio Informar o Tipo de Pesquisar que Desejas Fazer!.');
        CbPesquisar.SetFocus;
        Abort;
      end;


   if ((CbPesquisar.Text <> '')  and (EdtPesquisar.Text = '')) then
      begin
        ShowMessage('Obrigat?rio Informar ('+CbPesquisar.Text+') Para Localizar!.');
        EdtPesquisar.SetFocus;
        Abort;
      end;
end;

procedure TView_FrmPadraoCadastro.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TView_FrmPadraoCadastro.DBPesquisaDblClick(Sender: TObject);
begin
  //Detalhes
  Botoes(6);
end;

procedure TView_FrmPadraoCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {Verifico se o bot?o gravar est? ativo e digo que s? pode
   sair se gravar ou cancelar.}
   if (BtnGravar.Enabled = true) then
      begin
       ShowMessage('ATEN??O!! - SALVE O REGISTRO OU CANCELE OPERA??O PARA CONTINUAR!.');
       Abort;
      end
   else
     begin
      Action:=Cafree;
      View_FrmPadraoCadastro:=nil;
     end;
end;

procedure TView_FrmPadraoCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Teclas
  case key of
    vk_f2:BtnNovoClick(Sender);
    vk_f3:BtnGravarClick(Sender);
    vk_f4:BtnEditarClick(Sender);
    vk_f5:BtnCancelarClick(Sender);
    vk_f6:BtnExcluirClick(Sender);
    vk_f7:BtnSairClick(Sender);
    VK_RETURN:Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TView_FrmPadraoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Fechar a tela usando ESC.
  If (Key = #27) Then
      Close;
end;

procedure TView_FrmPadraoCadastro.FormShow(Sender: TObject);
begin
  Botoes(5);
end;

end.
