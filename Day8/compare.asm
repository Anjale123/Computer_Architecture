;Given three numbers determine which one is the greater than and display the message
.model small
.stack 100h

.data
	n1 db 0
	n2 db 0
	n3 db 0
	m1 db "Enter the 1st number: $"
	m2 db "Enter the 2nd number: $"
	m3 db "Enter the 3rd number: $"
	msg1 db "n1 is greater than $"
	msg2 db "n3 is greater than $"
	msg3 db "n2 is greater than $"
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset m1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n1,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov dx,offset m2
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n2,al
	
	mov dl,10
	mov ah,02h
	int 21h

	mov dx,offset m3
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n3,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov al,n1
	
	cmp al,n2
	jge l1	;n1>n2
	jl l2	;n2>n1
	
	
	l1:
	mov al,n1
	cmp al,n3
	jge ms2 	;n1>n3
	jl ms3		;n3>n1
	
	l2:
	mov al,n2
	cmp al,n3 	
	jge ms4 	;n2>n3
	jl ms5 		;n3>n2
	
	ms2:
		mov dx,offset msg1
		mov ah,09h
		int 21h
		jmp endn
		
	ms3:
		mov dx,offset msg2
		mov ah,09h
		int 21h
		jmp endn
		
	ms4:
		mov dx,offset msg3
		mov ah,09h
		int 21h
		jmp endn
		
	ms5:
		mov dx,offset msg2
		mov ah,09h
		int 21h
		jmp endn
		
	endn:
	
	mov ax,4c00h
	int 21h
	
	end start
		
