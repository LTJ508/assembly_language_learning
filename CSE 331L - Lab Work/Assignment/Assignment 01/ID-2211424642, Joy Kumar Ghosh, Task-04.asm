;4)Take a string input from the user and determine whether it is a palindrome or not.
;Print "Yes" if is a palindrome or else print "No". A palindrome is a word which reads the same forward and backwards. 
;Input 1: 
;racecar 
 
;Output 1: 
;Yes 
 
;Input 2: 
;work 
 
;Output 2: 
;No       

include "emu8086.inc"   ;importing emu8086 library for easy printing
org 100h
    mov ah, 1h  ;instruction for taking input
    
    ;taking input for a word
    mov cx, 100             ;counting register for array limit
    lea si, word            ;set the address of string1
    mov bl, 0               ;for counting the length
    call input_string       ;calling the procedure for taking input
    mov [si], '$'           ;inserting the terminating character
    mov b.length_word, bl   ;storing the length
    
    ;printing new line
    print 10
    print 13
    
    ;checking palindrome or not
    mov cx, length_word     ;set the counting register as length
    dec si                  ;decreamenting the si for the last content address
    mov di, si              ;storing the last content address in destination index regsiter
    lea si, word            ;storing the first content address in source index register
    
    check:                  ;label for running loop
        mov bh, [si]        ;loading the first content
        mov bl, [di]        ;loading the last content
        cmp bh, bl          ;comparing them
        jne not_palindrome  ;if not equal then not palindrome
        inc si              ;increamenting first index
        dec di              ;decreamenting last index
    loop check              ;loop the check until length finish, ineffecient, we don't need to check all, we need to check half only
    
    print "Yes"             ;printing yes
    ret
    
    not_palindrome:         ;printing no
        print "No"
    
    
        
ret
;declaring array and variable for length 
word db 100 dup(?)   
length_word dw 0

;recursive call caused recursive return,
;so it will take some extra clock cycle for returning from the recursive call
;lets make it more efficient
;procedure for taking input
input_string_recursive proc
    cmp cx, 0;base case for return
    je return_from_input    ;jump to return for return to caller
    int 21h
    cmp al, 13              ;comparing is carrage return is same
    je return_from_input_recursive    ;if enter press, 13 is equal to al 
    mov [si], al;storing the entered character to memory segment reffered by the string array
    inc bl      ;counting the length
    inc si      ;increamenting address 
    dec cx      ;decrementing the count register
    call input_string_recursive ;recursive call for running a loop
    return_from_input_recursive:
        ret
input_string_recursive endp 

;without recursive call
input_string proc
    start:
        cmp cx, 0;base case for return
        je return_from_input    ;jump to return for return to caller
        int 21h
        cmp al, 13              ;comparing is carrage return is same
        je return_from_input    ;if enter press, 13 is equal to al 
        mov [si], al;storing the entered character to memory segment reffered by the string array
        inc bl      ;counting the length
        inc si      ;increamenting address 
        dec cx      ;decrementing the count register
        jmp start
        return_from_input:
            ret
input_string endp