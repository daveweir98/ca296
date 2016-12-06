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
RPN			DWORD	0
y			DWORD	0
i			DWORD	0

.code
	main:nop

		invoke version
		
		mov eax, 0
		invoke readRPN
		mov ecx, [eax]

	loopy:
		
		cmp cl, 0
		je exity

		cmp cl, 43
		je subby 

		cmp cl, 45
		je addy

		sub cl, 48

		mov eax, 0
		mov al, cl

		push eax

		add cl, 48
		inc ecx
		jmp loopy

	addy:
		pop eax
		pop ebx
		add bl, al

		mov eax, 0
		mov al, bl

		push ebx
		inc ecx
		jmp loopy

	subby:
		pop eax
		pop ebx
		sub bl, al

		mov eax, 0
		mov al, bl

		push eax
		inc ecx
		jmp loopy

	exity:
		pop eax
		invoke writeInteger, al
		invoke ExitProcess,0

	end main
