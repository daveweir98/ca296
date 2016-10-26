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
tmp			DWORD	0
m			DWORD	00018000h
patternmsg	BYTE	"Please input a pattern", 0
xmsg		BYTE	"Please input an X coordinate", 0
ymsg		BYTE	"Please input an Y coordinate", 0

.code
	main:nop

		invoke version
		invoke readIntegerWithMessage, addr patternmsg
		mov tmp, eax
		invoke readIntegerWithMessage, addr xmsg
		mov x, eax
		invoke readIntegerWithMessage, addr ymsg
		mov y, eax
		invoke setPattern, tmp

	l0:	invoke readRow, y
		mov ecx, x
		mov ebx, 1
		shl ebx,cl
		xor eax, ebx
		invoke writeRow, y, eax
		invoke Sleep, 500
		jmp l0


		;invoke ExitProcess,0

	end main
