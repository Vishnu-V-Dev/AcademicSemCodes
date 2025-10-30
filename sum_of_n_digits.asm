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
    sub al,30h
    endm
.data
    m1 db 10,13,"Enter the limit: $"
    m2 db 10,13,"Enter the numbers: $"
    m3 db 10,13,"Sum = $"
    arr db 10 dup('$')
    var db 00

.code
main:
    mov ax,@data
    mov ds,ax
    
    MSG m1
    READN
    mov bl,al
    
    MSG m2
    mov si,00h
    
lop:
    READN
    mov arr[si],al
    inc si
    inc var
    cmp bl,var
    jne lop
    
    mov si,00
    mov var,00
    mov cl,00
    
a:
    add cl,arr[si]
    inc si
    inc var
    cmp bl,var
    jne a
    
    MSG m3
    PRINTN cl
    
    mov ah,4ch
    int 21h
end main
