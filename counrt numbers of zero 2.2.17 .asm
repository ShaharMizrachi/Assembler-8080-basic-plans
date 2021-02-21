.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
image db 5 1,0,4,6,0
count dw ?

.code
         
proc count_zero
    push bp 
    mov bp,sp
    push ax
    push bx
    push cx
    push dx
    
    xor ax,ax ;count zero
    mov bx,[bp+8]; array image
    mov cx,[bp+6] ;size 100
    shahar: 
        mov dl,[bx]        
        cmp dl,0 ;chaking if zero
        jnz niv 
            inc ax ;count
        niv: 
        inc bx
        loop shahar
        mov bx,[bp+4] ;address of count 
        mov [bx],ax
        pop dx
        pop cx
        pop bx
        pop ax
        pop bp
        ret 6
         
         

main:
  
mov ax,@data
mov ds,ax

mov bx,offset image
push bx
mov ax,5
push ax
mov bx,offset count
push bx
call count_zero
 
 

mov ax, 4c00h
int 21h
end main