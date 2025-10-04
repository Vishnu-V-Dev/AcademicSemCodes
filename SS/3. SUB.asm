.model small
.stack 100h

.data
    n1 db 8
    n2 db 3

.code
start:
    mov ax,@data
    mov ds,ax
    
    mov al,n1
    sub al,n2
    add al,30h
    
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
end start
