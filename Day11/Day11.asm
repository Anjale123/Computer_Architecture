;	Write an assembly language program to complete the following tasks.

; a.	Print the English alphabet in Uppercase letters and Lowercase letters.         [10%]
; b.	Read a character from the keyboard.                                                              [05%]
; c.	Identify the character type and print a message as given below :                  [15%]
; •	“ This is an Uppercase Letter !!! “.
; •	“ This is a Lowercase Letter !!!  “.
; •	“ Wrong Input !!!“.
; d.	If the user input is a letter then print it corresponding 
;uppercase/lowercase letter.
;Sample output :
;ASCII value 
;A=65 to Z=90
; a=97 to z=122

.model small
.stack 100h

.data
	Uc db "Uppercase alphabet $"
	Lc db "Lowercase alphabet $"
	msg3 db "Enter character: $"
	msg4 db "This is a Lowercase Letter !!! $"
	msg5 db "This is a Uppercase Letter !!! $"
	msg6 db "wrong Input !!! $"
	msg7 db "The Lowercase Letter  of your input is : $"
    msg8 db "The Uppercase Letter  of your input is : $"
	letterC db 0
	letterS db 0
	input1 db 0
	 db 0
	
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset Uc
	mov ah,09h
	int 21h
	
	call newLine
	mov dl,10
	mov ah,02h
	int 21h
	
	mov cl,26
	mov bl,65
	
	lstart:
		mov al,bl
		mov letterC,al
		
		mov dl,letterC
		mov ah,02h
		int 21h
		
		mov dl,' '
		mov ah,02h
		int 21h
		
		inc bl
		loop lstart
		
	mov dl,10
	mov ah,02h
	int 21h
		
	mov dx,offset Lc
	mov ah,09h
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov cl,26
	mov bl,97
	
	lostart:
		mov al,bl
		mov letterS,al
		
		mov dl,letterS
		mov ah,02h
		int 21h
		
		mov dl,' '
		mov ah,02h
		int 21h
		
		inc bl
		loop lostart
		
		
		;enter the character
		
		call newLine
		
		mov dx,offset msg3
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h
		
		mov input1,al
		cmp input1,65
			jge check1
			jl check3
			
		check1:
			cmp input1,90
			jg check2
			
			;else part
			call newLine
			
			mov dx,offset msg5
			mov ah,09h
			int 21h
			
			call newLine
			
			mov dx,offset msg7
			mov ah,09h
			int 21h
			
			sub input1,48
			mov dl,input1
			add dl,32
			add dl,48
			mov ah,02h
			int 21h
			
			jmp endn
			
			check2:
				cmp input1,97
					jge check4
					jl check3
					
				check4:
					cmp input1,122
						jg check3
						
					call newLine
					;else part
					
					mov dx,offset msg4
					mov ah,09h
					int 21h
					
					call newLine
					
					mov dx,offset msg8
					mov ah,09h
					int 21h
					
					sub input1,48
					mov dl,input1
					sub dl,32
					add dl,48
					mov ah,02h
					int 21h
					
					jmp endn
					
			check3:
			call newLine
			
			mov dx,offset msg6
			mov ah,09h
			int 21h
			
			jmp endn
			
			endn:
		
		mov ax,4c00h
		int 21h
		
		proc newLine
			mov dl,10
			mov ah,02h
			int 21h
		ret
		endp
		
end
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
