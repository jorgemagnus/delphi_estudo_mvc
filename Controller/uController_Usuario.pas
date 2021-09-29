unit uController_Usuario;

interface

uses System.Generics.Collections, System.SysUtils, System.Classes,
uUsuario, uDAO_Usuario;

type
  TControllerUsuario = class
   private
    FOUsuario: TUsuario;
    FOUsuarioDAO: TDaoUsuario;
  public
    constructor Create;
    destructor Destroy; override;

    property OUsuario: TUsuario read FOUsuario write FOUsuario;
    property OUsuarioDAO: TDaoUsuario read FOUsuarioDAO write FOUsuarioDAO;

    procedure procIncluirUsuario;
    procedure procEditarUsuario;


  end;

implementation

{ TControllerUsuario }

constructor TControllerUsuario.Create;
begin
  Self.FOUsuario    := TUsuario.Create;
  Self.FOUsuarioDAO := TDaoUsuario.Create;
end;

destructor TControllerUsuario.Destroy;
begin
  inherited;
  FreeAndNil(FOUsuario);
  FreeAndNil(FOUsuarioDAO);
end;

procedure TControllerUsuario.procIncluirUsuario;
begin
  Self.FOUsuarioDAO.Model_Usuario_Gravar(Self.FOUsuario);
end;

procedure TControllerUsuario.procEditarUsuario;
begin
  Self.FOUsuarioDAO.Model_Usuario_Editar(Self.FOUsuario);
end;




end.
