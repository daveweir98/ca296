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
idx			DWORD	1
total		DWORD	0
msg			BYTE	"%d! = %d", 10

.code
	main:nop

		invoke version
		invoke readInteger
		mov n, eax
		cmp eax, 0
		je endy
		mov total, eax 

	loopy:
		mov eax, idx
		cmp eax, n
		je endy
		mov eax, idx
		mul total
		mov total, eax
		inc idx
		jmp loopy

	endy:
		invoke crt_printf, addr msg, n, total
		invoke ExitProcess,0

	end main
