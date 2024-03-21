org 100h       
    mov ah, 01h ;instruction for taking input
    lea si, s ;storing the effecting address
    mov cl, 100 ;max array size using for loop count, like maximum string limit
    
    input:
    int 21h
    CMP al, 13; comparing is carrage return is same
    JE print; if enter press, 13 is equal to al 
    mov [si], al;storing the entered character to memory segment reffered by the string array
    INC si; increamenting address
    DEC cl; decreamenting count
    CMP cl, 0;comparing if count end reach to zero
    JA input
    
    print:
    mov [si], 0;giving terminating value
    lea si, s; again storing the effecting address
    mov ah, 02h;instruction for giving output
    mov dl, 10;for new line
    int 21h
    mov dl, 13;for carrage return
    int 21h
    
    
    again:
    mov dl, [si];transfering data from string array to output register
    int 21h
    INC si ;pointing to next index of the string array
    CMP [si], 0 ;checking terminating character
    JA again ;if not print again
ret
s db 100 dup(?);declaring string array size of 100