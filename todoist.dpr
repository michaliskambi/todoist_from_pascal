{ Use Todoist REST API by TCastleDownload. }

uses SysUtils,
  {$ifdef FPC} OpenSSLSockets, {$endif} // https support
  FpJson, JsonParser,
  CastleDownload, CastleClassUtils;

const
  Token = {$I token.inc};
  TaskId = 'TODO';

{ Call Todoist API v2, see
  https://developer.todoist.com/rest/v2/ . }
function TodoistApiCall(const Query: String): TJsonData;
var
  Request: TCastleDownload;
begin
  Request := TCastleDownload.Create(nil);
  try
    Request.HttpHeader('Authorization', 'Bearer ' + Token);
    Request.Url := 'https://api.todoist.com/rest/v2/' + Query;
    Request.Start;
    Request.WaitForFinish;
    if Request.Status <> dsSuccess then
      raise Exception.CreateFmt('Error querying Todoist: %s', [
        Request.ErrorMessage
      ]);
    Result := GetJson(Request.Contents);
  finally
    FreeAndNil(Request);
  end;
end;

var
  Projects: TJsonArray;
  Task: TJsonObject;
  I: Integer;
begin
  // list all projects
  Projects := TodoistApiCall('projects') as TJsonArray;
  try
    // debug: Writeln('Projects: ', Projects.FormatJson);
    for I := 0 to Projects.Count - 1 do
      Writeln(Projects.Objects[I].Strings['name']);
  finally FreeAndNil(Projects) end;

  // get specific task description.
  // Get task id by looking at Todoist UI in browser,
  // like https://todoist.com/app/today/task/XXXXXXX
  Task := TodoistApiCall('tasks/' + TaskId) as TJSONObject;
  try
    // debug: Writeln('Task: ', Task.FormatJson);
    Writeln('------------------------- Task description begin');
    Writeln(Task.Strings['description']);
    Writeln('------------------------- Task description end');
  finally FreeAndNil(Task) end;
end.
