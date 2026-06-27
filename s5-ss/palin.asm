.model small
.stack 100h

.data
    input db 100 dup('$')
    MSG1 db 10,13,"Palindrome$"
    MSG2 db 10,13,"Not Palindrome$"
    prompt db "Enter the string: $"
    
.code
start:
    mov ax,@data
    mov ds,ax
    
    lea dx,prompt
    mov ah,09h
    int 21h
    
    lea si,input
    mov cx,0
    
read:
    
    mov ah,01h
    int 21h
    
    cmp al,0Dh
    je terminate
    mov [si],al
    inc si
    inc cx
    jmp read
  
terminate:
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
    lea dx,MSG1
    jmp exit
    
not_pal:
    lea dx,MSG2
    
exit:
    mov ah,09h
    int 21h    
    mov ah,4ch
    int 21h    
end start