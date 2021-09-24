unit Model_Conexao_DAO;

interface
uses Model_Conexao, FireDAC.Comp.Client, System.SysUtils;

type
  TDAOConexao = class
  protected
    Conexao: TFDConnection;
    Qry: TFDQuery;
  public
    Constructor Create;
    Destructor Destroy; override;
  end;

implementation

{ TDAOConexao }

uses UDataModel;

constructor TDAOConexao.Create;
begin
  AtivarConecao(1);
  Conexao := DataModel.DBConexao;
  Qry := TFDQuery.Create(nil);
  Qry.Connection:=conexao;
end;

destructor TDAOConexao.Destroy;
begin
  FreeAndNil(Qry);
  Conexao.Connected := False;
  AtivarConecao(2);
  FreeAndNil(Conexao);
  inherited;
end;



end.