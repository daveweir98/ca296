.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF	count:near

.data
a		DWORD	3 DUP(0)

.code
	count:
		push ebp
		mov ebp, esp
		mov eax, 0

	loopy:
		cmp[ebp+12], eax
		je exity

		mov ebx, [ebp+8]
		shl eax, 2
		add ebx, eax
		mov ebx, [ebx]

		shr eax, 2
		inc eax

		cmp ebx, 0
		jl negative
		je zero
		jg positive

	negative:
		inc [a]
		jmp loopy

	zero:
		inc [a+4]
		jmp loopy

	positive:
		inc [a+8]
		jmp loopy

	exity:
		mov eax, offset a

		pop ebx
		ret 8

	end count