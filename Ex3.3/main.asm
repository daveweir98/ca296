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
per			DWORD	37
char		DWORD	32
y			DWORD	128
idx			DWORD	0
new_line	DWORD	10
message     BYTE	'Press OK to continue',0
caption     BYTE	'Welcome to CA296',0

.code
	main:nop

		invoke version
	loopy:
		inc idx
		cmp idx, 16
		jg iffy

		invoke crt_printf, addr char

		inc char
		mov eax, char
		cmp y, eax
		ja loopy

		invoke crt_printf, addr new_line
		invoke MessageBox,0,ADDR message,ADDR caption,MB_OK


		invoke ExitProcess,0

	iffy:
		mov idx, 0
		invoke crt_printf, addr new_line
		jmp loopy

	end main
