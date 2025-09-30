.model small
.data
        num1 db 5   
        num2 db 3   
        result db 0 
.code
        mov ax,@data
        mov ds,ax
        mov al,num1 ;Load first no into AL
        add al,num2 ;Add second no to AL
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
end
