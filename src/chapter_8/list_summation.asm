; Chapter 8
; 8.2 Example program, List Summation
; Simple example to the sum and average for 
; a list of numbers.

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

lst             dd      1002, 1004, 1006, 1008, 10010
len             dd      5
sum             dd      0
avg             dd      0

; **********************************

section         .text
global _start
_start:

; -----
; Summation loop.

        mov     ecx, dword [len]                ; get length value
        mov     rsi, 0                          ; index = 0

sumLoop:
        mov     eax, dword [lst + rsi*4]        ; get lst[rsi]
        add     dword [sum], eax                ; update sum
        inc     rsi                             ; next element
        loop    sumLoop 

        ; calculate avg
        mov     eax, dword [sum]
        cdq
        idiv    dword [len]
        mov     dword [avg], eax
; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
