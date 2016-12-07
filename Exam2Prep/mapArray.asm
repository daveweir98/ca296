.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF	mapArray:near

.code 
	mapArray:

		push ebp
		mov ebp, esp

		mov edx, [ebp+8]
		mov ebx, [ebp+12]
		mov ecx, 0
		mov [ebp-4], ecx
		mov [ebp-8], ecx

	loopy:
		cmp ecx, [ebp+16]
		je exity

		invoke convert, DWORD PTR [edx]
		mov [ebx], eax
		
		add edx, 4
		add ebx, 4

		inc ecx
		jmp loopy

	exity:
		pop ebp
		ret 12


	end