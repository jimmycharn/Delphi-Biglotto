program test_fb;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes, ZConnection;

var
  Conn: TZConnection;
  f: TextFile;
begin
  AssignFile(f, 'test_connect.txt');
  Rewrite(f);
  Writeln(f, 'Starting connection test...');
  
  Conn := TZConnection.Create(nil);
  try
    Conn.Protocol := 'firebird';
    Conn.HostName := '192.168.1.162';
    Conn.Database := 'BIGLOTTO';
    Conn.User := 'SYSDBA';
    Conn.Password := 'aB360110162';
    Conn.Port := 3050;
    Conn.LibraryLocation := ExtractFilePath(ParamStr(0)) + 'fbclient.dll';
    
    Writeln(f, 'Connecting to 192.168.1.162:BIGLOTTO ...');
    try
      Conn.Connect;
      Writeln(f, 'SUCCESSFULLY CONNECTED TO FIREBIRD!');
    except
      on E: Exception do
      begin
        Writeln(f, 'CONNECTION ERROR: ' + E.ClassName + ': ' + E.Message);
      end;
    end;
  finally
    Conn.Free;
    CloseFile(f);
  end;
end.
