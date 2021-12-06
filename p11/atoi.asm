;Name           Saif Hasan
;Date           3  December 2021
;Assignment     Program 11 : Atoi Procedure
;Description    Converts a string (of numeric characters) to its integer representation

SECTION .data
ascii1: db 0
ascii2: db "18",0	; You may need to replace these quotes on assemble.
ascii3: db "322",0
ascii4: db "4294967295",0
ascii5: db "00000",0

SECTION .text
global _main, _times10, _atoi, _atoi1
_main:

;test values
;mov ebx, 100
;mov ecx, 100
;mov edx, 100


mov esi,ascii1
call _atoi
b1:

mov esi,ascii2
call _atoi
b2:

mov esi,ascii3
call _atoi
b3:

mov esi,ascii4
call _atoi
b4:

mov esi,ascii5
call _atoi
b5:

lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Function to multiply number by 10 and return value in eax
_times10:
   push ebx
   mov ebx, eax         
   shl ebx,1        
   shl eax,3        
   add eax,ebx       
   pop ebx
   ret             

;;Array to integer function  
_atoi:
   push ebx
   push edx
   push ecx
   xor edx, edx
   cmp byte[esi], 0
   je skip
   mov dl, [esi]
   sub edx, '0'
   top:
	cmp byte[esi+1], 0
        je done
	mov eax, edx
	call _times10
	mov edx, eax
	xor eax, eax
	mov al, [esi+1]
	sub al, '0'
	add edx, eax
	inc esi
	jmp top
   skip:
   	mov edx, 0
   done:
        mov eax, edx
        pop ebx
        pop edx
        pop ecx
   ret

