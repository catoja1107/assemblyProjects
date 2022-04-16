COMMENT @
Student: James Cato
 Class: CSC3210
 Assignment#: 3
 Description: This program performs arithmetic and comparisons on 4 vars
 @

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
var1 DWORD 10
var2 DWORD 11
var3 DWORD 12

.code
main PROC
	mov eax,var1
	mov ebx,var2
	mov ecx,var3
	
	IF_BLOCK: ; if ((var1>var2)||(var3<var2))
		cmp eax, ebx
		jle isfalse
		jg istrue

		isfalse:
		cmp ecx, ebx
		jge ELSE_BLOCK

		istrue:
		mov eax,0
		add eax,ebx
		add eax,ecx
		mov var1,eax ;var1=var2+var3
		inc ebx
		inc ecx
		mov var2,ebx
		mov var3,ecx ;var2++ var3++
		jmp END_BLOCK

		ELSE_BLOCK: ; var1-- var2-- var3--
		DEC eax
		DEC ebx
		DEC ecx
		mov var1,eax
		mov var2,ebx
		mov var3,ecx

	END_BLOCK:

	INVOKE ExitProcess, 0
main ENDP
END main