.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles   


.code
proc NextLine
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    ret 
 
  
main:

mov ax,@data
mov ds,ax

xor ax,ax
xor cx,cx
mov bx,1
mov cx,9
mov ah,2
temp1: 
push cx
mov cx,bx
inc bx 
temp2:
mov dl,'*'
int 21h
loop temp2
call NextLine
pop cx
loop temp1    







mov ax, 4c00h
int 21h
end main