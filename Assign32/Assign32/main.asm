COMMENT @
Student: James Cato
 Class: CSC3210
 Assignment#: 3
 Description: This program splits a QWORD into 4 WORDS
@

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode:DWORD

.data
superDuperVarNameForMundaneProgram QWORD 0506030704080102h
w1 WORD ?
w2 WORD ?
w3 WORD ?
w4 WORD ?

.code
main PROC
	mov ax,WORD PTR superDuperVarNameForMundaneProgram ;splits 1/4 LSB to MSB
	mov bx,WORD PTR superDuperVarNameForMundaneProgram+2 ; splits 2/4
	mov cx,WORD PTR superDuperVarNameForMundaneProgram+4 ;splits 3/4
	mov dx,WORD PTR superDuperVarNameForMundaneProgram+6 ; splits 4/4
	
	mov w1,ax ;these move the split WORDs to variables for screenshot purpose in mem window
	mov w2,bx
	mov w3,cx
	mov w4,dx

	add cx,dx
	add bx,cx
	add ax,bx ;ax=D17 :)
	INVOKE ExitProcess, 0
main ENDP
END main