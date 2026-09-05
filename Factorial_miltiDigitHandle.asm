.model small
.stack 100h
.data

n dw 7
str db "output Factorial: $"
buffer db 6 dup(?)
.code

main proc
    mov ax, @data
    mov ds, ax

    lea dx, str ;output msg print
    mov ah, 9
    int 21h

    mov ax, n ;ax=7
    mov cx, n ;cx=7
    dec cx    ;cx=6

fact_count: ; factorial count loop
    dec n
    mul n
    dec cx
    cmp cx, 0
    jne fact_count ; jump if not equal to 0


    mov cx, 0 ; digit counter
    lea si, buffer+5 ; buffer load

digit_store: ;multidigit store to buffer
    xor dx, dx ;memory clear, dx=remainder
    mov bx, 10
    div bx
    add dl, '0' ; ascii convert
    dec si
    mov [si], dl
    inc cx
    cmp ax, 0
    jne digit_store ; jump if not equal to 0

    mov ah, 2h ; char print globally

print_fact: ;multidigit print
    mov dl, [si] ; digit restore
    mov ah, 2h
    int 21h
    inc si
    loop print_fact ;continue till

exit:
    mov ah, 4ch
    int 21h

main endp
end main
