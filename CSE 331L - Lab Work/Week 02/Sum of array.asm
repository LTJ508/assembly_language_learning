org 100h
    
    lea si, num;saving the offset of num array
    
    mov ah, 1h;instruction for input
    
    int 21h;taking input
    sub al, '0';storing raw value
    mov [si], al;moving input to array
    
    inc si;locating next address
    int 21h;taking input
    sub al, '0';storing raw value
    mov [si], al;moving input to array
    
    inc si
    int 21h;taking input
    sub al, '0';storing raw value
    mov [si], al;moving input to array
    
    inc si
    int 21h;taking input
    sub al, '0';storing raw value
    mov [si], al;moving input to array
    
    inc si
    int 21h;taking input
    sub al, '0';storing raw value
    mov [si], al;moving input to arra
    
    lea si, num;agin storing offset of array
    
    mov bh, 0;act as sum, variable can't declare as memory to memory transfer not aalowed
    
    add bh, [si];adding and storing to bh
    
    inc si;locating the next address by increamenting si by 1
    add bh, [si]
    
    inc si
    add bh, [si];repeating adding
    
    inc si
    add bh, [si];repeating adding
    
    inc si
    add bh, [si];repeating adding
    
    add bh, '0';returning to ascii value to show the character
    
    mov ah, 2h;instruction for output
    
    mov dl, 10;for output new line
    int 21h;showing new line
    mov dl, 13;for output cret
    int 21h;returning carrage
    
    mov dl, bh;moving value of bh as sum for output
    int 21h   
ret
;declaring array without initializing, only the array size is initialized
num db 5 dup(?)
