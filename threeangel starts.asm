.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles   

count dw 1


.code
;here i should writ my functions with proc

proc printAsterisk     

mov dl,'*'
mov ah,2
int 21h     
ret ;return 
     
proc PrintRow 

mov dl,13
mov ah,2
int 21h

mov dl,10
mov ah,2
int 21h
ret    

proc GetNum
mov ah,1
int 21h
sub al,'0'
mov dl,10
mul dl
mov dl,al
    
mov ah,1
int 21h
sub al,'0'
add al,dl
xor cx,cx
mov cl,al    





ret         
     
main:

mov ax,@data
mov ds,ax

call GetNum
call printRow
temp:
push cx
mov cx,count
inc count

temp1:
call printAsterisk
loop temp1
call printRow
pop cx
loop temp








mov ax, 4c00h
int 21h
end main