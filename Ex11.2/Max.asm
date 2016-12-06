.586
.model flat,stdcall
.stack 4096
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF Max:near

.data

.code
	Max:
		
		mov ebx, [esp+4]
		cmp [esp+8], ebx
		jge x
		jmp y

	x:
		mov eax, [esp+8]
		ret 8
	y:
		mov eax, [esp+4]
		ret 8

	end Max