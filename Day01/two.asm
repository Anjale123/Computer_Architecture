.model small
.stack 100h

.data
num db 5

.code
start:

mov ax,@data
mov ds,ax
    
;Print the number
mov dl,num  ;dl= 5
add dl,48    ;48+5  
mov ah, 02h      
int 21h

mov ax,4c00h
int 21h

end start