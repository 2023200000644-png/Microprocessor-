.model small
.stack 100h
.data 

dividend db " Enter dividend: $ "
divisor db 13,10," Enter Divisor: $"
quotient db 13,10 , " quotient : $"
error db 13,10, "Error! undefine !! $ "
.code

main proc 
    mov ax, @data
    mov ds,ax
    
    ;load effective address          
    lea dx,dividend                            ;str load
    mov ah,9h                                  ;str print
    int 21h                                    ; interrupt 
    
        ;dividend input
        mov ah,1                               ;char input  
        int 21h                                ;al
        mov bl,al                              ; dividend
        sub bl,48                              ;dec convert  
        
    ;load effective address       
    lea dx,divisor                        ;str load
    mov ah,9h                                  ;str print
    int 21h                                    ; interrupt 
    
    
     ;divisor input
     mov ah,1                               ;char input  
     int 21h                                ;al
     mov bh,al                              ; divisor
     sub bh,'0'                             ;dec convert 
        
    ;load effective address          
    lea dx,quotient ;str load
    mov ah,9h;str print
    int 21h ; interrupt  
    
    ;corner case
    cmp bh,0
    je divide_zero                           ; jump if equal 
    
    ;else
    
    mov al,bl                                 ;division 
    xor ah,ah                                 ;memory clear
    div bh                                    ;divisor
    mov dl,al                                 ;output reg
    add dl,30h                                ;ascii convert
    mov ah,2h                                 ;char print
    int 21h
    
    divide_zero: 
    
    ;load effective address       
    lea dx,error ;str load
    mov ah,9h;str print
    int 21h ; interrupt 
               
    
    exit:
    
    mov ah,4ch
    int 21h
    
    main endp
end main
