 .model small
 .stack 100h
 .data   
 
 lower db 13,10 , "ENTER lowercase :$"
 higher db 13,10, "This is your higher case:$"
 
 .code
 
 
 main proc 
    mov ax, @data
    mov ds,ax
 
 ;lower messege print
  lea dx,lower
  mov ah,9
  int 21h
  
  ;user input
  mov ah,1h
  int 21h
  
  ;al
  mov bl,al  
  
 ;higher messege print
  lea dx,higher
  mov ah,9
  int 21h
  
  sub bl,32 ;'c'=99 'C'=67 .99-67=32,higher convert
  mov dl,bl ; output reg
  mov ah,2  ; char output
  int 21h
  jmp exit 
  
  
  
   exit :
    mov ah,4ch
    int 21h
    
    main endp
 end main
 
