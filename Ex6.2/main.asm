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
x			DWORD	10 DUP(0)
i			DWORD	0
total		DWORD	0

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, addr x,10, 32
		mov ebx, 0
	loopy:
		cmp i, 10
		je exity
		mov eax, 4
		mul i
		add eax, offset x
		add ebx, [eax]
		mov total, ebx
		inc i
		jmp loopy
		


	exity:
		invoke writeInteger, total
		invoke ExitProcess,0

	end main
