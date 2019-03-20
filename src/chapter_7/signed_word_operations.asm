; Chapter 7 
; 7.9.2 Suggested Projects
; 4) Create a program to compute various signed
;    word arithmetic expressions

; ***********************************
; Data declarations

section         .data

; operands
wNum1           dw      10000
wNum2           dw      -1500
wNum3           dw      5350
wNum4           dw      -11219

dNum1           dd      35000

; results
wAns1           dw      0
wAns2           dw      0
wAns3           dw      0
wAns6           dw      0
wAns7           dw      0
wAns8           dw      0
dAns11          dd      0
dAns12          dd      0
dAns13          dd      0
wAns16          dw      0
wAns17          dw      0
wAns18          dw      0
wRem18          dw      0

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

        ; wAns1 = wNum1 + wNum2
        mov     ax, word [wNum1]
        add     ax, word [wNum2]
        mov     word [wAns1], ax

        ; wAns2 = wNum1 + wNum3
        mov     ax, word [wNum1]
        add     ax, word [wNum3]
        mov     word [wAns2], ax

        ; wAns3 = wNum3 + wNum4
        mov     ax, word [wNum3]
        add     ax, word [wNum4]
        mov     word [wAns3], ax

        ; wAns6 = wNum1 - wNum2
        mov     ax, word [wNum1]
        sub     ax, word [wNum2]
        mov     word [wAns6], ax

        ; wAns7 = wNum1 - wNum3
        mov     ax, word [wNum1]
        sub     ax, word [wNum3]
        mov     word [wAns7], ax

        ; wAns8 = wNum2 - wNum4
        mov     ax, word [wNum2]
        sub     ax, word [wNum4]
        mov     word [wAns8], ax

        ; dAns11 = wNum1 * wNum3
        mov     ax, word [wNum1]
        imul    word [wNum3]
        mov     word [dAns11], ax
        mov     word [dAns11 + 2], dx

        ; dAns12 = wNum2 * wNum2
        mov     ax , word [wNum2]
        imul    ax
        mov     word [dAns12], ax
        mov     word [dAns12 + 2], dx

        ; dAns13 = wNum2 * wNum4
        mov     ax, word [wNum2]
        imul    word [wNum4]
        mov     word [dAns13], ax
        mov     word [dAns13 + 2], dx
        
        ; wAns16 = wNum1 / wNum2
        mov     ax, word [wNum1]
        cwd
        idiv    word [wNum2]
        mov     word [wAns16], ax

        ; wAns17 = wNum3 / wNum4
        mov     ax, word [wNum3]
        cwd
        idiv    word [wNum4]
        mov     word [wAns17], ax

        ; wAns18 = dNum1 / wNum4
        mov     ax, word [dNum1]
        mov     dx, word [dNum1 + 2]
        idiv    word [wNum4]
        mov     word [wAns18], ax

        ; wRem18 = dNum1 % wNum4 
        mov     word [wRem18], dx
        
; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
