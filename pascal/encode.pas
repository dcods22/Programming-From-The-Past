Program Encode;

(****** Variables ********)
var str: String;
var newStr: String;
var a : integer;
var chInt : LongInt;
var moveAmt : integer;
var ch : String;

(******* Functions ******)

(* function returning uppcase of string *)
function upper(str: String):String;
var
   result: String;
begin
    for a := 1  to Length(str) do
    begin
        chInt := ord(str[a]);
        chInt := chInt - 32;
        ch := chr(chInt);
       result :=result + ch;
    end; 
    upper := result
end;


(******* Main *****)
begin
    moveAmt := 1;
    str := 'test';
    str := upper(str);
    writeln(str);
end.