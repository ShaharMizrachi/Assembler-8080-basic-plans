.model small
.stack 100h;stack size  
.data
;------------------------------
;Here define your varibles
 size DB 6
string DB 'sHaHa*'

.code

 
proc print_string                    
 xor cx,cx
 mov cl,size
 mov bx,offset string
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
           

mov si,offset string    ;my string 
xor dl,dl
xor cx,cx 
xor ax,ax
mov cl,size


start:
    mov dl,[si] 
    chacking_capital_letter:
         cmp dl,65
         jae suspect_to_capital_letter
         cmp dl,46
         jz finish
         cmp dl,32
         jz finish
         mov dl,'$' 
         jmp finish
         suspect_to_capital_letter:
             cmp dl,90
             jbe capital_lettar
             cmp dl,97 
             jae suspect_to_small 
             mov dl,'$'
             jmp finish ;in case between 90 to 97 and it is not a letter 
             suspect_to_small:
                cmp dl,122
                jbe finish ; chaking if it is s,aller then small z if not it is not a latter 
                mov dl,'$' 
                jmp finish
             capital_lettar:
                    add dl,32
                    mov [si],dl
                    jmp finish
                    finish: 
                    ;int 21h ; printing what i have in dl
                        mov [si],dl
                        inc si        
                        dec cl 
                        jnz start 
                        call print_string
                           
mov ax, 4c00h
int 21h
end main