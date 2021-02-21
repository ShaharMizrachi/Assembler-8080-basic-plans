.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
string db "hello world"; source string  
des db 11 dup(?) ;destinatiom for my string
size db 11
.code
    
proc reverse
    push bp
    mov bp,sp
    push cx
    push bx
    push si
    mov cx,[bp+4]; the size of the original string 
    xor bx,bx ;runnig on string from end
    mov bx,[bp+8]
    xor si,si; running on des from the start
    mov si,[bp+6]
    mov bx,cx
    dec bx  
      shahar:
      mov al,[bx]
      mov [si],al
      dec bx
      inc si 
      loop shahar
      mov ax,si
      pop si
      pop bx
      pop cx
      pop bp
      call print_string
      ret 6  
      
proc print_string
    xor cx,cx
    mov cl,size
    mov bx,offset des
    mov ah,2 ;for printig
    niv:
        mov dl,[bx]; printing what i have in dl
        int 21h
        inc bx
        loop niv
        ret 0
 
 
main:
  
mov ax,@data
mov ds,ax

xor bx,bx
mov bx,offset string
push bx
mov bx,offset des
push bx
xor bx,bx
mov bl,size
push bx  
call reverse
 
 
 
 
mov ax, 4c00h
int 21h
end main