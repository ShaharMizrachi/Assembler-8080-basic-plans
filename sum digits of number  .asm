.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
num dw 65535
sum dw ?

.code

    sum_digits proc
    push bp
    mov bp,sp
    
    ;saving all my registers 
    push dx
    push cx
    push ax
    push si
    push bx
    
    
    mov bx,[bp+4] ;num my numer 
    mov ax,[bx]
    xor si,si ;counter 
    xor dx,dx
    xor cx,cx
    mov cx, 10
      
    start:  
        cmp ax,0
        jz finish
        div cx
        add si,dx
        xor dx,dx
        jmp start 
        finish:
        
        
        mov [bx],si
       

        
        pop bx  ;resuimg registers as use to be 
        pop si
        pop ax
        pop cx
        pop dx
  
  
        pop bp
        ret 6
       
  
main:
  
mov ax,@data
mov ds,ax
       
       
mov ax,offset num
push ax
call sum_digits
pop bx
xor ax,ax
mov ax,[bx]
mov sum,ax   
    
       
          
mov ax, 4c00h
int 21h
end main