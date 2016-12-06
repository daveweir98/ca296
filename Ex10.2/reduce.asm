;
; Preamble
;

.586
.model flat,stdcall
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

EXTERNDEF reduce:near

.data
x	DWORD	0

.code
	reduce:
		mov eax, DWORD PTR[ebp-12]
		mov x, eax
		cmp x, 0
		je lumpy
		invoke writeInteger, x
		dec x
		mov eax, x
		mov DWORD PTR[ebp-12], eax
		call reduce
	lumpy:
		ret 
	end reduce 