.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF	total:near

.code
	total:
		push ebp
		mov ebp, esp
		
		mov eax, [ebp+8]
		mov ebx, [ebp+16]
		mov ecx, 0
		mov [ebp-4], ecx

	loopy:

		cmp ecx, [ebp+20]
		je exity
		mov edx, [ebx]
		shl edx, 2
		add edx, eax
		mov edx, [edx]
		add [ebp-4], edx
		add ebx, 4
		inc ecx
		jmp loopy


	exity:
		mov eax, [ebp-4]
		pop ebp
		ret 12

	end