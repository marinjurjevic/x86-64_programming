; Chapter 7 
; 7.9.2 Suggested Projects
; 9) Create a program to iteratively find
;    n-th Fibonacci number

; ***********************************
; Data declarations

section         .data

; ------
; Define constants

SUCCESS         equ     0
SYS_exit        equ     60

; -----
; Define data

n               dd      15      ; find 15-th fibonacci number
num1            dd      0
num2            dd      1

nfibo           dd      0       ; value will be stored here

; **********************************

section         .text
global _start
_start:

; -----
; Compute n-th fibonnaci number using loop
; Approach:
; while(n > 0){
;        if (n <= 2){
;               num1 = n
;        }
;       sum  = num1 + num2
;       num1 = num2
;       num2 = sum
; }
; Result is stored in num1


        mov     ecx, dword [n]
        mov     eax, dword [num1]
        mov     ebx, dword [num2]

        cmp     ecx, 1                  ; if n > 1 jump to fiboLoop
        ja      fiboLoop

        mov     eax, ecx                ; else move n (which is in ecx) to eax
        jmp     end


fiboLoop:
        mov     edx, eax
        add     edx, ebx
        mov     eax, ebx 
        mov     ebx, edx

        loop    fiboLoop
        
end:    mov     dword [nfibo], eax


; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
