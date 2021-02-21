.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles   
arr dw 1,2,4,7,6,4,3,2,1
size dw 9


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
add bx,2
loop temp; sub from cx
ret           

proc boubleSort
mov cx,size    
lop1:      
push cx
mov cx,size
dec cx
mov bx,offset arr
lop2:
mov ax,[bx]
cmp [bx+2],al ; if bx+ igger then al it will jump directly to lop3:
ja lop3                                                            
push [bx]
push [bx+2]
pop [bx]
pop [bx+2]    
lop3:
add bx,2
loop lop2
pop cx
loop lop1
ret
   




    
    
               
       
        
     
main:

mov ax,@data
mov ds,ax
call boubleSort
call NivGay





mov ax, 4c00h
int 21h
end main