IDENTIFICATION DIVISION.
PROGRAM-ID. ENCODE.

DATA DIVISION.
LOCAL-STORAGE SECTION.
01 ENCRYPT  PIC A(15).
01 str      PIC A(13) VALUE 'abcdefg123456'.
01 moveAmt  PIC 99 VALUE 1.
01 solves  PIC 99 VALUE 20.

PROCEDURE DIVISION.

MOVE FUNCTION Upper-case(str) to str

CALL 'ENCRYPT' USING str moveAmt.
CALL 'DECRYPT' USING str moveAmt.
CALL 'SOLVE'   USING str solves.

STOP RUN.

IDENTIFICATION DIVISION.
PROGRAM-ID. ENCRYPT.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 char     PIC A(1).
01 newChar  PIC A(1).
01 newStr  PIC A(13).
01 currC    PIC 99.
01 charInt  PIC 99.
01 newInt   PIC 99.

LINKAGE SECTION.
01 str      PIC A(13).
01 moveAmt  PIC 99.

PROCEDURE DIVISION.

PERFORM VARYING currC FROM 0 BY 1 UNTIL currC > LENGTH OF str 
    MOVE str(currC:currC) TO char(1:1)
    COMPUTE charInt = FUNCTION ORD(char)
    IF charInt > 65 THEN
        ADD charInt moveAmt GIVING newInt
        MOVE FUNCTION CHAR(newInt) to newChar  
    ELSE
        MOVE str(currC:currC) to newChar
    END-IF
    
    MOVE newChar(1:1) TO newStr(currC:currC)
    
END-PERFORM;

DISPLAY newStr

EXIT PROGRAM.


IDENTIFICATION DIVISION.
PROGRAM-ID. DECRYPT.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 char     PIC A(1).
01 newChar  PIC A(1).
01 newStr  PIC A(13).
01 currC    PIC 99.
01 charInt  PIC 99.
01 newInt   PIC 99.

LINKAGE SECTION.
01 str      PIC A(13).
01 moveAmt  PIC 99.

PROCEDURE DIVISION.

PERFORM VARYING currC FROM 0 BY 1 UNTIL currC > LENGTH OF str 
    MOVE str(currC:currC) TO char(1:1)
    COMPUTE charInt = FUNCTION ORD(char)
    IF charInt > 65 THEN
        SUBTRACT moveAmt FROM charInt GIVING newInt
        MOVE FUNCTION CHAR(newInt) to newChar  
    ELSE
        MOVE str(currC:currC) to newChar
    END-IF
    
    MOVE newChar(1:1) TO newStr(currC:currC)
    
END-PERFORM;

DISPLAY newStr

EXIT PROGRAM.


IDENTIFICATION DIVISION.
PROGRAM-ID. SOLVE.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 char     PIC A(1).
01 newChar  PIC A(1).
01 newStr   PIC A(13).
01 currC    PIC 99.
01 charInt  PIC 99.
01 newInt   PIC 99.
01 sol      PIC 99.

LINKAGE SECTION.
01 str      PIC A(13).
01 solves   PIC 99.

PROCEDURE DIVISION.
PERFORM VARYING currC FROM 0 BY 1 UNTIL sol > solves 
    PERFORM VARYING currC FROM 0 BY 1 UNTIL currC > LENGTH OF str 
        MOVE str(currC:currC) TO char(1:1)
        COMPUTE charInt = FUNCTION ORD(char)
        IF charInt > 65 THEN
            ADD charInt sol GIVING newInt
            MOVE FUNCTION CHAR(newInt) to newChar  
        ELSE
            MOVE str(currC:currC) to newChar
        END-IF
        
        MOVE newChar(1:1) TO newStr(currC:currC)        
    END-PERFORM;
END-PERFORM;
EXIT PROGRAM.