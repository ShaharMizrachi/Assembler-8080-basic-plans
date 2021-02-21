.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
.code

main:

mov ax,@data
mov ds,ax



mov bx,235h;









mov ax, 4c00h
int 21h
end main