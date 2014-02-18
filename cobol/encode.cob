IDENTIFICATION DIVISION.
PROGRAM-ID. ENCODE.

DATA DIVISION.
LOCAL-STORAGE SECTION.
01 Estr     PIC A(16) VALUE 'test String@'.
01 Dstr     PIC A(16) VALUE 'BMAB ABZQVO@ '.
01 Sstr     PIC A(16) VALUE 'halo22'.
01 moveAmt  PIC 99 VALUE 26.
01 solves   PIC 99 VALUE 26.
01 countInt PIC 99 VALUE 0.
01 char     PIC A(1).
01 newChar  PIC A(1).
01 newStr   PIC A(16).
01 currC    PIC 999.
01 charInt  PIC 999.
01 newInt   PIC 999.
01 sol      PIC 99.

PROCEDURE DIVISION.

MOVE FUNCTION Upper-case(Estr) to Estr
MOVE FUNCTION Upper-case(Dstr) to Dstr
MOVE FUNCTION Upper-case(Sstr) to Sstr

DISPLAY 'ORIGINAL: ' Estr
PERFORM ENCRYPT.
DISPLAY ' '
DISPLAY 'ORIGINAL: ' Dstr
PERFORM DECRYPT.
DISPLAY ' '
DISPLAY 'ORIGINAL: ' Sstr
PERFORM SOLVE.

STOP RUN.


ENCRYPT. 

    PERFORM VARYING currC FROM 0 BY 1 UNTIL currC > LENGTH OF Estr 
        MOVE Estr(currC:currC) TO char(1:1)
        COMPUTE charInt = FUNCTION ORD(char)
        IF charInt > 65 THEN
            ADD charInt moveAmt GIVING newInt
            IF newINT > 91 THEN
                SUBTRACT 91 FROM newInt GIVING newInt
                ADD 65 newInt giving newInt
            END-IF
            MOVE FUNCTION CHAR(newInt) to newChar  
        ELSE
            MOVE Estr(currC:currC) to newChar
        END-IF
        
        MOVE newChar(1:1) TO newStr(currC:currC)
        
    END-PERFORM;
    DISPLAY newStr.
    


DECRYPT.
    
    PERFORM VARYING currC FROM 0 BY 1 UNTIL currC > LENGTH OF Dstr 
        MOVE Dstr(currC:currC) TO char(1:1)
        COMPUTE charInt = FUNCTION ORD(char)
        IF charInt > 64 THEN
            SUBTRACT moveAmt FROM charInt GIVING newInt
            IF newInt < 66 THEN
                SUBTRACT newInt FROM 65 GIVING newInt
                SUBTRACT newInt from 91 GIVING newInt
            END-IF
            MOVE FUNCTION CHAR(newInt) to newChar  
        ELSE
            MOVE Dstr(currC:currC) to newChar
        END-IF
        
        MOVE newChar(1:1) TO newStr(currC:currC)
        
    END-PERFORM.
    DISPLAY newStr.

SOLVE.
    PERFORM VARYING sol FROM solves BY -1 UNTIL countInt > solves
        PERFORM VARYING currC FROM 0 BY 1 UNTIL currC > LENGTH OF Sstr 
            MOVE Sstr(currC:currC) TO char(1:1)
            COMPUTE charInt = FUNCTION ORD(char)
            IF charInt > 65 THEN
                ADD charInt sol GIVING newInt
                IF newINT > 91 THEN
                    SUBTRACT 90 FROM newInt GIVING newInt
                    ADD 64 newInt giving newInt
                END-IF
                MOVE FUNCTION CHAR(newInt) to newChar  
            ELSE
                MOVE Sstr(currC:currC) to newChar
            END-IF
            
            MOVE newChar(1:1) TO newStr(currC:currC)        
        END-PERFORM;
        ADD 1 TO countInt giving countInt
        DISPLAY 'Caeser ' sol ': ' newStr
    END-PERFORM.

