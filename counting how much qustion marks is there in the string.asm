.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
my_string dw "?is this a question? why? why not????$"
count dw ?

.code


proc sum_Q 
    push bp
    mov bp,sp
    
    
    mov si,[bp+6] ;my string 
    mov bx,[bp+4] ; count 
    xor dx,dx
    
    start:
        mov ax,[si]
        cmp al,'$'  
        jz finish
        cmp al, '?'
        jnz not_q
        inc dx
        not_q:
          inc si 
          jmp start
        finish:
          mov [bx],dx ;moving to count bx connected to bp+4
          
          ;printing the number in hex
          add dl,'0' 
          mov ah,2
          int 21h
         
          pop bp 
          ret 4

main:
  
mov ax,@data
mov ds,ax
           
mov ax, OFFSET my_string
push ax
mov ax, OFFSET count
push ax
call sum_Q
 
 
mov ax, 4c00h
int 21h
end main