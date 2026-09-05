.model small
.stack 100h
.data 

number db 13,10, "enter three numbers:$"
result db 10,13, "this is your largest:$"
.code

main proc
    mov ax,@data
    mov ds,ax      
    
    ;input messege print
    lea dx,number
    mov ah,9
    int 21h   
    
    ;user input
    mov ah,1
    int 21h                         
        
    ;input gose to al
    mov bl,al            ;1st number=bl
    int 21h
    mov bh,al            ; 2nd number=bh
    int 21h
   mov cl,al             ;3rd number =cl   
   
  
  
   cmp bl,bh             ;bl>=bh
   jge large1            ;jump if greater or equal
       
      
   ;else,bh>bl
       
   large2:
   cmp bh,cl ;bh>=cl
   jge large3 ;jump if greater or equal
       
   
   ;else   ,cl>bh   
   ;output messege print
    lea dx,result
    mov ah,9
    int 21h   
    
    
    ;output value print
    mov dl,cl ; output reg
    mov ah,2 ;char primt
    int 21h  
    jmp exit
    
    
    large3: ;lifo order 
    ;output messege print
    lea dx,result
    mov ah,9
    int 21h   
    
    
    ;output value print
    mov dl,bh ; output reg
    mov ah,2 ;char primt
    int 21h  
    jmp exit
  
  large1:
  cmp bl,cl ; bl>=cl
  jge large4 ;jump if greater than or equal
  
   
   ;else ,cl>bl  
  
   ;output messege print
    lea dx,result
    mov ah,9
    int 21h   
    
   
    ;output value print
    mov dl,cl ; output reg
    mov ah,2 ;char primt
    int 21h  
    jmp exit   
    
    
    large4:
    ;output messege print
    lea dx,result
    mov ah,9
    int 21h   
    
        
    ;output value print
    mov dl,bl ; output reg
    mov ah,2 ;char primt
    int 21h  
    jmp exit
    
         
    exit : 
    mov ah,4ch
    int 21h
    
    
    main endp
 end main
 
