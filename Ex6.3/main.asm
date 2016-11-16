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
max			DWORD	0
msg			BYTE	"Maximum Value = %d", 10

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, addr x, 10, 32
		invoke writeArray, addr x, 10

	loopy:
		mov ebx, 0
		cmp i, 10
		je exity
		mov eax, 4
		mul i
		add eax, offset x
		add ebx, [eax]
		cmp ebx, max
		jg change
		inc i
		jmp loopy

	change:
		mov max, ebx
		inc i
		jmp loopy

	exity:
		invoke crt_printf, addr msg, max
		invoke ExitProcess,0

	end main
