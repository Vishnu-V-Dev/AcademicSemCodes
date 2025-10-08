.model small
.stack 100h

.data
    input db 100 dup('$') ; Creates a memory space of 100 bytes initialized with $
    msg1 db 10,13,"Palindrome$" ; 13,10 adds a new line - Carriage Return + Line Feed
    msg2 db 10,13,"Not Palindrome$"
    prompt db "Enter a String: $"

.code
start:
    mov ax,@data
    mov ds,ax
    
    lea dx,prompt ; Displays prompt message
    mov ah,09h
    int 21h
    
    lea si,input ; SI points to start of input array
    mov cx,0 ; CX is set to 0 to count number of characters typed.
    
read_loop:
    mov ah,01h
    int 21h
    
    cmp al,0Dh ; Compares the entered key (AL) with 0Dh(Enter key).
    je terminate_input ; If Enter is pressed -> jump to terminate_input.
    
    mov [si],al ; Stores each character into memory at [SI]
    inc si ; Moves to next memory location by incrementing SI
    inc cx ; Increments count CX (total number of characters read)
    jmp read_loop ; Repeats for next character
    
terminate_input:
        mov byte ptr[si],'$' ; Stores $ at the end of the string -> marks string end
        mov si,input ; SI → points to first letter
        mov di,cx ; now CX = total number of characters typed
        dec di ; Arrays (like input) start at offset 0, if cx=5 then index is 4.
        
check_loop:        
        cmp si,di ; If start pointer(SI) = end pointer (DI)
        jge is_palindrome ; jump to is_palindrome
        
        mov al,[si] ; Moves character at [SI] (start) into AL
        mov bl,[di] ; Moves character at [DI] (end) into BL
        cmp al,bl ; Compares them
        jne not_palindrome ; If not equal -> jump to not_palindrome
        
        inc si ; next character
        dec di ; previous character
        jmp check_loop ; Repeat the comparison loop.
      
is_palindrome
    lea dx,msg1
    jmp print_result
    
not_palindrome
    lead dx,msg2
    
print_result
    mov ah,09h
    int 21h

end start   
