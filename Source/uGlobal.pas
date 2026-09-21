unit uGlobal;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.IOUtils;

type
  TGlobal = class sealed
  public
    type
      TPathInfo = class
      private
        FPaths: TDictionary<string, string>;
        FRoot: string;

        function  GetPath(const AName: string): string;
        procedure SetPath(const AName, Value: string);
      public
        constructor Create;
        destructor Destroy; override;

        property Path[const AName: string]: string read GetPath write SetPath; default;
        property Root: string read FRoot;
      end;
  strict private
    class var
      FPath: TPathInfo;

    class constructor Create;
    class destructor Destroy;
  public
    class property Path: TPathInfo read FPath;
  end;

implementation

{ TGlobal.TPathInfo }

constructor TGlobal.TPathInfo.Create;
begin
  FRoot := ExtractFilePath(ParamStr(0));
  FPaths := TDictionary<string, string>.Create;
end;

destructor TGlobal.TPathInfo.Destroy;
begin
  FPaths.Free;

  inherited;
end;

function TGlobal.TPathInfo.GetPath(const AName: string): string;
begin
  var LValue: string;
  if FPaths.TryGetValue(AName.ToLower, LValue) then
    Result := TPath.Combine(FRoot, LValue);
end;

procedure TGlobal.TPathInfo.SetPath(const AName, Value: string);
begin
  FPaths.AddOrSetValue(AName.ToLower, Value);
end;

{ TGlobal }

class constructor TGlobal.Create;
begin
  FPath := TpathInfo.Create;
end;

class destructor TGlobal.Destroy;
begin
  FPath.Free;
end;

end.
