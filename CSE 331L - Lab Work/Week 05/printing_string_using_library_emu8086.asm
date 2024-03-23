include "emu8086.inc"
org 100h

    mov ah, 9h ;array output until $ sign read or integer 24H read
    lea dx, s
    int 21h   
    
    lea dx, newl;for new line printing
    int 21h  
    
    lea dx, s2 ;printing 2nd array
    int 21h   
    
    lea dx, newl;for new line printing
    int 21h 
    
    print "Hi I am JOY"   ;printing direct string using print instruction inported from emu8086.inc   
    
    lea dx, newl;for new line printing
    int 21h  
     
    ;taking input using loop 
    mov ah, 01h ;instruction for taking input
    lea si, num   ;storing the effecting address
    mov cx, 5 ;max array size using for loop count, like maximum string limit
    
    ;work:
    ;    int 21h
     ;   cmp al, 13  ;comparing is carrage return is same
      ;  je print    ;if enter press, 13 is equal to al 
       ; mov [si], al;storing the entered character to memory segment reffered by the string array
        ;inc si      ;increamenting address
    
    ;loop work    ;it will repeat work until CX become zero, that means after every repeat cx will decreament by 1
    
    ;print:
    ;    mov [si], '$';giving terminating value  
    ;    mov ah, 9h ;instruction for array output
    ;    
    ;   lea dx, newl;for new line printing
    ;    int 21h 
 
    ;    lea dx, num ;pointing num array
    ;    int 21h
    
    
    call work
    
    ;another way to loop call work
    ;fun:
        ;call work
    ;loop fun 
    
    print:
        mov [si], '$';giving terminating value  
        mov ah, 9h ;instruction for array output
        
        lea dx, newl;for new line printing
        int 21h 
 
        lea dx, num ;pointing num array
        int 21h
 
ret

s db "Hello World", '$'
s2 db "Another Line", '$'
newl db 10, 13, '$'; array for printing new line
num db 100 dup(?)   

;using proccedore
work proc
    cmp cx, 0;base case for return
    je return  ;jump to return for return to caller
    int 21h
    cmp al, 13  ;comparing is carrage return is same
    je print    ;if enter press, 13 is equal to al 
    mov [si], al;storing the entered character to memory segment reffered by the string array
    inc si      ;increamenting address 
    dec cx ;decrementing the count register
    call work ;recursive call for running a loop
    return:
        ret 
work endp 
