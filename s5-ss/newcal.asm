.model small
.stack 100h

    MSG macro p
        lea dx,p
        mov ah,09h
        int 21h
    endm
        
    PRINTN macro q
        mov al,q
        mov bl,0ah
        mov ah,00h
        div bl
        mov bl,ah
        
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
        
        add bl,30h
        mov dl,bl
        mov ah,02h
        int 21h
    endm
        
    READN macro r
        mov ah,01h
        int 21h
        sub al,30h
    endm
.data
    CH1 db 10,13,'1.ADDITION 2.SUBTRACTION 3.MULTIPLICATION 4.DIVISION 5.EXIT $'
    MSG1 db 10,13,'ENTER THE FIRST NUMBER: $'
    MSG2 db 10,13,'ENTER THE SECOND NUMBER: $'
    MSG3 db 10,13,'THE RESULT IS $'
    CHO db 00H

.code
start:

H:      MOV AX,@DATA
        MOV DS,AX
        
        MSG CH1
        READN 
        MOV CHO,AL
        
        CMP CHO,05H 
        JE E 
        CMP CHO,01H 
        JE A 
        CMP CHO,02H
        JE S 
        CMP CHO,03H
        JE M 
        CMP CHO,04H
        JE D 
        
A:      MSG MSG1
        READN
        MOV CL,AL
        
        MSG MSG2
        READN
        
        MSG MSG3
        ADD AL,CL
        PRINTN AL
        JMP H 
        
S:      MSG MSG1
        READN
        MOV CL,AL
        
        MSG MSG2
        READN
        
        MSG MSG3
        SUB CL,AL
        MOV AL,CL
        PRINTN AL
        JMP H
        
M:      MSG MSG1
        READN
        MOV CL,AL
        
        MSG MSG2
        READN
        
        MSG MSG3
        MOV BL,CL
        MUL BL
        PRINTN AL
        JMP H
        
D:      MSG MSG1
        READN
        MOV CL,AL
        
        MSG MSG2
        READN
        
        MSG MSG3
        XCHG AL,CL
        XOR AH,AH 
        DIV CL 
        PRINTN AL 
        JMP H

E:      MOV AH,4CH
        INT 21H

end start