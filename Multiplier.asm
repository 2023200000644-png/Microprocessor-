;Q-Normal multiplier 4*2=8

.model small         ;1 DS+1 CS average, large
.stack 100h

.data                 ;DS declare
.code 


main proc
    mov ax, @data
    mov ds, ax

    mov ax, 4
    mov cx, 2
    mul cx            ; Multiplier
    mov dx, ax
    add dx, 30h
    mov ah, 2h
    int 21h

exit:                 ;segment
    mov ah, 4ch       ;instruction exit
    int 21h           ; interrupt
    
    
     main endp        ; end of procedure
end main              ;whole program exit
