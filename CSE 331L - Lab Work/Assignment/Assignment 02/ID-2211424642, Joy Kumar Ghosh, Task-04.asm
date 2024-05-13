;4) Take a number 'n' as user input and print "Hello World" n times
;Input:
;4

;Output:
;Hello World
;Hello World
;Hello World
;Hello World 

include "emu8086.inc"
org 100h
    mov ah, 1h              ;instruction for taking input
    int 21h                 ;taking input
    sub al, '0'             ;subtracting character to convert it on decimal raw count value
    mov cx, 0               ;making sure that entire cx register is 0
    mov cl, al              ;changing the cl only for setting the count register for running loop
    printing:
        call printString    ;calling procedure for printing string
    loop printing           ;loop until cx became zero
ret

printString proc            ;procedure for printing a string
    print 10                ;printing new line
    print 13                ;printing creg return
    print "Hello World"     ;printing hello world
    ret
printString endp            ;end of the procedure