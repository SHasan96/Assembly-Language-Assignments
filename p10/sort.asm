;Name		Saif Hasan
;Date		3  December 2021
;Assignment	Program 10 : Sort Array
;Description	The program prints a given array (with word sized unsigned integers), sorts the array in ascending order and then prints the sorted array

;;;macro for printing
%macro print 2
   pusha
   mov eax, 4
   mov ebx, 1
   mov ecx, %1
   mov edx, %2
   int 80h
   popa
%endmacro


SECTION .data
nums:	   dw	 2000, 3000, 0, 65535, 0, 1, 2, 3, 100
numslen:   EQU	 ($-nums)

;;;;;;;;;;;;;;extra data
;first header
h1:     db "Original Array", 10, 0
h1len:  equ ($ - h1)

;second header
h2:    db "Sorted Array", 10, 0
h2len: equ ($ - h2)

;carriage return character
cr:  db 0ah

;clear screen control characters
cls:     db      1bh, '[2J'
clsLen:  equ     ($-cls)

;cursor position control characters
pos0    db      1bh, '['
        db      '0'
        db      ';'
        db      '0'
        db      'H'

;print field to store the string
printfield:   db  ""		;for each number we will use 6 characters (5 digits then a space)

SECTION .text
global _main, _sort, _toString
_main:
print cls, clsLen	;clearing the screen
print pos0, 6           ;moving the cursor to the original position
print h1, h1len		;printing first header


;calling toString which will convert array numbers into string 
test2:
mov edx, 0
mov ecx, numslen/2
original:
  push edx
  push nums
  call _toString
  add esp, 8
  print printfield, 6
  add edx, 2
loop original

;we want to call a function with 2 parameters 
;calling sort
push numslen/2		;size is word(2 bytes), so divide by 2
push nums
call _sort
add esp, 8

;now we will print the sorted array in a similar fashion  		              

lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;sort in ascending order
_sort:
push ebp
mov ebp, esp
push ebx
mov edx, 0		;offset
mov esi, [ebp+8]	;array pointer
mov ecx, [ebp+12]       ;array length
dec ecx
mov edx, 0

outer:
  push ecx
  inner:
    mov ax, word[esi+edx]
    mov bx, word[esi+edx+2]
    cmp ax, bx
    ja swap
    jmp next
    swap:
      xchg ax, bx
      mov word[esi+edx], ax
      mov word[esi+edx+2], bx
    next:
      add edx, 2
  loop inner
  pop ecx
  mov edx, 0
loop outer

pop ebx
pop ebp
ret

;;;;;;;;;;;;;;;;;function to convert integers into a string for printing 
_toString:
push ebp
mov ebp, esp
push ebx
mov esi, [ebp+8]	;array pointer
mov edi, [ebp+12]
  ;get the 1st digit from the right (1th place digit)
  xor   ax, ax
  mov   ax, word[esi+edi]       ;the dividend in ax  ;i dont understand why i can't traverse through the array this way
  mov   bl, 10		        ;the divisor in bl
  div   bl			;number in ax/10
  add   ah, '0'
  mov	byte[printfield+4], ah
  ;get 10th place digit
  movzx ax, al                
  div   bl                      
  add   ah, '0'
  mov   byte[printfield+3], ah
  ;get 100th place digit
  movzx ax, al
  div   bl
  add   ah, '0'
  mov   byte[printfield+2], ah
  ;get 1000th place digit
  movzx ax, al
  div   bl
  add   ah, '0'
  mov   byte[printfield+1], ah
  ;get 10000th place digit
  movzx ax, al
  div   bl
  add   ah, '0'
  mov   byte[printfield], ah
  ;put space
  mov   byte[printfield+5], 0Ah
pop ebx
pop ebp
ret
