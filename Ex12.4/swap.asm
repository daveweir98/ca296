.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF	swap:near

.code
	swap:
		push ebp
		mov ebp, esp

		mov eax, [ebp+8]
		mov ebx, [ebp+12]
		mov ecx, [ebp+16]
		mov edx, [ebp+20]

		shl ebx, 2
		shl ecx, 2

		add ebx, eax
		add ecx, eax

		mov ebx, [ebx]
		mov ecx, [ecx]

		mov [ebp-4], ebx
		mov [ebp-8], ecx

		cmp ebx, ecx
		jl swappy
		jmp exity

	swappy:
		mov ebx, [ebp+12]
		shl ebx, 2
		mov ecx, [ebp-8]
		mov [eax+ebx], ecx

		mov ecx, [ebp+16]
		shl ecx, 2
		mov ebx, [ebp-4]
		mov [eax+ecx], ebx

	exity:
		pop ebp 
		ret 16

	end