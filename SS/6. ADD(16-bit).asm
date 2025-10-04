.model small
.stack 100h

.data
    n1 db 7
    n2 db 5

.code
start:
    mov ax,@data
    mov ds,ax
    
    mov al,n1
    add al,n2 ; AL = 7 + 5 = 12
    
    mov cl,0ah ;CL = 10 (decimal)
    mov ah,00h ;Clears AH, so the dividend is entirely in AX
    div cl ;Divides AX by CL
           ;div cl divides AL (12) by 10:
           ;Quotient ? AL = 1
           ;Remainder ? AH = 2
           ;(This is a standard trick to split a number into tens and units)
    mov bl,ah ; BL = remainder (units digit) = 2
    add al,30h ; convert 1 ? ASCII '1'
    mov dl,al
    
    mov ah,02h
    int 21h ; prints '1'
    
    add bl,30h ; convert 2 ? ASCII '2'
    mov dl,bl
    
    mov ah,02h
    int 21h ; prints '2'
    
    mov ah,4ch
    int 21h
end start
