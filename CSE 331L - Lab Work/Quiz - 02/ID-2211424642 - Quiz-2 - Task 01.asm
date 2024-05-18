;1) Take 2 user inputs (1-9) and multiply them. Print out the answer of multiplication.
;The inputs would be given in such a way such the answer would always be of one digit,\
;so it is easily printable.
;Input1:
;1 9

;Output1:
;9

;Input2:
;2 4

;Output2:
;8   


include "emu8086.inc"
org 100h
    mov ah, 1h  ;instruction for taking input
    int 21h     ;taking input
    sub al, '0' ;converting ascii value to decimal or raw number
    mov bl, al  ;storing the number in bl, as a multiplier
    
    print " "   ;printing space for more visibility as given sample
    
    int 21h     ;taking another input
    sub al, '0' ;again converting the asccii value to raw number
    
    mul bl      ;multiply bl(multiplier) with al(multiplicant)
    
    ;result will save on AX, as our provided number will produce a result within 0-9
    ;then actual result will be on al, and ah will be zero
    mov dl, al  ;taking the result on output register
    add dl, '0' ;converting the number into ascii value
    
    printn      ;printing new line using emu8086 library
    
    mov ah, 2h  ;instruction for giving output
    int 21h     ;showing the output
ret             ;return 0