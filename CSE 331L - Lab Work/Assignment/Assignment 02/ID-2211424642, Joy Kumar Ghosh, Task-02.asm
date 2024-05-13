;2) Take a number 'n' as input from the user between 1-9 and print it 'n' times.
;(Explanation - If '7' is given as input, it is printed 7 times,
;if '4' is given as input then the number '4' is printed 4 times)
;Input1:
;7

;Output1:
;7777777

;Input2:
;4

;Output2:
;4444

include "emu8086.inc"
org 100h
    ;taking input  
    mov ah, 1h      ;instruction for taking input
    int 21h         ;taking input
    ;get ready for output
    mov ah, 2h      ;instruction for giving output
    mov dl, al      ;moving the content to output register
    ;get ready for running loop
    sub al, '0'     ;subtracting 0 for converting asccii to decimal raw value
    mov ch, 0       ;making sure that entire cx is 0
    mov cl, al      ;setting the lower part of cx for running loop
    
    print 10        ;printing new line
    print 13        ;printin creg return
    
    print:
        int 21h     ;giving output
    loop print      ;loop until cx became zero
  
ret 