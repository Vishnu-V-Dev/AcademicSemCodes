.model small
.stack 100h

.data
    n1 dw 20
    n2 dw 5
    qu dw ?
    msg db 'Quotient is : $'

.code
main:
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,09h
    int 21h
    
    mov ax,n1
    mov bx,n2
    xor dx,dx
    div bx
    
    add al,'0' ;In ASCII table: '0' = 30h (hex)
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
end main

end
    