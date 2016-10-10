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
idx			DWORD	0
message     BYTE	'Press OK to continue',0
caption     BYTE	'Welcome to CA296',0

.code
	main:nop

		invoke version

	start:
		invoke readInteger
		mov idx, 0
		mov n, eax
		cmp eax, 0
		jl exit
		je start
		jg loopy

	loopy:
		invoke writeInteger, idx
		inc idx
		mov eax, n
		cmp eax, idx
		ja loopy
		je start

	exit:
		invoke MessageBox,0,ADDR message,ADDR caption,MB_OK


		invoke ExitProcess,0

	end main
