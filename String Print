.model small              ; memory model  / average / large
.stack 100h               ; SS declare / 256 bytes memory reserve


.data                     ; data/variable declaration
    str db 'Hello World$' ; String- Define Byte- 
                          ;$ marks the end of the string for DOS INT 21H function 09H, telling it where to stop printing.   
                          
                         
.code                     ;instructions/code


main proc                 ; Procedure
    mov ax, @data         ; data segment-of address put ax address
    mov ds, ax            ; ds-data segment register activate

    
    lea dx, str           ; str load
    mov ah, 09h           ; String print
    int 21h               ; interrupt


exit:                     ; exit function
    mov ah, 4ch           ; terminate/exit
    int 21h               ; interrupt


main endp                 ; end procedure
end main
