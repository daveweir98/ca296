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
x			DWORD	0
y			DWORD	0
i			DWORD	100000
message     BYTE	'Press OK to continue',0
caption     BYTE	'Welcome to CA296',0

.code
	main:nop
	l0:	mov eax, i
		cmp eax, 0
		je l1
		sub eax, 1
		mov i, eax

		invoke random, 32
		mov x, eax
		invoke random, 32
		mov y, eax
		invoke readRow, y
		mov ecx, x
		mov ebx, 1
		shl ebx, cl
		or eax, ebx
		invoke writeRow, y, eax
		jmp l0

	l1:	invoke setScreenSize, 120, 120


		invoke ExitProcess,0

	end main
