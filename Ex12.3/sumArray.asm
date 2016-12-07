.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF	sumArray:near

.code
	sumArray:
		push ebp
		mov ebp, esp

		mov edx, 0 ;total
		mov eax, 0
		mov [ebp-4], eax  ;index
		mov ebx, [ebp+8]

	loopy:
		mov ecx, [ebp-4]
		cmp ecx, [ebp+12]
		je exity
		invoke map,DWORD PTR [ebx]
		add edx, eax
		inc ecx
		add ebx, 4
		mov [ebp-4], ecx
		jmp loopy

	exity:
		mov eax, edx
		pop ebp
		ret 8


	end 