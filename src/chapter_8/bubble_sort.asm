; Chapter 8
; 6) Create a program to sort a list of numbers using
;    bubble sort algorithm

; ***********************************
; Data declarations

section         .data

; ------
; Define constants

SUCCESS         equ     0
SYS_exit        equ     60

; -----
; Define data

numbers         dd      25h, 14h, 22h, 7h, 33h, 18h, 19h, 67h, 95h, 17h
ncount          dd      0Ah

; **********************************

section         .text
global _start
_start:

; OUTER LOOP
        mov ecx, 0h                                 ; i = 0
oLoop:

        mov edx, 0h                                 ; j = 0
; INNER LOOP
iLoop:
    
        mov eax, dword [numbers + 4h * edx]
        cmp eax, dword [numbers + 4h * edx + 4h]
        jbe iLoopInc

        ; swap
        mov ebx, dword [numbers + 4h * edx + 4h]
        mov dword [numbers + 4h * edx + 4h], eax
        mov dword [numbers + 4h * edx], ebx

iLoopInc:
        inc edx                                     ; j++
        mov eax, dword [ncount]
        sub eax, ecx
        sub eax, 1h                                 ; eax = n - i - 1

        cmp edx, eax                                ; j < n - i - 1                  
        jb iLoop

        inc ecx                                     ; i++
        mov eax, dword [ncount]
        sub eax, 1h                                 ; eax = n - 1
        cmp ecx, eax                                ; i < n - 1
        jb oLoop

; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
