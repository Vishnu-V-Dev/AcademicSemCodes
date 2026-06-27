; ADD
.code
main:
    mov ax,@data
    mov ds,ax

    MSG m1
    READN
    mov bl,al
    
    MSG m2
    READN
    add al,bl
    
    MSG m3
    PRINTN al
    
    mov ah,4ch
    int 21h
end main

; SUB
.code
main:
    mov ax,@data
    mov ds,ax

    MSG m1
    READN
    mov bl,al
    
    MSG m2
    READN
    mov cl,al
    sub bl,cl
    
    MSG m3
    PRINTN bl
    
    mov ah,4ch
    int 21h
end main

;MUL
.code
main:
    mov ax,@data
    mov ds,ax

    MSG m1
    READN
    mov bl,al
    
    MSG m2
    READN
    mul al
    
    MSG m3
    PRINTN al
    
    mov ah,4ch
    int 21h
end main

;DIV
.code
main:
    mov ax,@data
    mov ds,ax

    MSG m1
    READN
    mov bl,al
    
    MSG m2
    READN
    xchg al,bl
    xor ah,ah
    div bl
    
    MSG m3
    PRINTN al
    
    mov ah,4ch
    int 21h
end main
