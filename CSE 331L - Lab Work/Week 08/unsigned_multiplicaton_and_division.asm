include "emu8086.inc"
org 100h
    ;8 bit multiplication
    mov al, 50  ;multiplicant
    mov bl, 50  ;multipler
    mul bl      ;multiplicant by default al, ax = al * bl 
    
    ;16 bit multiplication
    mov ax, 500 ;multiplicant
    mov bx, 500 ;multipler
    mul bx      ;multiplicant by default ax, dx(Higher Bit)-ax(Lower Bit) = ax * bx
    
    ;8 bit division => divisor is 8 bit and divident is 16 bit
    mov ax, 100 ;divident, 16 bit
    mov bl, 15  ;divisor, 8 bit
    div bl      ;divident is by default set as ax, al = Qoutient(8 bit), ah = Remainder(8 bit)
    
    ;16 bit division => divisor is 16 bit and divident is 32 bit
    ;500010 => 0007 A12A in hexa
    mov dx, 7h      ;divident - higher part, 16 bit
    mov ax, 0A12Ah  ;divident-lower part, 16 bit
    mov bx, 500     ;divisor, 16 bit, answer will be 1000, and remainder will be 10
    div bx          ;divident is by default set as dx-ax, ax = Qoutient(16 bit), dx = Remainder(16 bit)
ret
