;2)Take a value ’n’ as input from the user. Then take ’n’ inputs and store them in an array.
;Finally take a ’key’ input from the user and print "Found" if the key is present in the array else print "Not Found" 
;Input: 
;5 //The value of n 
;12345 //The array input 
;6 //The key input 
 
;Output: 
;Not Found

include "emu8086.inc"   ;importing emu8086 library for easy printing
org 100h
    mov ah, 1h      ;instruction for input
    int 21h         ;taking inout for size of array limit
    sub al, '0'     ;subtracting 0 to get the actual number for array limit
    mov b.n, al     ;storing the value in b variable, b.n means the value will be store in lower bit of n, avoiding mismatch in size
    
    mov cx, n       ;assiging the count register for taking input
    
    ;printing new line
    print 10
    print 13
    
    lea si, arr     ;set the address of array for taking input
    
    input:          
        int 21h     ;taking input
        mov [si], al;storing the value in array
        inc si      ;increamenting the source index
    loop input      ;loop the input process for taking input
    mov [si], 0     ;terminating character
    
    ;printing new line
    print 10
    print 13
    
    int 21h         ;taking input for key
    mov key, al     ;storing the key in variable
    
    ;printing new line
    print 10
    print 13
    
    lea si, arr     ;set the address in source index for search
    mov cx, n       ;counting register for search proccess
    
    search:
        mov al, [si];taking the content from array to al
        cmp al, key ;comparing the key and al
        je found    ;if equal it will jump to found
        inc si      ;increamenting source index
    loop search     ;loop the search process until the array end
    jmp not_found   ;if not found and array end then it will jump to not_found
    
    found:
        print "Found";prining Found 
        ret
    not_found:
        print "Not Found";printing Not Found
              
ret 

;declaring array and variable for key
arr db 100 dup(?)
n dw ?
key db ?

