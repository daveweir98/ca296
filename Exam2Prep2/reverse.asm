.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF	reverse:near

.code
	reverse:
		push ebp
		mov ebp, esp

		mov eax, [ebp+8]
		mov ebx, [ebp+12]
		shl ebx, 2
		add ebx, eax
		sub ebx, 4
		
	loopy:
		cmp ebx, eax
		jl exity

		mov edx, [eax]
		mov ecx, [ebx]

		mov [eax], ecx
		mov [ebx], edx

		sub ebx, 4
		add eax, 4

		jmp loopy

	exity:
		pop ebp
		ret 8
	

	end