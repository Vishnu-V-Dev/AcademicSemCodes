.model small
.stack 100h
.data
        input db 100 dup('$')
        msg1 db 13,10,"Palindrome$",0
        msg2 db 13,10,"Not Palindrome$",0

        prompt db "Enter a String: $"

.code
main:
        mov ax,@data
        mov ds,ax

        lea dx,prompt
        mov ah,09h
        int 21h

        lea si,input
        mov cx,0

read_loop:
        mov ah,01h
        int 21h
        cmp al,0Dh
        je terminate_input
        mov [si],al
        inc si
        inc cx
        jmp read_loop

terminate_input:
        mov byte ptr [si],'$'
        mov si,0
        mov di,cx
        dec di

check_loop:
        cmp si,di
        jge is_palindrome

        mov al,input[si]
        mov bl,input[di]
        cmp al,bl
        jne not_palindrome
        inc si
        dec di
        jmp check_loop

is_palindrome:
        lea dx,msg1
        jmp print_result

not_palindrome:
        lea dx,msg2

print_result:
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
end main
