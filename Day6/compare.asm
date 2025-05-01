;write the assembly program the input two single digit numbers and compare 
;which number is greater

.model small
.stack 100h

.data
msg1 db "Enter the 1 st number: $"
msg4 db "Enter the 2nd number $"
msg2 db "It is greater than $"
msg3 db "It is less than $"
a db 0
b db 0

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

	mov dx,offset msg4 ;print the msg
	mov ah,09h
	int 21h

	mov ah,01h	;4+48=51
	int 21h

	mov dl,al	;dl=al=52
	sub dl,48	;dl=52-48=3
	mov b,dl	;a=4

	mov dl,10	;new line
	mov ah,02h
	int 21h
	
	mov bl,a
	
	cmp bl,b
	jg m2		;m2=label name
	jl m3

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



