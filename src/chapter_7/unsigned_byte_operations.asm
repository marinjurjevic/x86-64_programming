; Chapter 7 
; 7.9.2 Suggested Projects
; 1) Create a program to compute various arithmetic expressions

; ***********************************
; Data declarations

section         .data

; operands
bNum1           db      10
bNum2           db      20
bNum3           db      30
bNum4           db      40

wNum1           dw      350

; results
bAns1           db      0
bAns2           db      0
bAns3           db      0
bAns6           db      0
bAns7           db      0
bAns8           db      0
wAns11          dw      0
wAns12          dw      0
wAns13          dw      0
bAns16          db      0
bAns17          db      0
bAns18          db      0
bRem18          db      0

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

        ; bAns1 = bNum1 + bNum2
        mov     al, byte [bNum1]
        add     al, byte [bNum2]
        mov     byte [bAns1], al

        ; bAns2 = bNum1 + bNum3
        mov     al, byte [bNum1]
        add     al, byte [bNum3]
        mov     byte [bAns2], al

        ; bAns3 = bNum3 + bNum4
        mov     al, byte [bNum3]
        add     al, byte [bNum4]
        mov     byte [bAns3], al

        ; bAns6 = bNum1 - bNum2
        mov     al, byte [bNum1]
        sub     al, byte [bNum2]
        mov     byte [bAns6], al

        ; bAns7 = bNum1 - bNum3
        mov     al, byte [bNum1]
        sub     al, byte [bNum3]
        mov     byte [bAns7], al

        ; bAns8 = bNum2 - bNum4
        mov     al, byte [bNum2]
        sub     al, byte [bNum4]
        mov     byte [bAns8], al

        ; wAns11 = bNum1 * bNum2
        mov     al, byte [bNum1]
        mul     byte [bNum2]
        mov     word [wAns11], ax

        ; wAns12 = bNum2 * bNum2
        mov     al , byte [bNum2]
        mul     al
        mov     word [wAns12], ax

        ; wAns13 = bNum2 * bNum4
        mov     al, byte [bNum2]
        mul     byte [bNum4]
        mov     word [wAns13], ax
        
        ; bAns16 = bNum1 / bNum2
        movzx   ax, byte [bNum1]
        div     byte [bNum2]
        mov     byte [bAns16], al

        ; bAns17 = bNum3 / bNum4
        movzx   ax, byte [bNum3]
        div     byte [bNum4]
        mov     byte [bAns17], al

        ; bAns18 = wNum1 / bNum4
        mov     ax, word [wNum1]
        div     byte [bNum4]
        mov     byte [bAns18], al

        ; bRem18 = wNum1 % bNum4 
        mov     byte [bRem18], ah
        
; ------
; Done, terminate program
last:
        mov     rax, SYS_exit           ; call code for exit
        mov     rdi, SUCCESS            ; exit with sucess
        syscall
