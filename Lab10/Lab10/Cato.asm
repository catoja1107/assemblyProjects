;fidn largest in array, store as MAXIMUM
.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data 
	Array WORD 10, 2, 23, 45, 21, 11
	MAXIMUM WORD ?

.code
main PROC
	mov esi, OFFSET Array
	mov ecx,3 ; set loop counter to 3
	
	START_LOOP:
	mov eax,[esi]
	mov ebx,[esi+2]

	cmp ax,bx
	jg IF_BLOCK ; if array[0]>array[1] jump to IF_BLOCK
	jle ELSE_BLOCK
	
	IF_BLOCK:
		mov MAXIMUM,ax
	jmp next

	ELSE_BLOCK:
		mov MAXIMUM,bx
	next:
	add esi,2
	loop START_LOOP


	INVOKE ExitProcess, 0
main ENDP
END main