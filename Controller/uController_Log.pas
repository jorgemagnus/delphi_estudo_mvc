unit uController_Log;

interface

uses SysUtils, Dialogs, uDAO_Log, uLog;

type
  TControllerLog = class
   private
    FOUlog: TClasselog;
    FOUlogDAO: TDAO_log;
  public
    constructor Create;
    destructor Destroy; override;

    property OClog: TClasselog read FOUlog write FOUlog;
    property OlogDAO: TDAO_log read FOUlogDAO write FOUlogDAO;

    procedure procIncluirLog;

  end;


implementation


constructor TControllerLog.Create;
begin
  Self.FOUlog     := TClasselog.Create;
  Self.FOUlogDAO  := TDAO_log.Create;
end;

destructor TControllerLog.Destroy;
begin
  inherited;
  FreeAndNil(FOUlog);
  FreeAndNil(FOUlogDAO);
end;

procedure TControllerLog.procIncluirLog;
begin
  Self.FOUlogDAO.Log_DAO_GravarLog(Self.FOUlog);
end;





end.
