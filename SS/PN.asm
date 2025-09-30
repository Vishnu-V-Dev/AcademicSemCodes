.model small

.data
    a db "THIS IS ASSEMBLY NEGA! $"

.code
        MOV AX,@DATA
        MOV DS,AX
        LEA DX,a
        MOV AH,09H
        INT 21H
        MOV AH,4CH
        INT 21H
end