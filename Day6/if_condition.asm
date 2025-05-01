;if condition
	;a==b	je  jump if equal
	;a!=b	jne
	;a>b	jg
	;a>=b	jge
	;a<b	jl
	;a<=b	jle
	
;--------------------------------------------------------------------------
	
;write the assembly program to check if a number is equal to 5.
;Display "Hi" if equal else "Bye".

.model small
.stack 100h

.data
msg1 db "Enter the number: $"
msg2 db "Hii $"
msg3 db "Bye $"
a db 0

.code
start:

mov ax,@data
mov ds,ax

mov dx,offset msg1 ;print the msg
mov ah,09h
int 21h

mov ah,01h	;3+48=51
int 21h

mov dl,al	;dl=al=51
sub dl,48	;dl=51-48=3
mov a,dl	;a=3

mov dl,10	;new line
mov ah,02h
int 21h

cmp a,5
je m2		;msg2=label name
jne m3

;if part
m2:
mov dx,offset msg2 ;print the msg
mov ah,09h
int 21h
jmp endn

;else part
m3:
mov dx,offset msg3 ;print the msg
mov ah,09h
int 21h

jmp endn	;end if condition

endn:


mov ax,4c00h
int 21h

end start