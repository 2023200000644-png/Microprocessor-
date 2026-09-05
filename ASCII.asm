.model small
.stack 100h

.data

.code

main proc

    mov ax, @data
    mov ds, ax

    mov cx, 0

Argentina:              ; Line counter
    mov bx, cx
    mov cx, 10

Brazil:                 ; ASCII character counter

    mov dl, bl          ; BL -> ASCII input
    mov ah, 02h
    int 21h

    inc bl
    cmp bl, 255
    je exit              ; If BL reaches 255, exit

    loop Brazil

    ; New line
    mov dl, 13
    mov ah, 02h
    int 21h

    mov dl, 10
    mov ah, 02h
    int 21h

    mov cx, bx           ; Restore value
    loop Argentina

exit:
    mov ah, 4ch
    int 21h

main endp
end main
