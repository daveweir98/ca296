.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

.data
one		DWORD	1

.code
	sum:

		push ebp
		mov ebp, esp
		mov eax, 0
		mov [ebp-4], eax

	loopy:
		mov ecx, [ebp-4]
		cmp [ebp+12], ecx
		je exity

		mov ebx, [ebp+8]
		mov ecx, [ebp-4]
		shl ecx, 2
		add ebx, ecx
		mov ebx, [ebx]

		add eax, ebx
		shr ecx, 2

		inc ecx
		mov [ebp-4], ecx
		jmp loopy


	exity:
		pop ebp
		ret 8
		

	end sum