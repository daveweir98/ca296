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
x			DWORD	10, -10, 2, 5, -6
y			DWORD	1,3,4

EXTERNDEF	total:near

.code
	main:nop

		invoke version
		
		push 3
		push offset y
		push 5
		push offset x
		call total

		invoke writeInteger, eax

		invoke ExitProcess,0

	end main
