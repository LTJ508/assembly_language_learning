;1) Use a procedure and call it to execute the following task:
;Take 4 user inputs namely number1, number2, number3, number4.
;Print the result where the result is calculated using the following formula:
;result = (number1 - number2) + (number3 * number4)
;(The inputs would be given in such a way that no overflow occurs,
;so you don't have to worry about that)

;Input1:
;4321

;Output1:
;3

;Input2:
;5411

;Output2:
;2



include "emu8086.inc"   ;importing the emu8086 library for some convenient
org 100h
    mov ah, 1h          ;instruction for taking input          
    int 21h             ;taking input
    sub al, '0'         ;converting the asccii value to decimal raw number
    mov number1, al     ;storing the number on a variable
    
    int 21h             ;taking another input
    sub al, '0'         ;again converting ascii value to raw number
    mov number2, al     ;storing the number on a variable
    
    int 21h             ;taking 3rd input
    sub al, '0'         ;converting to raw number
    mov number3, al     ;storing the number on a variable
    
    int 21h             ;taking 4th input
    sub al, '0'         ;converting
    mov number4, al     ;stroing
    
    printn              ;printing new line with the help of emu 8086 library
    
    call result         ;calling the procedure for calculating the result
    
    mov ah, 2h          ;instruction for giving output
    int 21h             ;showing the output

ret

;variable declaration with initialize with 0
number1 db 0
number2 db 0
number3 db 0
number4 db 0   

;procedure for calculation
result proc         ;procedure name declare
    mov bh, number1 ;moving the saved value from number1 to bh
    sub bh, number2 ;bh = bh(number1) - number2
    
    mov al, number3 ;moving number3 to al, as a multiplicant
    mov bl, number4 ;moving number 4 to bl, as a multiplier
    mul bl          ;multiply bl and al, ax = al * bl
    
    ;as result is bellow 10, therefore, ah = 0, al = result
    add al, bh      ;al = al(number3 * number4) + bh(number1 - number2)
    add al, '0'     ;converting the result into asccii value
    mov dl, al      ;moving the result to output register
    
    ret             ;returning from procedure
result endp         ;end of the procedure