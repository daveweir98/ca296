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
min			DWORD	33
minad		DWORD	0
first		DWORD	0
tmp			DWORD	0
j			DWORD	0

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, addr x, 10, 32
		invoke writeArray, addr x, 10
		mov first, offset x

	loopy1:
		mov ebx, 0
		cmp i, 10
		je swap
		mov eax, 4
		mul i
		add eax, offset x
		add ebx, [eax]
		cmp ebx, min
		jl change
		inc i
		jmp loopy1

	change:
		mov min, ebx
		mov minad, eax
		inc i
		jmp loopy1

	swap:
		cmp j, 10
		je exity

		mov ebx, [first]
		mov eax, [ebx]
		mov tmp, eax

		mov eax, min
		mov [ebx], eax

		mov eax, tmp
		mov ebx, minad
		mov [ebx], eax
		
		add first, 4

		inc j

		mov eax, j
		mov i, eax
		mov min, 33

		jmp loopy1


	exity:
		invoke writeArray, addr x, 10
		invoke ExitProcess,0

	end main
