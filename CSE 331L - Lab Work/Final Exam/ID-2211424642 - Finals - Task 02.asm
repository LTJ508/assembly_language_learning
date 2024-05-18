;2) Take a user input 'n' between 1-9 and print the pattern formed by the following numbers
;(Hint: you can use a nested loop to solve it!)
;Input1:
;4

;Output1:
;4444
;333
;22
;1

;Input2:
;7

;Output2:
;7777777
;666666
;55555
;4444
;333
;22
;1 

include "emu8086.inc"   ;importing emu8086 library
org 100h
    mov ah, 1h          ;instruction for taking input
    int 21h             ;taking input
    sub al, '0'         ;converting the asscciii value to raw number
    mov n, al           ;saving the number on a variable
    
    printn              ;printing new line
    
    mov ch, 0           ;making sure that upper or higher bit of cx is set to 0
    mov cl, n           ;moving the number on cl, so that now cx is fully set for running loop
    mov ah, 2h          ;instruction for giving output
    
    outer_loop:         ;outer loop start from here
        mov bx, cx      ;backup of CX, as inner loop will use the same cx so, keeping a backup
        ;as our value is bellow 10, so the lower part of cx is the number that we need to print
        mov dl, cl      ;moving cl to output register
        add dl, '0'     ;converting the number to ascii value

        inner_loop:     ;inner loop start for giving output
            int 21h     ;giving output
        loop inner_loop ;loop inner_loop untinl cx became zero
        
        printn          ;printing new line
        
        mov cx, bx      ;restoring the value of cx from backup bx
    loop outer_loop     ;loop until cx became zero
                      
ret
n db 0   ;declaring varibale with initialize with 0