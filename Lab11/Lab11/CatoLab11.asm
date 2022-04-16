COMMENT @
Student: James Cato
 Class: CSC3210
 Assignment#: Lab11
 Description: This program is various nested loops to add 
				even elements of array array_list[] to var 
				sum until requirements are met
 @

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array_list BYTE 10,11,13,18,21,23,24,17,45
array_size BYTE ($-array_list) 
current_size BYTE ($-array_list)-1
index	   BYTE 0 ; index for WHILE_BLOCK
sum		   BYTE 0

.code
main PROC
	mov cl,array_size ; (loops for array size)
	mov esi,OFFSET array_list ; array_list[index] return
	mov ah,index
	mov al,current_size

	FOR_BLOCK:   ;traverse array from array_size-1 to 0. index begins at 0
	cmp al,0 ; (current_size>0)
	jle END_BLOCK 

	WHILE_BLOCK: ; while(index < current_size/al REG)
	cmp ah,al
	jge next

	IF_BLOCK: ; if(array_list[index] % 2==0)
	mov ebx,[esi]
	and bl,1 ; bit check for modulo 2 (is even).   0010b
	cmp bl,0
	jne ELSE_BLOCK
	mov bl,sum
	add ebx,[esi]
	mov sum,bl

	ELSE_BLOCK:
	INC ah			; var index += 1
	mov index,ah
	INC esi       ; actual index counter, byte traverse. why? foo{}
	loop WHILE_BLOCK

	next:
	DEC al				; current_size-- in FOR_BLOCK
	mov current_size,al
	loop FOR_BLOCK
	
	END_BLOCK:
	INVOKE ExitProcess, 0
main ENDP
END main