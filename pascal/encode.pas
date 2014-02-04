Program Encode;

(****** Variables ********)
var EStr: String;
var SStr: String;
var DStr: String;
var newStr: String;
var i : integer;
var n : integer;
var chInt : LongInt;
var ch : String;

(******* Functions ******)

(* function returning uppcase of string *)
function upper(str: String):String;
var
   result: String;
begin
    ch := '';
    chInt := 0;
    result := '';
    for i := 1  to Length(str) do
    begin
        chInt := ord(str[i]);
        if( chInt > 90) then
        begin
            chInt := chInt - 32;
        end;
        ch := chr(chInt);
        result :=result + ch;
    end; 
    upper := result
end;

function encode(str: String; moveAmt: integer):String;
var
    result: String;
begin
    ch := '';
    chInt := 0;
    result := '';
    for i :=1 to Length(str) do
    begin
        chInt := ord(str[i]);
        if (chInt > 64) then
        begin
            chInt := chInt + moveAmt;
            if chInt > 90 then
            begin
                chInt := 64 + (chInt - 90);
            end
        end;
        ch := chr(chInt);
        result := concat(result, ch);
    end;    
    encode := result
end;

function decode(str: String; moveAmt: integer):String;
var
    result: String;
begin
    ch := '';
    chInt := 0;
    result := '';
    for i :=1 to Length(str) do
    begin
        chInt := ord(str[i]);
        if (chInt > 64) then
        begin
            chInt := chInt - moveAmt;
            if (chInt < 64) then
            begin
                chInt := 90 - (64 - chInt);
            end;
        end; 
        ch := chr(chInt);
        result :=result + ch;
    end;    
    decode := result
end;

function solve(str: String; solves: integer):String;
var
    result: String;
begin
    ch := '';
    chInt := 0;
    result := '';
    for n := solves downto 0 do
    begin
        result :='';
        for i :=1 to Length(str) do
        begin
            chInt := ord(str[i]);
            if (chInt > 64) then
            begin
                chInt := chInt + n;
                if chInt > 90 then
                begin
                    chInt := 64 + (chInt - 90);
                end
            end;
            ch := chr(chInt);
            result := concat(result, ch);
        end;    
        writeln('Caeser ', n, ':', result);
    end;
end;
(******* Main *****)
begin
    EStr := 'this iS A tEst STRing from dan222';
    DStr := 'BPQA Qa I BmaB abzQVO NZWU LIV222';
    SStr := 'hal';
    EStr := upper(EStr);
    DStr := upper(DStr);
    SStr := upper(SStr);
    
    writeln(encode(EStr, 8));
    writeln(decode(DStr, 8));
    solve(SStr, 26);
end.