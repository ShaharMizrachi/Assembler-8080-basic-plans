.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
 A1 DW 2 dup(0417h)
 A2 db 32
 A3 db '9',-3,'-3',7,1,8

.code


main:
  
mov ax,@data
mov ds,ax
           
xor ax,ax


mov ax,a1[di]
sar ax,3
 
 
mov ax, 4c00h
int 21h
end main