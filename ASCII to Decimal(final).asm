.model small
.stack 100h
.data
    asciiDigit db 'Type a character: $'         
    resultStr db 10,13, "Its corresponding ASCII code in decimal is: $"  
    numberStr db '    $'       

.code
main proc
    mov ax, @data
    mov ds, ax 
    
    mov ah,9
    lea dx,asciiDigit
    int 21h
    
    mov ah,1
    int 21h
    
    mov ah, 0                   
    mov cl, 100                
    div cl                      
    add al, '0'                 
    mov numberStr[0], al        
    
  
    mov al, ah                  
    mov ah, 0                   
    mov cl, 10                  
    div cl                      
    add al, '0'                 
    mov numberStr[1], al        
    
   
    mov al, ah                
    add al, '0'                
    mov numberStr[2], al       

   
    mov ah, 9                
    lea dx, resultStr          
    int 21h                      
    lea dx, numberStr  
    int 21h 
    
end:                   
    mov ah, 4Ch               
    int 21h                    
main endp
end main