.model small
.stack 100h

.data
a db "Hello World!$"

.code
start: 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,a
    MOV AH,09H
    INT 21H
    
    MOV AH,4CH
    INT 21H  
end start
