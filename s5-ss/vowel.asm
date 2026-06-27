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

.data
    M1 db 10,13,"Enter the sting: $"
    M2 db 10,13,"Vowel Count = $"
    arr db 10 dup('$')
    c1 db 00h
    
.code
main:
    mov ax,@data
    mov ds,ax
    
    MSG M1
    mov si,01h
    
lop:
    mov ah,01h
    int 21h
    mov arr[si],al
    
a2: cmp al,"a"
    je a1
    jne e2

e2: cmp al,"e"
    je a1
    jne i2
    
i2: cmp al,"i"
    je a1
    jne o2
    
o2: cmp al,"o"
    je a1
    jne u2
    
u2: cmp al,"u"
    je a1
    jne cond1
    
a1: inc c1
    jmp cond1
    inc si
    
cond1:
    cmp al,0Dh
    jne lop
    MSG M2
    PRINTN c1
    
   mov ah,4ch
   int 21h 
end main