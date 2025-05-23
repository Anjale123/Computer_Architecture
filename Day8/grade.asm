;given a mark from 0-100 display a grade:
;90-100 A
;75-89 B
;60-74 C
;50-59 D
;below 50 Fail

.model small
.stack 100h

.data 
	n1 db 0
	n2 db 0
	mark db 0
	
	m1 db "Enter the mark: $"
	msg1 db "Grade is A. $"
	msg2 db "Grade is B. $"
	msg3 db "Grade is C. $"
	msg4 db "Grade is D. $"
	msg5 db "Fail. $"
	
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
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n2,al
	
	mov bl,10
	mov al,n1
	mul bl
	
	mov dl,al
	add dl,n2
	mov mark,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov al,mark
	cmp al,90
		jge PrintA
		jl lebel1
		
		PrintA:
		mov dx,offset msg1
		mov ah,09h
		int 21h
		jmp endn
	
	lebel1:
		cmp al,75
		jge PrintB
		jl lebel2
		
		PrintB:
		mov dx,offset msg2
		mov ah,09h
		int 21h
		jmp endn
		
	lebel2:
		cmp al,60
		jge PrintC
		jl lebel3
		
		PrintC:
		mov dx,offset msg3
		mov ah,09h
		int 21h
		jmp endn
		
	lebel3:
		cmp al,50
		jge PrintD
		jl PrintE
	
		PrintD:
			mov dx,offset msg4
			mov ah,09h
			int 21h
			jmp endn
		
		PrintE:
			mov dx,offset msg5
			mov ah,09h
			int 21h
			jmp endn
	
	endn:
	
	mov ax,4c00h
	int 21h
	
	end start

	
		
	