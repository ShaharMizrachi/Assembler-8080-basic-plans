.model small


.stack 100h


.data
num dw 16
sum dw ?



.code

proc sum_digits
    push bp
    mov bp,sp
    push bx
    push ax
    push cx
    push dx
    mov bx,1;count
    mov ax,[bp+4] ; num
    mov cx,10 ;div
    loop1:
        xor dx,dx ; for the div
        div cx
        cmp ax,0
        jz done
        inc bx
        jmp loop1
        done:
        mov [bp+4],bx
        pop dx
        pop cx
        pop ax
        pop bx
        pop bp
        ret 0
        
        
    
    


 
        
        







main:

mov ax,@data
mov ds,ax


mov ax, @data
mov ds, ax
mov ax, num
push ax
call sum_digits
pop sum






mov ax,4c00h
int 21h

end main


