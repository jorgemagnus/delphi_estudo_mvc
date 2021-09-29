unit uUsuario;

interface

uses
  SysUtils;

type
  TUsuario = class
  private
    FCodigo         : integer;
	  FUsuario        : string;
	  FSenha          : string;
	  FStatus         : integer;

  public
    constructor Create;
    destructor Destroy; override;

    property USU_CODIGO  : integer read FCodigo write FCodigo;
	  property USU_USUARIO : string read FUsuario write FUsuario;
	  property USU_SENHA   : string read FSenha write FSenha;
	  property USU_STATUS  : integer read FStatus write FStatus;
    procedure limparInformacoes;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
  limparInformacoes;
end;

destructor TUsuario.Destroy;
begin
  inherited;
end;

procedure TUsuario.limparInformacoes;
begin
  FCodigo  := 0;
	FUsuario := EmptyStr;
	FSenha   := EmptyStr;
	FStatus  := 0;
end;

end.
