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
    xor ax,ax
    mov cx,[bp+4]
    mov bx,[bp+8] ;source string
    mov di,[bp+6] ;destination string
    first:
        mov dl,[bx]
        cmp dl,'$'
        jz done:
        mov [di],dl ;moving from str_s to str_d 
        inc di
        inc bx
        loop first: ; in case i didint get to $
        done:
        pop bp
        ret 6
             
proc printString
    mov bx,offset destination_str
    mov ah,2
    print:
        mov dl,[bx]
        cmp dl,'$'
        jz stop
        inc bx
        int 21h
        jmp print
    stop:
    ret 0              
             
             
             
             
             
                
main:
  
mov ax,@data
mov ds,ax


mov bx,offset source_str 
push bx
mov bx,offset destination_str 
push bx
push n
call strnlen
call printString 
 
 
mov ax, 4c00h
int 21h
end main