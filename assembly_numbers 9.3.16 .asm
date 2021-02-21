.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
num db 7
result dw ?

.code

   
   
proc assembly_numbers
    push bp
    mov bp,sp
    mov ax,1
    mov bx,[bp+4]; result 
    mov cx,[bp+6]; num
    shahar:
          mul cx ; is doin cx x ax
    loop shahar
    mov [bx],ax
    pop bp
    ret 0 
              
   

   
main:
  
mov ax,@data
mov ds,ax 
xor bx,bx
mov bl,num
push bx
xor bx,bx
mov bx,offset result
push bx
call assembly_numbers 

 
 
 
 
mov ax, 4c00h
int 21h
end main