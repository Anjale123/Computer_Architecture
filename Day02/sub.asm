.model small
.stack 100h

.data
n db 5
m db 3
a db 1

.code
start:

mov ax,@data
mov ds,ax
    
;Print the number
mov dl,n ;dl= 5
add dl,m ;dl=5+3
sub dl,a  ;dl=8-4
add dl,48 ;dl=48+4


mov ah,02h      
int 21h

mov ax,4c00h
int 21h

end start