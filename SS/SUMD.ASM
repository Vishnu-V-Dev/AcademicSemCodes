.model small
.stack
    printn macro p
        lea dx,p
        mov ah,09h
        int 21h
    endm
    prints macro q
        mov al,q
        mov cl,0ah 
        xor ah,ah
        div cl
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
    printr macro
        mov ah,01h
        int 21h
    endm
.data
    m1 db 10,13,'enter the number(digits only): $'
    m2 db 10,13,'sum is = $'
    sum db 0
    digit db ?
.code
main:
    mov ax,@data
    mov ds,ax
    printn m1
    xor cx,cx
read_loop:
    printr
    cmp al,13
    je done_input
    sub al,'0'
    add cl,al
    jmp read_loop
done_input:
    printn m2
    prints cl
    mov ah,4ch
    int 21h
end main
