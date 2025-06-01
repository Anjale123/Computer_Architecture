;print even numbers from 2 to 9

.model small
.stack 100h
.data
	msg db "print the even numbers from 2 to 9: $"
	
.code
main:
	mov ax,@data
	mov ds,ax
	
	mov cl,9           ;loop 5 times
	mov bl,1           ;starting number (1)
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h
	
	next_number:
		mov al,bl
		mov ah,00
		mov dl,2   
		div dl     
		
		cmp ah,1
		jnz not_even	;if not zero, its odd_skip the printing
		
	;convert the number
		mov al,bl
		add al,48
		mov dl,al
		mov ah,02h
		int 21h
		
		mov dl,' '
		mov ah,02h
		int 21h
		
		not_even:
		inc bl
		loop next_number

		mov ax,4c00h
		int 21h
 
end main

	