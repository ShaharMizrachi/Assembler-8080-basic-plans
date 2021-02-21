.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
result db ?
size db 6
numbers db 1,2,3,4,5,6

.code


proc SumNumbers
    push bp
    mov bp,sp
    mov cx,[bp+8] ;size
    mov bx,[bp+6] ;my arry  
    xor dx,dx
    xor al,al
    shahar:  
        add dl,[bx]
        jnc niv
        mov al,1
        niv:
        inc bx
        loop shahar
        mov bx,[bp+4]; now bx point to reasult 
        mov [bx],dl ; moving the result by referance
        pop bp
        ret 6 ; return and release the number of byts i want

main:
  
mov ax,@data
mov ds,ax
 
 xor ax,ax
 mov al,size
 push ax
 mov bx,offset numbers;this like & in c
 push bx
 mov bx,offset result 
 push bx
 call SumNumbers
 
 
 
 
mov ax, 4c00h
int 21h
end main