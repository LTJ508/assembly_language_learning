;1) Take a user string input and stop when 'Enter' is pressed. The input
;would be between 1-9 letters, and print the number of letters in the
;string.
;Input1:
;regret
;Output1:
;6
;Input2:
;fail
;Output2:
;4


include "emu8086.inc"   ;including the library for printing new line
org 100h   
    mov ah, 1h          ;instruction for taking input
    lea si, string      ;storing the address of string
    mov bl, 0           ;this register will be used for counting
    
    input:
        int 21h         ;taking input
        cmp al, 13      ;comparing with carige return
        je print        ;if equal then move stonp taking input
        mov [si], al    ;storing the data in the string array
        inc si          ;increamenting si for pointing the next string address
        inc bl          ;increamenting the register, i am using it for counting
        jmp input       ;jmp to input for taking another input
    
    print:
        print 10        ;printing new line using the library
        print 13        ;printing carriege return using the library
        mov [si], '$'   ;terminating character for the string
        add bl, '0'     ;adding character 0 for convert the count to ascii charcter
        mov ah, 2h      ;instruction for giving output
        mov dl, bl      ;copy the count value to dl, output register
        int 21h         ;displaying the character
ret

string db 100 dup(?)    ;declaring string array of size 100 without innitialized