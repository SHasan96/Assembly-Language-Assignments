;Name		Saif Hasan
;Date		12 November 2021
;Assignment	Program 8 : Reverse Array with Macros
;Description	The program name is self explanatory! 

%macro revArray 2
 pusha
 ;push array elements into stack
 mov ebx, 0
 mov ecx, %2/4
 %%top1:
 mov edx, [%1 + ebx]
 push edx
 add ebx, 4
 loop %%top1
 ;pop array elements and place them back into array
 mov ebx, 0
 mov ecx, %2/4
 %%top2:
 pop edx
 mov dword[%1 + ebx], edx
 add ebx, 4
 loop %%top2
 popa
%endmacro


SECTION .data
array1: dd      1,2,3,4,5
len1:   EQU     ($-array1)


array2: dd      -10, -9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9
len2:   EQU     ($-array2)


array3: dd  0,10,20,30,40,50,60,70,80,90
  dd  100,110,120,130,140,150,160,170,180,190
  dd  200,210,220,230,240,250,260,270,280,290
  dd  300,310,320,330,340,350,360,370,380,390
  dd  400,410,420,430,440,450,460,470,480,490,500
len3:   EQU     ($-array3)


SECTION .text
global _main
_main:

start:
        mov      eax,322 	      ;; value to check at end	
        revArray array1, len1
        revArray array2, len2
        revArray array3, len3
lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

