unit uDM;

interface

uses
  System.SysUtils,
  System.Classes,

  Data.DB,

  DBAccess,
  Uni;

type
  TUniConnectionHelper = class helper for TUniConnection
  public
    function  GetQuery(const ASQL: string = ''): TUniQuery;
  end;

  TDM = class(TDataModule)
    DBConnection: TUniConnection;
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadFromFile(const AFileName: string);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TUniConnectionHelper }

function TUniConnectionHelper.GetQuery(const ASQL: string): TUniQuery;
begin
  Result := TUniQuery.Create(nil);
  Result.SQL.Text := ASQL;
  Result.Connection := Self;
end;

{ TDM }

constructor TDM.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TDM.Destroy;
begin

  inherited;
end;

procedure TDM.LoadFromFile(const AFileName: string);
begin

end;

initialization
  DM := TDM.Create(nil);
finalization
  DM.Free;
end.
