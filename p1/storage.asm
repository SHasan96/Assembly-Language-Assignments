; NAME		Saif Hasan
; Assignment	Program 1 : Data Storage
; Date		September 22, 2021
; Etc...	No, I don't want to add anything fun. CS is getting too stressful.

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
a1:	db	2,4,6,8,10
b1:	dw	1,2,3,4,5
c1:	dd	10,20,30,40
d1:	dq	10h,11h,12h,13h
a2:	db	-50
b2:	dw	-45
c2:	db	-30
d2:	dw	-25
e2:	db	-20
a3:	db	'Mercer'
b3:	db	100
c3:	db	0
d3:	db	'Go '
e3:	db	'Bears!'
a4:	dw	100
b4:	dd	100h
c4:	db	100b
d4:	dw	100q
e4:	dd	100d

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.



; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
