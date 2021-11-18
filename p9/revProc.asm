;Name		Saif Hasan
;Date		17 November 2021
;Assignment	Program 9 : Reverse Array with a Proc 
;Description	The program name is self explanatory! (Proc is procedure/function.)


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
global _main, _revArray
_main:

pusha			;in case we need to save register values

;we want to call a function with 2 parameters (array, len)
;since parameters are passed in reverse order we push the length first, then the array (which is the address of the first element)

;first call for array1
push len1/4		;divide by 4 to get number of elements in array, because each element is double sized
push array1
call _revArray
add esp, 8  		;2 parameters were passed, each were double sized (4 bytes), so we add 8 to the stack pointer (clearing the stack)

;second call for array2
push len2/4             
push array2
call _revArray
add esp, 8              

;third call for array3
push len3/4             
push array3
call _revArray
add esp, 8              

popa			;restoring all register values after function calls

lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;reverse array function
_revArray:
push ebp
mov ebp, esp
push ebx 		;since ebx is callee saved, we can save it once we are inside the function
mov ebx, [ebp+8] 	;get address of the array into ebx
mov eax, 0		;eax will be used to store array values
mov edx, 0		;this is our offset for traversing the array
mov ecx, [ebp+12]       ;put array size into ecx, we will need this to run a loop
;pushing all array elements into stack
reverse1: 
  push dword[ebx+edx]
  add edx, 4
loop reverse1
;reset edx and ecx for popping elements, popping them will put back in reverse order
mov edx, 0
mov ecx, [ebp+12]
reverse2:
  pop dword[ebx+edx]
  add edx, 4
loop reverse2
;this should pop back all array elements in the array address
;once this is done we need to pop ebx and ebp, before returning to main
pop ebx
pop ebp
ret
 
