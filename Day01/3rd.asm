.model small
.stack 100h

.data
msg db "hello",13,"hii$"

.code
start:

mov ax,@data
mov ds,ax
mov dx,offset msg
mov ah,09h ;only for string
int 21h

mov ax,4c00h
int 21h

end start