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
		add x, eax
		invoke readInteger
		add x, eax
		invoke writeInteger,x

		; The following invoke displays a message box so
		; that you can see the ouput from your program before
		; it teminates and closes the command window.
		;
		; In general, you should remove this after debugging your 
		; program and in particular, YOU SHOULD ALWAYS REMOVE IT 
		; BEFORE SUBMITTING CODE FOR A LAB EXAM.
		;

		invoke MessageBox,0,ADDR message,ADDR caption,MB_OK


		invoke ExitProcess,0

	end main
