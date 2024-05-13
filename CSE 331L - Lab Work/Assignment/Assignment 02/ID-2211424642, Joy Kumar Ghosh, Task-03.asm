;3) Use a procedure to carry out the following task - take 2 numbers input from the user,
;add them (so that the result is less than 10)
;and print the output. Remember you have to use a procedure to carry out this task and call it. 
;Input1:
;1
;2

;Output1:
;3

;Input2:
;4
;5

;Output2:
;9


include "emu8086.inc"
org 100h
    mov ah, 1h      ;instruction for taking input
    int 21h         ;taking input
    sub al, '0'     ;subtracting for converting the asccii to decimal raw value
    mov bh, al      ;storing it in bh
    
    call newLine    ;calling procedure for printing new line
    
    int 21h         ;taking another input
    sub al, '0'     ;again converting asccii to decimal raw
    mov bl, al      ;storing it on bl register
    
    call newLine    ;calling for printing new line
    call addTwoNumbers  ;procedure for adding two number from bh & bl and store it on dl
    
    mov ah, 2h      ;instruction for giving output
    int 21h         ;giving output
ret

newLine proc        ;procedure for printing new line
    print 10        ;printing new line
    print 13        ;printing creg return
    ret
newLine endp        ;end of the procedure

addTwoNumbers proc  ;procedure for adding two numbers
    mov dh, 0       ;dh register will be used as sum = 0
    add dh, bh      ;adding bh to dh, dh = dh + bh
    add dh, bl      ;adding bl to dh, dh = dh + bl
    add dh, '0'     ;adding character 0 for converting to asccii back again
    mov dl, dh      ;moving the sum to output register
    ret
addTwoNumbers endp  ;end of the procedure