.model small
.stack 100h

.data
    n1 db 4
    n2 db 2
    
.code
start:
    mov ax,@data
    mov ds,ax
    
    mov al,n1
    mov bl,n2
    mul bl
    
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
end start