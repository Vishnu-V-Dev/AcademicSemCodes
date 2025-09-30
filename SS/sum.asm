.model small

.data
    n1 db 5
    n2 db 3

.code
    mov ax,@data
    mov ds,ax
    mov al,n1
    add al,n2
    add al,30h
    
    mov dl,al
    mov ah,02h
    int 21h
    mov ah,4ch
    int 21h
end