;1)Write a program that will take 2 string inputs from the user and concatenate(join) them together 
;Input: 
;Hello 
;World 
 
;Output: 
;Hello World

include "emu8086.inc"   ;importing emu8086 library for easy printing
org 100h
    mov ah, 1h  ;instruction for taking input
    
    ;taking input of first string
    mov cx, 50  ;counting register for array limit
    lea si, string1     ;set the address of string1
    call input_string   ;calling the procedure for taking input
    mov [si], '$'       ;inserting the terminating character
    
    ;printing new line
    print 10
    print 13
    
    ;taking input for second string
    mov cx, 50      ;counting register for array limit
    lea si, string2 ;set the address of string2
    call input_string ;again calling the proccedure for taking input
    mov [si], '$'     ;inserting the terminating character
    
    ;printing new line
    print 10
    print 13
    
    ;concatenate two string
    lea si, string1     ;set the source address of first string
    lea di, string3     ;set the destination address of third string
    call copy_string    ;calling prcedure for copy the string
    mov [di], ' '       ;inserting a space in 3rd string
    inc di              ;increament of di
    lea si, string2     ;now setting the address of string 2
    call copy_string    ;calling the procedure again for copy
    mov [di], '$'       ;giving terminator character
    
    ;printing concatenate string
    mov ah, 9h          ;instruction for printing array
    lea dx, string3     ;set the address of the array
    int 21h             ;printing the third string
     
ret   

;declaring three string without initialize
string1 db 50 dup(?)
string2 db 50 dup(?)
string3 db 100 dup(?)


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
        inc si      ;increamenting address 
        dec cx      ;decrementing the count register
        jmp start
        return_from_input:
            ret
input_string endp

;again recursive call
;procedure for copy string from source to destination
copy_string_recursive proc
    mov al, [si]    ;copy the content from source to al
    cmp al, '$'     ;checking if it is a terminator character or not
    je return_from_copy_string_recursive  ;if equal then return from the procedure
    mov [di], al    ;copy from al to destination
    inc si          ;increamenting the source index
    inc di          ;increamenting the destination index
    call copy_string_recursive    ;recursive call
    return_from_copy_string_recursive:
        ret
copy_string_recursive endp

;without recursive call
copy_string proc
    start_copy:
        mov al, [si]    ;copy the content from source to al
        cmp al, '$'     ;checking if it is a terminator character or not
        je return_from_copy_string  ;if equal then return from the procedure
        mov [di], al    ;copy from al to destination
        inc si          ;increamenting the source index
        inc di          ;increamenting the destination index
        jmp start_copy    ;jump to start
        return_from_copy_string:
            ret
copy_string endp
    
    