unit uUlog;

interface

uses
  SysUtils;

type
  TClog = class
  private
    FCodigoIdUsuario  : integer;
	  FOperacao         : string;
	  FTabela           : string;
	  FRegistro         : string;

  public
    constructor Create;
    destructor Destroy; override;

    property log_idusuario  : integer read FCodigoIdUsuario write FCodigoIdUsuario;
	  property log_operacao   : string read FOperacao write FOperacao;
	  property log_tabela     : string read FTabela write FTabela;
	  property log_registro   : string read FRegistro write FRegistro;
    procedure limparInformacoes;
  end;

implementation

{ TUlog }

constructor TClog.Create;
begin
  limparInformacoes;
end;

destructor TClog.Destroy;
begin
  inherited;
end;

procedure TClog.limparInformacoes;
begin
  FCodigoIdUsuario  := 0;
	FOperacao         := EmptyStr;
	FTabela           := EmptyStr;
	FRegistro         := EmptyStr;
end;

end.
