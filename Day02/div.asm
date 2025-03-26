.model small
.stack 100h

.data
n db 4
m db 2
r db ?

.code
start:

mov ax,@data
mov ds,ax
    
mov ah,00
mov al,n
div m ; al=n/m  ah =0
mov r,ah ;r=0
mov dl,al
add dl,48

mov ah,02h      
int 21h

;print new line
mov dl,10
mov ah,02h      
int 21h

;print remainder
mov dl,r ;dl=r=0
add dl,48
mov ah,02h      
int 21h

mov ax,4c00h
int 21h

end start