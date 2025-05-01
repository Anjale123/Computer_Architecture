;write the assembly program to input a single digit number and check if it is even or odd
.model small
.stack 100h

.data
msg1 db "Enter the number: $"
msg2 db "It is even number $"
msg3 db "It is odd number $"
r db ?
a db 0
n db 2

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

	mov ah,00
	mov bl,2
	mov al,a
	div bl	;a/2=3/2=al=1 ah=1
	
	cmp ah,0
	je m2		;m2=label name
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












