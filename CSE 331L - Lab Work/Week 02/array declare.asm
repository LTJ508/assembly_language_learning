org 100h
    
    mov ah, 1h;instruction for input
    int 21h;taking input
    mov num[0], al;moving input to array index 0 
    
    int 21h;taking 2nd input
    mov num[1], al;moving input to array index 1
    
    int 21h;taking 3rd input
    mov num[2], al;moving input to array index 2  
    
    mov ah, 2h;instruction for output
    
    mov dl, 10;for output new line
    int 21h;showing new line
    mov dl, 13;for output cret
    int 21h;returning carrage
    
      
    mov dl, num[0];moving value of index 0 for output
    int 21h
    
    mov dl, num[1];moving value of index 1 for output
    int 21h
    
    mov dl, num[2];moving value of index 2 for output
    int 21h    
ret
;declaring array without initializing, only the array size is initialized
num db 3 dup(?)
