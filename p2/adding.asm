; NAME		Saif Hasan
; Assignment	Program 2 : Adding Integers
; Date		October 6, 2021
; Etc...	Sleeping is good.

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ


SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.
mov AX, 0A987h
mov BX, AX
add AX, BX
mov AX, 0ABCDh
mov BX, 0EF01h
add AX, BX
mov AX, 0FAFAh
mov BX, 0505h
add AX, BX
mov AX, 80F0h
mov BX, 0FF00h
add AX, BX
mov AX, 2468h
mov BX, 0DB98h
add AX, BX
mov AX, 000Fh
mov BX, 7FF1h
add AX, BX
mov AX, 1234h
mov BX, 7654h
add AX, BX
mov AX, 0B0Bh
mov BX, 0A11Eh
add AX, BX
mov AX, 7654h
mov BX, 789Ah
add AX, BX
mov AX, 8000h
mov BX, AX
add AX, BX


; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
