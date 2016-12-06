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
i			DWORD	0
count		DWORD	0
amount		DWORD	0
tmp			DWORD	0

.code
	main:nop

		invoke version
		invoke readInteger
		jmp loopy

	ready:
		mov count, 0
		invoke readInteger
		cmp eax, 0
		jl exity
	
	loopy:
		mov i, esp
		mov ebx, count
		add i, ebx
		mov ecx, i
		cmp [ecx], eax
		je ready
		cmp i, ebp
		je addy 
		add count, 4
		jmp loopy

	addy:
		push eax 
		inc amount
		jmp ready

		
	exity: 
		dec amount
		mov eax, 0
		pop eax
		invoke writeInteger, eax
		cmp amount, 0
		jne exity
		invoke ExitProcess,0

	end main
