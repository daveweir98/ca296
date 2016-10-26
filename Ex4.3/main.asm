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
idx			DWORD	0
n1			DWORD	0
n2			DWORD	1
patternmsg	BYTE	"Please input a pattern", 0

.code
	main:nop

		invoke version
		invoke readIntegerWithMessage, addr patternmsg
		invoke setPattern, eax

	l0:
		mov n1, 0
		mov n2, 1
		cmp idx, 32
		je exit
		inc idx

	l1:
		invoke readRow, n2
		invoke writeRow, n1, eax
		inc n1
		inc n2
		cmp n1, 32
		jl l1
		invoke Sleep, 500
		je l0

		
	exit:
		invoke ExitProcess,0

	end main
