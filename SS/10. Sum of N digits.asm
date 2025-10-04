.model small
.stack
        printn macro p
        lea dx,p
        mov ah,09h
        int 21h
        endm
        prints  macro q
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
        sub al,30h
        endm

.data
        m1 db 10,13,'Enter the limit: $'
        m2 db 10,13,'Enter the no: $'
        val db 00h
        m3 db 10,13,'Sum is: $'
        arr db 10 dup(?)
.code
        mov ax,@data
        mov ds,ax
        printn m1
        printr
        mov bl,al
        printn m2
        mov si,00h
loo:
        printr
        mov arr[si],al
        inc si
        inc val
        cmp bl,val
        jne loo
        mov si,00h
        mov cl,00h
        mov val,00h
a:
        add cl,arr[si]
        inc si
        inc val
                cmp bl,val
                jne a
                printn m3
                prints cl
                mov ah,4ch
                int 21h
                end
