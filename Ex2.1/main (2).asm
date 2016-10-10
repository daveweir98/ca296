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
message     BYTE	'Press OK to continue',0
caption     BYTE	'Welcome to CA296',0

.code
	main:nop

		invoke version
		invoke readInteger
		mov	x, eax
		invoke readInteger
		mov y, eax
		mov eax, x
		cmp eax, y
		jg greater
		jl lesser

	greater:
		invoke writeInteger, x

		invoke ExitProcess, 0

	lesser:
		invoke writeInteger, y

		invoke ExitProcess, 0

		invoke MessageBox,0,ADDR message,ADDR caption,MB_OK




	end main
