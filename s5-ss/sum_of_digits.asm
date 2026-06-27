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
    
    READN macro
    mov ah,01h
    int 21h
    endm
    
.data
    m1 db 10,13,"Enter the number: $"
    m2 db 10,13,"Sum = $"
    digit db ?
    sum db 0

.code
main:
    mov ax,@data
    mov ds,ax
    
    MSG m1
    mov cx,0
    
read:
    READN
    cmp al,0dh
    je done
    sub al,30h
    add cl,al
    jmp read

done:
    MSG m2
    PRINTN cl
    
    mov ah,4ch
    int 21h
end main
