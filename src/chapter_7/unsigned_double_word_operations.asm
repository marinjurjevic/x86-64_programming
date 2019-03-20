; Chapter 7 
; 7.9.2 Suggested Projects
; 5) Create a program to compute various unsigned
;    double-dword arithmetic expressions

; ***********************************
; Data declarations

section         .data

; operands
dNum1           dd      2500000
dNum2           dd      1250000
dNum3           dd      55000
dNum4           dd      13200

qNum1           dq      65600000

; results
dAns1           dd      0
dAns2           dd      0
dAns3           dd      0
dAns6           dd      0
dAns7           dd      0
dAns8           dd      0
qAns11          dq      0
qAns12          dq      0
qAns13          dq      0
dAns16          dd      0
dAns17          dd      0
dAns18          dd      0
dRem18          dd      0

; ------
; Define constants

SUCCESS         equ     0
SYS_exit        equ     60

; -----
; Define data

; **********************************

section         .text
global _start
_start:

; -----
; Perform expressions as specified in assignment

        ; dAns1 = dNum1 + dNum2
        mov     eax, dword [dNum1]
        add     eax, dword [dNum2]
        mov     dword [dAns1], eax

        ; dAns2 = dNum1 + dNum3
        mov     eax, dword [dNum1]
        add     eax, dword [dNum3]
        mov     dword [dAns2], eax

        ; dAns3 = dNum3 + dNum4
        mov     eax, dword [dNum3]
        add     eax, dword [dNum4]
        mov     dword [dAns3], eax

        ; dAns6 = dNum1 - dNum2
        mov     eax, dword [dNum1]
        sub     eax, dword [dNum2]
        mov     dword [dAns6], eax

        ; dAns7 = dNum1 - dNum3
        mov     eax, dword [dNum1]
        sub     eax, dword [dNum3]
        mov     dword [dAns7], eax

        ; dAns8 = dNum2 - dNum4
        mov     eax, dword [dNum2]
        sub     eax, dword [dNum4]
        mov     dword [dAns8], eax

        ; qAns11 = dNum1 * dNum3
        mov     eax, dword [dNum1]
        mul     dword [dNum3]
        mov     dword [qAns11], eax
        mov     dword [qAns11 + 4], edx

        ; qAns12 = dNum2 * dNum2
        mov     eax , dword [dNum2]
        mul     eax
        mov     dword [qAns12], eax
        mov     dword [qAns12 + 4], edx

        ; qAns13 = dNum2 * dNum4
        mov     eax, dword [dNum2]
        mul     dword [dNum4]
        mov     dword [qAns13], eax
        mov     dword [qAns13 + 4], edx
        
        ; dAns16 = dNum1 / dNum2
        mov     eax, dword [dNum1]
        mov     edx, 0
        div     dword [dNum2]
        mov     dword [dAns16], eax

        ; dAns17 = dNum3 / dNum4
        mov     eax, dword [dNum3]
        mov     edx, 0
        div     dword [dNum4]
        mov     dword [dAns17], eax

        ; dAns18 = qNum1 / dNum4
        mov     eax, dword [qNum1]
        mov     edx, dword [qNum1 + 4]
        div     dword [dNum4]
        mov     dword [dAns18], eax

        ; dRem18 = qNum1 % dNum4 
        mov     dword [dRem18], edx
        
; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
