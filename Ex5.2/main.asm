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
i			DWORD	1
total		DWORD	1
prev		DWORD	0
prevtotal	DWORD	0

.code
	main:nop

		invoke version
		
	loopy:
		inc prev
		inc i
		mov eax, total
		mov prevtotal, eax
		mov ebx, i
		mul ebx
		mov total, eax 
		cmp edx, 0
		je loopy

		invoke writeInteger, prev
		invoke writeInteger, prevtotal

		invoke ExitProcess,0

	end main
