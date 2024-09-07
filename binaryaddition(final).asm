.model small
.stack 100h
.data
num1 db 11111b; decimal 31
num2 db 10110b; decimal 22  
newline db 10, 13, '$'

.code 
main proc
    mov ax, @data
    mov ds, ax
    
    ;addition part
    mov al, num2
    mov bl, num1
    add bl, al  
    
    ;loop part
    mov cx, 8 
    print_addition:
    mov ah, 2 
    mov dl, '0'
    test bl, 10000000b; test the first bit
    jz zero_addition ; if the bit is 0 jump to zero addition
    mov dl, '1' ;else print 1
    
    zero_addition:
    int 21h
    shl bl, 1 ;left shift by 1 to check the next bit
    loop print_addition 
    
    ;print binary suffix for addition result
    mov dl, 'b'   
    int 21h        
    
    mov ah,9
    lea dx, newline
    int 21h
    
    ;subtraction part
    mov al, num2
    mov bl, num1
    sub bl, al  
    
    ;loop part
    mov cx, 8
    print_subtraction:
    mov ah, 2
    mov dl, '0'
    test bl, 10000000b ;test first bit
    jz zero_subtraction
    mov dl, '1'
    
    zero_subtraction:
    int 21h
    shl bl, 1
    loop print_subtraction
    mov dl, 'b'
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
   
    