.model small
.stack 100h
.data

	msg1 db "Enter the first number  : $"
	msg2 db "Enter the second number : $"
	msg3 db "Addition is             : $"
	msg4 db "Subtraction is          : $"
	msg5 db "Multiplication is       : $"
	msg6 db "Division quotient  is   : $"
	msg7 db "Division reminder is    : $"
	n1 db 0
	n2 db 0
	r db ?
	
	
.code
start:
	mov ax,@data ;ax - assembly defualt register 
	mov ds,ax    ;ds - data segment register
		
	;FIRST NUM   
	mov dx,offset msg1  ;dx for only string input
	mov ah,09h          ;09h - string function
	int 21h
		
	mov ah,01h  ;01h - keyboard function  nl=3
	int 21h     ;print al=48+3=51
	mov dl,al   ;al moving to dl register al->dl=51
	sub dl,48   ;dl=dl-48=51-48=3
	mov n1,dl	;n1=3
		
	mov dl,0ah 	;next line function
	mov ah,02h 	;Enter
	int 21h
		
	;SECOND NUM
	mov dx,offset msg2 
	mov ah,09h
	int 21h
		
	mov ah,01h  ;n2=2
	int 21h     ;al=48+2=50
	mov dl,al	;dl=50
	sub dl,48	;dl=dl-48=50-48
	mov n2,dl   ;n2=2
	
	mov dl,0ah 	;next line
	mov ah,02h 	;Enter
	int 21h
		
		
	;ADDITION
	mov dx,offset msg3 
	mov ah,09h
	int 21h
		
	mov dl,n1   ;n1=3 dl=3
	add dl,n2	;dl=dl+n2=3+2=5	
	add dl,48   ;dl=dl+48=5+48=53
	mov ah,02h
	int 21h
		
	mov dl,0ah 	;next line
	mov ah,02h 	;Enter
	int 21h
	
		
	;SUBTRACTION
	mov dx,offset msg4
	mov ah,09h
	int 21h
		
	mov dl,n1	;n1=3 dl=3
	sub dl,n2	;dl=dl-n2=3-2=1
	add dl,48	;dl=dl+48=1+48=49
	mov ah,02h	;output function
	int 21h     ;print output 
		
	mov dl,0ah 	;next line
	mov ah,02h 	;Enter
	int 21h
		
		
	;MULTIPLICATION
	mov dx,offset msg5
	mov ah,09h
	int 21h
		
	mov al,n1
	mul n2
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
		
	mov dl,0ah 	;next line
	mov ah,02h 	;Enter
	int 21h
		
		
		
	;DIVISION QUOTIENT		
	mov dx,offset msg6
	mov ah,09h
	int 21h
		
	mov ah,00	;clearing data
	mov al,n1   ;store n1=3 in al register al=3 
	div n2      ;al=al/n2=3/2=1
	mov r,ah	;r=1
	
	mov dl,al   ;al=1 dl=1
	add dl,48	;dl=dl+48=1+48=49
	mov ah,02h
	int 21h
		
	mov dl,0ah 	;next line
	mov ah,02h 	;Enter
	int 21h
		
		
		
	;DIVISION REMINDER
	mov dx,offset msg6
	mov ah,09h
	int 21h
		
	mov dl,r	;r=1 dl=1
	add dl,48	;dl=dl+48=1+48=49
	mov ah,02h
	int 21h
		
	mov dl,0ah 	;next line
	mov ah,02h 	;Enter
	int 21h
		
	mov ax,4c00h
	int 21h


end start
		
		
		
		