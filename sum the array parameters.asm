.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
N DB 6
NUMBERS DB 1,2,3,4,5,6
result DB ?
.code

main:

mov ax,@data
mov ds,ax

xor cx,cx
xor ax,ax
mov cl,N
mov si,0

shahar:
mov al,[NUMBERS+si]
add result,al
inc si
loop shahar:
             
                   
mov ax, 4c00h
int 21h
end main