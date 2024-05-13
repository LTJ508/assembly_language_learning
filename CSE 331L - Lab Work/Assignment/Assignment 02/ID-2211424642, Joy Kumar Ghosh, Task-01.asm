;1) User can provide an input number between 1 to 9 
;and print the following patterns according to the input
;(Hint: You can use a nested loop to print the asterisk patterns)
;Input1:
;4

;Output1:
;*
;**
;***
;****

;Input2:
;6

;Output2:
;*
;**
;***
;****
;*****
;******

include "emu8086.inc"
org 100h
 
    mov ah, 1h      ;instruction for taking input
    int 21h         ;taking input
    sub al, '0'     ;subtracting for converting the asccii value to raw decimal value
    mov b.n, al     ;storing the value in a variable, in byte position
    
    call newLine    ;for printing new line
    
    mov bx, 1       ;it will use for the outer loop counting
    mov ah, 2h      ;instruction for giving output
    mov dl, '*'     ;moving the printing character to output register
    
    outer_Loop:     ;outer loop start from here
        cmp bx, n   ;first checking the condition like while or for loop
        ja exit     ;if the initial variable number is greater then user input then exit from the loop
        mov cx, bx  ;assigning cx for inner loop
        inner_Loop: ;inner loop start here
            int 21h ;giving output
        loop inner_loop ;loop until the cx became zero
        call newLine;for new line
        inc bx      ;increamenting same as for loop
    jmp outer_loop  ;unconditional jump to outer loop
    exit:           ;exit point or normal execution flow
ret

n dw 0              ;assiging a word size variable

newLine proc        ;procedure for printing new line, we can make macro as well for good practice
    print 10        ;printing new line
    print 13        ;printin creg return
    ret
newLine endp        ;end of the procedure