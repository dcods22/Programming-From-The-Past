Program HelloWorld(output);
{comments}
var str: String;
var a : integer;
begin
    str := 'Test';
    writeln(str);
    for a := 0  to Length(str) do
    begin
        writeln('value of a: ', a);
    end;
end.
