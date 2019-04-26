; Chapter 9
; 9.4 Simple example demonstrating basic stack operations.
; Reverse a list of numbers - in place.
; Method: Put each number on stack, then pop each number 
;         back off, and then put back into memory.

; ***********************************
; Data declarations

section         .data

; ------
; Define constants

SUCCESS         equ     0
SYS_exit        equ     60

; -----
; Define data

section         .data   

numbers         dq      121, 122, 123, 124, 125
len             dq      5

; **********************************

section         .text
global _start
_start:

; -----
; Loop to put numbers on stack

        mov     rcx, qword [len]
        mov     rbx, numbers
        mov     r12, 0
        mov     rax, 0

pushLoop:
        push    qword [rbx + r12*8]
        inc     r12 
        loop    pushLoop 

; -----
; All the numbers are on the stack (in reverse order).
; Loop to get them back off. Put them back into the
; origin list...

        mov     rcx, qword [len]
        mov     rbx, numbers 
        mov     r12, 0

popLoop:
        pop     rax 
        mov     qword [rbx + r12*8], rax
        inc     r12 
        loop    popLoop

; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
