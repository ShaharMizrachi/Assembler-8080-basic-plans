.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles   

var1 db 1,2,3,4,5,6,7

.code
proc printArr
xor cx,cx
mov cx,7h
mov ah,2
mov bx ,offset var1
temp3:
mov dl,[bx]
add dl,'0'
int 21h;for printing 
mov dl,','
int 21h
inc bx
loop temp3; it dec from c-- and if until cx is not zero it will jump back to temp 3
ret 0; return 
  
  
  
  
  
main:

mov ax,@data
mov ds,ax

xor ax,ax
xor bx,bx
xor cx,cx
mov cl,7h
mov bx,offset var1
shahar:
mov al,[bx]
push ax
inc bx
dec cl
jnz shahar:

mov bx,offset var1 
mov cl,7h
niv:
pop ax
mov [bx],al 
inc bx
dec cl
jnz niv:
call printArr


mov ax, 4c00h
int 21h
end main