.model small
.stack 100h

.data
    num db 5

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dl, num
    add dl, 30h    ; convert to ASCII 
    mov ah, 02h    ;character print
    int 21h

exit:
    mov ah, 4ch    ;4CH is the DOS function code used to terminate (exit) the program.
    int 21h

main endp
end main
