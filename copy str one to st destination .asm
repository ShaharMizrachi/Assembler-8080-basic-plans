.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
source_str db "this is the source string$"
destination_str db "this is the destination string$"
n dw 80

.code

     
proc strnlen
    push bp
    mov bp,sp 
 
    mov bx,[bp+4]
    mov si,[bp+6] ;destination str
    mov cx,bx ;our size call n
    mov bx,[bp+8] ;source str
    xor ax,ax ;numbers of latter i copied  
    
    
    start:
        cmp [bx],'$'
        JE done
        cmp cx,ax
        JE done
        mov dl,[bx]
        mov [si],dl
        inc si
        inc bx
        inc ax 
        JMP start
        done: 
            pop bp  
            ret 5

proc print
mov bx,offset destination_str
temp:
cmp [bx],'$'
JE last
mov dl,[bx]
mov ah,2
int 21h
mov dl,' '
mov ah,2
int 21h
inc bx
jmp temp
last:
ret         
         
    
    
    
    
     
main:
  
mov ax,@data
mov ds,ax


mov bx, OFFSET source_str
push bx
mov bx, OFFSET destination_str
push bx
push n
call strnlen
call print
 
 
mov ax, 4c00h
int 21h
end main