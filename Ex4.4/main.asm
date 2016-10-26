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
n1			DWORD	32
idx			DWORD	0
patternmsg	BYTE	"Please input a pattern", 00


.code
	main:nop

		invoke version
		invoke readIntegerWithMessage, addr patternmsg
		invoke setPattern, eax
		
	l0:
		mov n1, 0
		cmp idx, 32
		je exit
		inc idx

	l1:
		invoke readRow, n1
		shl eax,1
		invoke writeRow, n1, eax
		inc n1
		cmp n1, 32
		jl l1
		invoke Sleep, 500
		je l0


		;invoke MessageBox,0,ADDR message,ADDR caption,MB_OK

	exit:
		invoke ExitProcess,0

	end main
