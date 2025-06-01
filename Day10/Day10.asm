;read the number without printing it
.model small
.stack 100h
.data
	msg db "Enter a number : $"
	a db ?
	b db ?

.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	call readInt
	
	mov ax,4c00h	;exit program
	int 21h
	
	proc readInt 
	mov ah,01h	;enter the 1st digit
	int 21h
	sub al,48	
	mov a,al
		read :
			mov ah,01h	;enter the 2nd digit
			int 21h
			cmp al,0dh	;enter key word_can check the 2nd number or exit the function
			je exit
			
			sub al,48
			mov b,al
			
			mov al,a
			mov bl,10
			mul bl
			add al,b
			
			mov a,al
			jmp read
			
			exit:
			mov al,a
			
		ret
		endp
		
	end