unit View_UFrmConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View_UFrmPadraoSimples, Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TView_FrmConfiguracao = class(TView_FrmPadraoSimples)
    GbConfiguracao: TGroupBox;
    EdtLocalFoto: TEdit;
    Label1: TLabel;
    BtnLocalFoto: TButton;
    BtnGravarLocal: TButton;
    SaveDialog1: TSaveDialog;
    EdtIDLocalFoto: TEdit;
    procedure BtnLocalFotoClick(Sender: TObject);
    procedure BtnGravarLocalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  View_FrmConfiguracao: TView_FrmConfiguracao;

implementation

{$R *.dfm}

uses uController_Configuracao;

procedure TView_FrmConfiguracao.BtnGravarLocalClick(Sender: TObject);
begin
  //Gravar local.
  Controller_Configuracao_Gravar(Strtoint(EdtIDLocalFoto.Text),EdtLocalFoto.Text,1);
end;

procedure TView_FrmConfiguracao.BtnLocalFotoClick(Sender: TObject);
begin
  if (SaveDialog1.Execute) then
     EdtLocalFoto.Text:=ExtractFilePath(SaveDialog1.FileName);
end;

procedure TView_FrmConfiguracao.FormShow(Sender: TObject);
begin
  inherited;
  Controller_Configuracao_PreencherCamposLocalFoto;
end;

end.
