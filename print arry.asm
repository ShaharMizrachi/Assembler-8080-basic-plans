.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles   
arr db 1,2,3,4,5,6,7
size dw 7



.code
;here i should writ my functions with proc

       
proc NivGay
mov cx,size
mov bx,offset arr
temp:
mov dl,[bx]
add dl,'0'
mov ah,2
int 21h
mov dl,' '
mov ah,2
int 21h
inc bx
loop temp; sub from cx
ret           
       
       
        
     
main:

mov ax,@data
mov ds,ax

call NivGay





mov ax, 4c00h
int 21h
end main