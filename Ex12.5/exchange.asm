.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF	exchange:near

.code
	exchange:

		push ebp
		mov ebp, esp

		mov eax, [ebp+8]
		mov ebx, [ebp+12]
		mov ecx, [eax]
		mov edx, [ebx]
		
		mov [eax], edx
		mov [ebx], ecx

		pop ebp
		ret 8
	end