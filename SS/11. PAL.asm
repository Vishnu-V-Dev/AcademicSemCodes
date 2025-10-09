.model small
.stack 100h

.data
    input db 100 dup('$')
    msg1 db 10,13,"Palindrome $"
    msg2 db 10,13,"Not Palindrome $"
    prompt db "Enter the string: $"
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
    cmp al,0dh
    je t
    mov [si],al
    inc si
    inc cx
    jmp read_loop
    
t:
    mov byte ptr [si],'$'
    mov si,0
    mov di,cx
    dec di
check:
    cmp si,di
    jge pal
    
    mov al,input[si]
    mov bl,input[di]
    cmp al,bl
    jne not_pal
    inc si
    dec di
    jmp check

pal:
    lea dx,msg1
    jmp r
    
not_pal:
    lea dx,msg2
r:
    mov ah,09h
    int 21h
    mov ah,4ch
    int 21h
end main
    
