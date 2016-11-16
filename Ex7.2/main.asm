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
total		DWORD	0
i			DWORD	0
N			DWORD	0
x			DWORD	0

.code
	main:nop

		invoke version
		
		invoke readInteger
		mov N, eax
		invoke fillWithRandomValues, addr x, N, 100
		invoke writeArray, addr x, N
		mov ebx, 0

	loopy:
		mov eax, N
		cmp i, eax
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
