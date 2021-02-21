.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
 image Db 1,3,7,0,2,0,1,5,0
 count db 32


.code
proc count_zero
    mov bp,sp
    push bp
    xor ax,ax
    xor bx,bx
    xor dx,dx
    
    pop si,[bp+8]
    pop di,[bp+6]
    mov cx,[di]
    
    start:
        mov dx,[si]
        cmp dx,0
        jnz finish
        inc dx
        finish:
            loop start     
            mov [bp+4],dx
            pop bp
            ret 10
            

main:
  
mov ax,@data
mov ds,ax
  

         
      
  
  
  
  
       
mov bx, OFFSET image
push bx
mov ax, 9
push ax
mov bx, OFFSET count
push bx
call count_zero
 
 
mov ax, 4c00h
int 21h
end main