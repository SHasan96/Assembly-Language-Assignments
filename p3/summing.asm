; Name		Saif Hasan
; CSC 322	11 October 2021
; Assignment	Program 3 : Summing Arrays
; Description	The program sums three different arrays of signed integers, and calculates a grand total of all three sums.

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
bArray:		DB		-10,20,-30,40,-50
wArray:		DW		100,101,102,103,104
dArray:		DD		322,322h,322q,1833,1833h
bArraySum:	DB		0
wArraySum:	DW		0
dArraySum:	DD		0
grandTotal:	DD		0


SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:
; put your code here
mov ah, [bArray]
add ah, [bArray+1]
add ah, [bArray+2]
add ah, [bArray+3]
add ah, [bArray+4]
add [bArraySum], ah

mov ax, [wArray]
add ax, [wArray+2]
add ax, [wArray+4]
add ax, [wArray+6]
add ax, [wArray+8]
add [wArraySum], ax

mov eax, [dArray]
add eax, [dArray+4] 
add eax, [dArray+8]
add eax, [dArray+12]
add eax, [dArray+16]
add [dArraySum], eax

;;calculating the grand total
movsx ebx, byte [bArraySum] ;;moving bArraySum into a dword register
movsx ecx, word [wArraySum] ;;moving wArraySum into a dword register
mov edx, [dArraySum]
break1: 

add ebx, ecx
add ebx, edx
add [grandTotal], ebx

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
