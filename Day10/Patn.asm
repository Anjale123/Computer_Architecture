.model small
.stack 100h

.data
	msg db "print the pattern:  $"
	count db 7
	star db "* $"
	n db 0
	
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov cl,n
	
	loop1:
		mov bl,count
		
		loop2:
			mov dx,offset star
			mov ah,09h
			int 21h
			
			dec bl
			
			jnz loop2
			
		mov dl,10
		mov ah,02h
		int 21h
		
		dec count 
		
		loop loop1

	mov ax,4c00h
	int 21h
	
end