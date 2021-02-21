.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
numbers_array db -1,3,6,-3,-6,-1,5,7,9,-2
count dw ?

.code

proc absolute
    push bp
    mov bp,sp
    push cx
    push dx
    push bx
 
    mov cx,[bp+6] ;size of array
    xor dx,dx ;count
    mov bx,[bp+8] ;array
    shahar:
        cmp [bx],0
        jnl not_negative: 
        inc dx
        neg [bx]
        not_negative:
        inc bx
        loop shahar
        mov bx,[bp+4] ;count
        mov [bx],dx
        pop bx
        pop dx
        pop cx
        pop bp
        ret 6
         
main:
  
mov ax,@data
mov ds,ax

mov bx ,offset numbers_array
push bx
mov ax, 10
push ax
mov bx, OFFSET count
push bx
call absolute

 
 

mov ax, 4c00h
int 21h
end main