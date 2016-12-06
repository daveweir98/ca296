.586
.model flat,stdcall
.stack 4096
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF fib_i:near

.data
i		DWORD	1
tmp1	DWORD	1
tmp2	DWORD	1

.code
	fib_i:
		mov eax, [esp+4]
		cmp i, eax
		je exity

		mov eax, tmp1
		mov ebx, tmp1
		add eax, tmp2
		mov tmp2, ebx
		mov tmp1, eax

		inc i 
		jmp fib_i

	exity:
		mov eax, tmp1
		ret 4
	
	end fib_i