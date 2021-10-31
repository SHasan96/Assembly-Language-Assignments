; Name          Saif Hasan
; CSC 322       1 November 2021
; Assignment    Program 6 : Matrix Management
; Description   This program calculates the sums of each row, each column and grand total of all the elements in an arbritrarily defined matrix


ROWS:      EQU  5;3      
COLS:      EQU  7;2   

;;; the code should work for every matrix if the ROWS and COLS are redefined accordingly, as long as the element in the matrix are word size
;;; even if the elements are not word size, simple adjustments can make sure that it will work for other data sizes as well
SECTION .data
;;;TestCase1
;MyMatrix:       dw      1,   2
;                dw      4,  -2
;                dw     -10,  8

;;;TextCase2
MyMatrix: 	dw	 1,  2,  3,  4,  5,  6,  7
	    	dw	 8,  9, 10, 11, 12, 13, 14
		dw	15, 16, 17, 18, 19, 20, 21
		dw	22, 23, 24, 25, 26, 27, 28
		dw	29, 30, 31, 32, 33, 34, 35


SECTION .bss
RowSums:	RESW ROWS
ColSums:	RESW COLS
Sum:		RESW 1

;extra variables that I used
saveECX:	RESD 1
colCount:       RESD 1 		       ;this is used to keep track of the columns when finding ColSums

SECTION .text
global _main
_main:

;let's find row sums first
mov edx, 0
mov ebx, 0

mov ecx, ROWS 
outer1:
   mov dword [saveECX], ecx
   mov ax, 0
   mov ecx, COLS 			 ;no. of cols is elements of the row 

   inner1:
     add ax, [MyMatrix + edx]   
     add edx, 2 			 ;add 2 because data size is word (2 bytes)
   loop inner1
   mov ecx, [saveECX]
   mov word[RowSums + ebx], ax
   add ebx, 2
loop outer1

rowsDone:


xor ecx, ecx
;now for column sums
mov edx, 0
mov ebx, 0

mov dword [colCount], 0
mov ecx, COLS
outer2:
   mov dword [saveECX], ecx
   mov ax, 0
   mov ecx, ROWS                         ;no. of rows is elements of the column

   inner2:
     add ax, [MyMatrix + edx]
     add edx, COLS*2                      
   loop inner2

   add dword [colCount], 2
   mov edx, [colCount]		 	  ;every time a column sum is found we move to the next column
   mov ecx, [saveECX]
   mov word[ColSums + ebx], ax
   add ebx, 2
loop outer2

colsDone:

xor ecx, ecx
;total sum can simply be found from summing up RowSums (or ColSums)
mov edx, 0
mov ax, 0
mov ecx, ROWS
sumUp:
  add ax, [RowSums + edx]
  add edx, 2
loop sumUp
mov word[Sum], ax

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
