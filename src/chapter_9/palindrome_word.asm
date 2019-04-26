; Chapter 9
; 9.5.2 Palindrome word
; Create a program to determine if a NULL terminated string
; representing a word is a palindrome.

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

myword          db      "hannah", 0h
len             dq      6h
result          db      1h                      ;; assume string is palindrome

; **********************************

section         .text
global _start
_start:

; -----
; Loop to put word characters on the stack

        mov     rcx, qword [len]
        mov     rbx, myword
        mov     r12, 0
        mov     rax, 0

pushLoop:
        movzx   rax, byte [rbx]
        push    rax
        inc     rbx
        loop    pushLoop 

; -----
; All the characters are on the stack (in reverse order).
; Loop to get them back off. Compare each character to 
; each character in original string

        mov     rcx, qword [len]
        mov     rbx, myword

popLoop:
        pop     rax
        movzx   rdx, byte [rbx]
        sub     rax, rdx 
        jnz     failed

        inc     rbx
        loop    popLoop

        ; sucess - word is palindrome

        jmp last
failed:
        mov     byte [result], 0h
        jmp last
; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
