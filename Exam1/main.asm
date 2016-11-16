;
; CA296 Console Template
; Version 1
;

;
; Preamble
;

.586
.model flat,stdcall
.stack 4096
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

.data
n			DWORD	0
m			DWORD	0
y			DWORD	0
thirtytwo	DWORD	32
msg			BYTE	"Please input a column to clear"

.code
	main:nop

		invoke version
		invoke readIntegerWithMessage, addr msg
		inc eax
		mov n, eax
		sub thirtytwo, eax
		mov eax, thirtytwo
		mov m, eax
		dec n
		invoke setPattern, 7
		
	loopy:
		cmp y, 32
		je exity
		invoke readRow, y

		mov ebx, eax

		mov ecx, n
		shr eax, CL
		shl eax, CL

		mov ecx, m
		shl ebx, CL
		shr ebx, CL

		xor eax, ebx

		invoke writeRow, y, eax
		invoke Sleep, 225

		inc y
		jmp loopy


	exity:
		invoke ExitProcess, 0

	end main
