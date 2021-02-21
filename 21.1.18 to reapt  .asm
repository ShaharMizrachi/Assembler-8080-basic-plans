.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
first_str db "this is the first string$"
second_str db "This is the aecond string$"
n dw 80


.code

proc strnicmp
    push bp
    mov bp,sp
    
    xor ax,ax
    mov bx,[bp+6] ;second_str
    mov si,[bp+8] ;first_str
    mov cx,[bp+4] ;n size
    string_chaking:
      cmp [si],'$'
      
      jnz str1_end
      mov al,byte ptr[si]
      cmp byte ptr[bx],al
      jz finish_eqal: 
      jmp greater:
      str1_end:
      
      AND [si], 11011111b ;chang both to big latters  
      AND [bx], 11011111b
      
      mov al,[si]
      cmp al,byte ptr[bx]
      jnz who_is_bigger:
      inc si;getting forword 
      inc bx 
      loop string_chaking
      
      who_is_bigger:     
       cmp al,byte ptr[bx]
       jg finish_eqal:
       jmp lower:       
           

      
      finish_eqal:
        mov ax,0
      greater:
        mov ax,1
      lower:
      mov ax,-1 
      
      
      pop bp
      ret 6 




             
             
             
                
main:
  
mov ax,@data
mov ds,ax



mov bx, OFFSET first_str
push bx
mov bx, OFFSET second_str
push bx
push n
call strnicmp   
             
 
 
mov ax, 4c00h
int 21h
end main