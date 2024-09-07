.model small
.stack 100h     

.data
num1 db 'Input 1st digit:$'
num2 db 'Input 2nd digit:$'
result db 'The sum of num1 & num2 is: $'
newline db 10, 13, '$' ; For printing a newline (CRLF)

.code
main proc
    mov ax,@data
    mov ds,ax
    
    ; Prompt for first digit
    mov ah,9
    lea dx,num1
    int 21h
    
    ; Read first digit
    mov ah,1
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov bl, al       ; Store in BL

    ; Print newline
    mov ah,9
    lea dx, newline
    int 21h

    ; Prompt for second digit
    mov ah,9
    lea dx,num2
    int 21h

    ; Read second digit
    mov ah,1
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov bh, al       ; Store in BH

    ; Print newline
    mov ah,9
    lea dx, newline
    int 21h

    ; Calculate result (add BL and BH)
    add bl, bh       ; Add the two digits
    add bl, '0'      ; Convert back to ASCII

    ; Display result
    mov ah,9
    lea dx, result
    int 21h

    ; Print the result (single digit)
    mov ah,2
    mov dl,bl        ; Load result in DL
    int 21h

    ; Exit program
    mov ah,4Ch
    int 21h
main endp
end main
