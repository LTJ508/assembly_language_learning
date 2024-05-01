;3)Take 2 strings as user input, and print "Same" if both of them are same or else print "Not same". Do surely use labels in your code. 
;Input: 
;life //string - 1 
;death //string - 2 
 
;Output: 
;Not same

include "emu8086.inc"   ;importing emu8086 library for easy printing
org 100h
    mov ah, 1h  ;instruction for taking input
    
    ;taking input of first string
    mov cx, 100  ;counting register for array limit
    lea si, string1     ;set the address of string1
    mov bl, 0           ;for counting the length
    call input_string   ;calling the procedure for taking input
    mov [si], '$'       ;inserting the terminating character
    mov n_str1, bl      ;storing the length
    
    ;printing new line
    print 10
    print 13
    
    ;taking input for second string
    mov cx, 100         ;counting register for array limit
    lea si, string2     ;set the address of string2
    mov bl, 0           ;for counting the length
    call input_string   ;again calling the proccedure for taking input
    mov [si], '$'       ;inserting the terminating character
    mov n_str2, bl      ;storing the length
    
    ;printing new line
    print 10
    print 13
    
    ;compare two string
    mov bh, n_str1      ;loading the length in register
    mov bl, n_str2      ;loading another length in register
    cmp bh, bl          ;comparing two length
    jne not_same        ;if length is not equal then there is no chance to be same string
    
    lea si, string1     ;set the source address of first string
    lea di, string2     ;set the destination address of second string
    mov cx, 100         ;counting register for max length
    
    compare:
        mov bh, [si]    ;loading content from first array
        mov bl, [di]    ;loading content from second array
        cmp bh, bl      ;comparing two content
        jne not_same    ;if not equal then jump to not_same
        cmp bh, '$'     ;as they are equal, checking if it is a terminating character or not
        je same         ;if terminating character then jump to same
        inc si          ;increamenting si
        inc di          ;increamenting di
    loop compare        ;running the loop until max length reache
    same:
        print "Same"    ;printing the same
        ret             ;returning from the program
    
    not_same:
        print "Not Same";printing not same
     
ret   

;declaring three string without initialize
string1 db 100 dup(?)
string2 db 100 dup(?)
n_str1 db 0
n_str2 db 0

;procedure for taking input
input_string proc
    cmp cx, 0;base case for return
    je return_from_input    ;jump to return for return to caller
    int 21h
    cmp al, 13              ;comparing is carrage return is same
    je return_from_input    ;if enter press, 13 is equal to al 
    mov [si], al;storing the entered character to memory segment reffered by the string array
    inc bl      ;counting the length
    inc si      ;increamenting address 
    dec cx      ;decrementing the count register
    call input_string ;recursive call for running a loop
    return_from_input:
        ret
input_string endp