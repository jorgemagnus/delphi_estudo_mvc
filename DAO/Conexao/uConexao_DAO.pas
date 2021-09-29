unit uConexao_DAO;

interface
uses uConexao, FireDAC.Comp.Client, System.SysUtils;

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
uses uDAO_DataModel;

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
