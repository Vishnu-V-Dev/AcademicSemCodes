.model small ;small memory model (code and data ? 64 KB each)
.stack 100h ;256 bytes

.data
    n1 db 5
    n2 db 3
    ;Stored as 1 byte each
.code
start:
    mov ax,@data ;Load the address of the data segment into AX
    mov ds,ax ;then move it to DS. This allows the program to access n1 and n2
    
    mov al,n1 ;AL = 5
    add al,n2 ; AL = 5 + 3 = 8
    add al,30h ;AL = 8 + 30h ? ASCII value of '8'
    
    mov dl,al ;Move ASCII of '8' into DL
    mov ah,02h ;DOS service: display single character
    int 21h ;calls interrupt: Output ? prints '8'
    
    mov ah,4ch ; Terminates program
    int 21h ;calls interrupt    
end start
