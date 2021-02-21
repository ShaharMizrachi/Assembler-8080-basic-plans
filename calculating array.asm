.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles   

var1 db 1,2,3,4,5,6,0ffh
.code

main:

mov ax,@data
mov ds,ax


xor cx,cx
xor ax,ax
mov cl,7h
mov bx,offset var1

shahar:
add al,[bx]
jnc niv ; here if the numver is bigger  then 0 to 255 (that is what al can hold
inc ah
niv:
add bx,1h
sub cx,1h
jnz shahar







mov ax, 4c00h
int 21h
end main