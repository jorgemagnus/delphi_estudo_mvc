unit UDataModel;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TDataModel = class(TDataModule)
    DBConexao: TFDConnection;
    DBTransacao: TFDTransaction;
    DB_MySQL_DriverLink: TFDPhysMySQLDriverLink;
    DB_FB_DriverLink: TFDPhysFBDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModel: TDataModel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
