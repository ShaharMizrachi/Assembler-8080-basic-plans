.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles 


my_number db 3

result dw 0 


.code
 
 
  
proc factorial:
    push bp
    mov bp,sp 
    push ax
    push cx
    push si
    push bx
    mov bx,[bp+6] ;my number 
    mov si,[bp+4] ;result
    mov cl,[bx] ;accissit parameter for my number
    xor ax,ax  ;will hold my result
    mov al,1 
    start:
        cmp cl,8
        jge bigger_then_limit:
        cmp cl,1
        je done:
        mul cl
        dec cl 
        jmp start
        bigger_then_limit:
            mov al,0
        done:    
            mov [si],ax ; moving my_result
            pop bx
            pop si
            pop cx
            pop ax
            pop bp
            ret 4

proc print: 
    mov bx,offset result
    mov dl,[bx]
    mov ah,2h
    int 21h
    ret
    
    
 
main:

mov ax,@data
mov ds,ax

mov bx, offset my_number
push bx
mov bx,offset result
push bx
call factorial:
call print:


mov ax, 4c00h
int 21h
end main