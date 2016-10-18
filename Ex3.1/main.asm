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
x			DWORD	0
y			DWORD	1
message     BYTE	'Press OK to continue',0
caption     BYTE	'Welcome to CA296',0
my_msg		BYTE	'fib(%d) = %d',10,0

.code
	main:nop

		invoke version
		invoke readInteger
		mov n, eax

	loopy:
		mov eax, x
		add eax, y
		mov ebx, eax
		mov eax, y
		mov x, eax
		mov y, ebx

		inc idx
		mov eax, n
		cmp eax, idx
		ja loopy		 

		invoke crt_printf, addr my_msg, n, y

		invoke MessageBox,0,ADDR message,ADDR caption,MB_OK


		invoke ExitProcess,0

	end main
