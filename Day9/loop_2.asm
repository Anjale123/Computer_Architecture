;Use a loop to display numbers from 1 to 5 (e.g., 1 2 3 4 5)

.model small
.stack 100h
.data
 s db '$'
.code

start:
mov ax,@data
mov ds,ax
mov cl,5            ;loop 5 times
mov bl,1            ;starting number (1)

lstart:
mov ah,02h
mov dl,bl
add dl,48
int 21h        ;bl=1    bl=2

mov dx,offset s
mov ah,09h
int 21h

inc bl
loop lstart

mov ax,4c00h
int 21h
 
end start