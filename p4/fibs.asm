; Namme         Saif Hasan
; CSC 322       15 October 2021
; Assignment    Program 4 : Fibonacci Sequence
; Description   This program will calculate and store the first 16 numbers in the Fibonacci sequence.

SECTION .data
c:  dd 2


SECTION .bss
Fibs:	RESD 16


SECTION .text
global _main
_main:

; put first two values (0, 1) into Fibs array
mov eax, 0
mov ebx, 1
mov [Fibs], eax
mov [Fibs+4], ebx
mov edx, 8 ; edx will contain the offset which acts as index number for the array

startLoop:
cmp dword [c], 16
je lastBreak
mov ecx, eax
add ecx, ebx
mov [Fibs + edx], ecx
mov eax, ebx
mov ebx, ecx
add edx, 4
inc dword [c]
jmp startLoop


lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
