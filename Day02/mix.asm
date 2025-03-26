.model small
.stack 100h

.data
msg1 db "Number01: $"
msg2 db "Number02: $"
msg3 db "Addition of num1 and num2: $"
n db 2
m db 3

.code
start:

mov ax,@data
mov ds,ax

mov dx,offset msg1
mov ah,09h ;only for string
int 21h

mov dl,n  ;dl= 5
add dl,48    ;48+5  
mov ah, 02h      
int 21h

mov dl,10
mov ah,02h      
int 21h

mov dx,offset msg2
mov ah,09h ;only for string
int 21h

mov dl,m  ;dl= 5
add dl,48    ;48+5  
mov ah, 02h      
int 21h

mov dl,10
mov ah,02h      
int 21h

mov dx,offset msg3
mov ah,09h ;only for string
int 21h

mov dl,n ;dl= 5
add dl,m ;dl=5+3
add dl,48 ;dl=48+4
mov ah,02h      
int 21h

mov ax,4c00h
int 21h


end start