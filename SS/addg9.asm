.model small
    printn macro p ;p is a message ending with $
    lea dx,p 
    mov ah,09h
    int 21h
    endm
    
    prints macro n
    mov cl,0ah ; Load 0Ah (decimal 10) into CL
    mov ah,00h ;clear AH so the number in AL is correctly treated as a 16-bit dividend
    div cl ;Divides AX by CL (10)
    mov bl,ah ;Store remainder (units digit) in BL, because we'll overwrite AH soon
    
    add al,30h ; convert 1 -> '1'
    mov dl,al
    mov ah,02h
    int 21h ; print the character in DL
    
    add bl,30h ; convert 2 -> '2'
    mov dl,bl
    mov ah,02h
    int 21h ; print the character in DL
    endm

.stack 100

.data
    m1 db 10,13,'Enter the 1st no: $'
    m2 db 10,13,'Enter the 2nd no: $'
    r db 10,13,'Result is $'
    
.code
start:
    mov ax,@data
    mov ds,ax
    
    printn m1 ; Prints - "Enter the 1st no:"
    
    mov ah,01h ; DOS function to read a single character from the keyboard
    int 21h ; wait for key input -> result in AL (ASCII)
    sub al,30h ; convert ASCII digit ? actual number
    mov bl,al ; store first number in BL
    
    printn m2 ; Prints - "Enter the 2nd no:"
    
    mov ah,01h 
    int 21h ; wait for input -> AL = ASCII digit
    sub al,30h ; convert ASCII -> number
    add al,bl ; add 1st number (BL) to 2nd number (AL)
    
    printn r ; "Result is"
    prints al ; print the value in AL
    
    mov ah,4ch
    int 21h
end start
    