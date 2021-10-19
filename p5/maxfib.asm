; Namme         Saif Hasan
; CSC 322       20 October 2021
; Assignment    Program 5 : Max Fibonacci
; Description   This program calculates the largest, unsigned fibonacci number that can fit into a double word on our machine.

SECTION .data


SECTION .bss
MaxFib:	  RESD 1
FibCount: RESW 1 


SECTION .text
global _main
_main:

; put first two values (0, 1) into 2 registers to start off
mov eax, 0
mov ebx, 1
mov word [FibCount], 2 ;;start with 2 since we hard code the first 2 numbers of the sequence
                       ;; note that this is the count and not the n value

startLoop:
  mov ecx, eax
  add ecx, ebx
  jc maxFound
  mov eax, ebx
  mov ebx, ecx
  inc word [FibCount]
  jmp startLoop

maxFound: ;; when we find the max fibonacci number of double size
  mov [MaxFib], ebx

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
