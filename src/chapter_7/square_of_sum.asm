; Chapter 7 
; 7.9.2 Suggested Projects
; 8) Create a program to compute the square 
;    of the sum from 1 to n

; ***********************************
; Data declarations

section         .data

; ------
; Define constants

SUCCESS         equ     0
SYS_exit        equ     60

; -----
; Define data
n               dd      10
squareOfSum     dq      0

; **********************************

section         .text
global _start
_start:

; -----
; Compute sum of squares from 1 to n
; Approach:
; for (i=n; i>0; i--)
;       sumOfSquares += i
; sumOfSquares = someOfSquares^2

        mov     ecx, dword[n]
        mov     rax, 0                          ; init sum to 0
sumLoop:
        add     rax, rcx                        ; use rcx as i
        loop    sumLoop
        
        ; store result to squareOfSum
        mul     rax
        mov     qword[squareOfSum], rax

; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
