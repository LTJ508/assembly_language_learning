include 'emu8086.inc'
org 100h
    mov ah, 1h          ;prepare for input
    mov cx, 100         ;counting register for maximum input take as array size
    lea si, s           ;storing the offset of the string array to si
    mov bx, 0           ;bx using for counting the actual length of the string array
    
    input:              ;input loop body start
        int 21h         ;taking input
        cmp al, 13      ;checking if enter was pressed or not
        je exit_input   ;if enter pressed then exit from loop
        mov [si], al    ;storing the input into the string array
        inc si          ;increment the si for next index of the array
        inc bx          ;incrementing the count of length of the array
    loop input          ;loop this input 100 times or break if enter pressed
      
    exit_input:        ;prepare for output
       mov ah, 2h       ;prepare for output
       mov cx, bx       ;now using the length as a loop count
       dec si           ;decrementing si as si is one step ahed of the array size
       print 10         ;printing new line
       print 13         ;printing carrage return
       
    print:              ;print loop body start
        mov dl, [si]    ;moving the content from last index to output register
        int 21h         ;display it
        dec si          ;decrementing si for pointing previous index
    loop print          ;loop print until array length reduced to 0, cx = bx

ret 
s db 100 dup(?)         ;declaring string array of 100 bytes