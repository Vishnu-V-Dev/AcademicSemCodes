.model small
.stack 100h
        MESSAGE MACRO P ; Displays a string message ending with $
                LEA DX,P
                MOV AH,09H
                INT 21H
        ENDM
        
        PRINTN MACRO Q
                MOV AL,Q ; load number into AL (eg.Q = 27 -> AL = 27)
                MOV BL,0AH ; BL = 10 (for decimal division)
                MOV AH,00H ; clear AH -> AX = number (AL) and 0 in AH(AX = 0027h)
                DIV BL ; AX ? 10 -> quotient in AL, remainder in AH(AL=2, AH=7)
                MOV BL,AH ; remainder -> BL (BL = 7)
                          ; Now AL = 2, BL = 7 
                ADD AL,30H ; convert quotient to ASCII
                MOV DL,AL
                MOV AH,02H
                INT 21H  ; print quotient (tens digit)
                
                ADD BL,30H  ; convert remainder to ASCII
                MOV DL,BL
                MOV AH,02H
                INT 21H  ; print remainder (ones digit)
        ENDM
        
.DATA
        CH1 DB 10,13,'1.ADDITION 2.SUBTRACTION 3.MULTIPLICATION 4.DIVISION 5.EXIT $'
        MSG1 DB 10,13,'ENTER THE FIRST NUMBER: $'
        MSG2 DB 10,13,'ENTER THE SECOND NUMBER: $'
        MSG3 DB 10,13,'THE RESULT IS $'
        CH0 DB 00H
        
.CODE
START:
H:      MOV AX,@DATA
        MOV DS,AX
        
        MESSAGE CH1
        MOV AH,01H ; Reads a character from keyboard (ASCII)
        INT 21H
        SUB AL,30H ; Subtract 30h -> real value = 7.
        MOV CH0,AL ; Store choice in CH0
        
        CMP CH0,05H ; Compare choice with 5
        JE E ; If 5 -> Exit
        CMP CH0,01H 
        JE A ; If 1 -> Addition
        CMP CH0,02H
        JE S ; If 2 -> Subtraction
        CMP CH0,03H
        JE M ; If 3 -> Multiplication
        CMP CH0,04H
        JE D ; If 4 -> Division
        
A:      MESSAGE MSG1
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV CL,AL ; saves first number in CL for later use
        
        MESSAGE MSG2
        MOV AH,01H
        INT 21H
        SUB AL,30H ; saves second number in AL
        
        MESSAGE MSG3
        ADD AL,CL
        PRINTN AL
        JMP H ; Goes back to the menu for another operation
        
S:      MESSAGE MSG1
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV CL,AL
        
        MESSAGE MSG2
        MOV AH,01H
        INT 21H
        SUB AL,30H
        
        MESSAGE MSG3
        SUB CL,AL
        MOV AL,CL
        PRINTN AL
        JMP H
        
M:      MESSAGE MSG1
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV CL,AL
        
        MESSAGE MSG2
        MOV AH,01H
        INT 21H
        SUB AL,30H
        
        MESSAGE MSG3
        MOV BL,CL
        MUL BL
        PRINTN AL
        JMP H
        
D:      MESSAGE MSG1
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV CL,AL
        
        MESSAGE MSG2
        MOV AH,01H
        INT 21H
        SUB AL,30H
        
        MESSAGE MSG3
        XCHG AL,CL ; Swap AL and CL(DIV divides AX by an 8-bit register)
        XOR AH,AH ; Clears AH -> ensures dividend = AX = numerator
        DIV CL ; Divides AX by CL
        PRINTN AL ; uses macro to print quotient in decimal
        JMP H

E:      MOV AH,4CH
        INT 21H
        
END START
