unit uModel;

interface

type
  TModel = class
  private
    FDate: string;
    FTime: string;
    FServerIP: string;
    FMethod: string;
    FUriStem: string;
    FUriQuery: string;
    FPort: string;
    FUserName: string;
    FClientIP: string;
    FUserAgent: string;
    FReferer: string;
    FStatus: string;
    FSubStatus: string;
    FWin32Status: string;
    FTimeTaken: string;
  public
    constructor Create(const AValue: string);

    property Date: string read FDate;
    property Time: string read FTime;
    property ServerIP: string read FServerIP;
    property Method: string read FMethod;
    property UriStem: string read FUriStem;
    property UriQuery: string read FUriQuery;
    property Port: string read FPort;
    property UserName: string read FUserName;
    property ClientIP: string read FClientIP;
    property UserAgent: string read FUserAgent;
    property Referer: string read FReferer;
    property Status: string read FStatus;
    property SubStatus: string read FSubStatus;
    property Win32Status: string read FWin32Status;
    property TimeTaken: string read FTimeTaken;
  end;

implementation

{ TModel }

constructor TModel.Create(const AValue: string);
begin

end;

end.
