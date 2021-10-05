unit uPessoa;

//Classe pessoa.

interface

uses SysUtils,DateUtils;

type
   TPessoa = Class
   private
    FIdPessoa       : integer;
	  FDataCadastro   : TDate;
	  FNomeCompleto   : string;
    FCpf            : string;
	  FSexo           : string;
    FDataNascimento : TDate;
    FEstadoCivil    : Integer;
    FCep            : string;
    FEndereco       : string;
    FBairro         : string;
    FNumero         : string;
    FComplemento    : string;
    FUF             : string;
    FNumCelular     : string;
    FNumFixo        : string;
    FEmail          : string;
    FStatus         : Integer;

   public
   constructor Create;
   destructor Destroy; override;

    property id_pessoa            : Integer read FIdPessoa write FIdPessoa;
    property pes_data_cadastro    : TDate read FDataCadastro write FDataCadastro;
    property pes_nome_completo    : string read FNomeCompleto write FNomeCompleto;
    property pes_cpf              : string read FCpf write FCpf;
    property pes_sexo             : string read FSexo write FSexo;
    property pes_data_nascimento  : TDate read FDataNascimento write FDataNascimento;
    property pes_estado_civil     : Integer read FEstadoCivil write FEstadoCivil;
    property pes_cep              : string read FCep write FCep;
    property pes_endereco         : string read FEndereco write FEndereco;
    property pes_bairro           : string read FBairro write FBairro;
    property pes_numero           : string read FNumero write FNumero;
    property pes_complemento      : string read FComplemento write FComplemento;
    property pes_uf               : string read FUF write FUF;
    property pes_num_celular      : string read FNumCelular write FNumCelular;
    property pes_num_fixo         : string read FNumFixo write FNumFixo;
    property pes_email            : string read FEmail write FEmail;
    property pes_status           : Integer read FStatus write FStatus;
    procedure limparInformacoes;


   End;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  limparInformacoes;
end;

destructor TPessoa.Destroy;
begin
  inherited;
end;

procedure TPessoa.limparInformacoes;
begin
  FIdPessoa       := 0;
	FDataCadastro   := 0;
	FNomeCompleto   := EmptyStr;
  FCpf            := EmptyStr;
	FSexo           := EmptyStr;
  FDataNascimento := 0;
  FEstadoCivil    := 0;
  FCep            := EmptyStr;
  FEndereco       := EmptyStr;
  FBairro         := EmptyStr;
  FNumero         := EmptyStr;
  FComplemento    := EmptyStr;
  FUF             := EmptyStr;
  FNumCelular     := EmptyStr;
  FNumFixo        := EmptyStr;
  FEmail          := EmptyStr;
  FStatus         := 0;
end;

end.
