unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Data.DB,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,

  cxClasses,
  dxSkinsCore,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  dxScrollbarAnnotations,
  cxDBData,
  dxStatusBar,
  cxGridLevel,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  dxBar;

type
  TfrmMain = class(TForm)
    dxBarManager1: TdxBarManager;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxStatusBar1: TdxStatusBar;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure LoadFromFile(const AFileName: string);
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.Generics.Collections;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  var LDictionary := TDictionary<string, Integer>.Create;
  try
    var LList := TStringList.Create;
    try
      LList.LoadFromFile('D:\DELMADANG\LOG\W3SVC1\W3SVC1\u_ex250406.log');
      for var i := 0 to LList.Count-1 do
      begin
        if LList.Strings[i].StartsWith('#') then
          Continue;

        var V := LList.Strings[i].Split([' ']);
        var S := V[8];

        if not LDictionary.ContainsKey(S) then
          LDictionary.Add(S, 1)
        else
        begin
          var LCount: Integer;
          LDictionary.TryGetValue(S, LCount);
          LCount := LCount+1;
          LDictionary.AddOrSetValue(S, LCount);
        end;
      end;

      var LTotal := 0;
      for var LPair in LDictionary.ToArray do
      begin
        Inc(LTotal, LPair.Value);
      end;
    finally
      LList.Free;
    end;
  finally
    LDictionary.Free;
  end;
end;

procedure TfrmMain.LoadFromFile(const AFileName: string);
begin

end;

end.
