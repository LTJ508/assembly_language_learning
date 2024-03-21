org 100h
   ;simple input outout code
   ;instruction for input
   mov ah, 1h
   
   ;taking first input
   int 21h 
   sub al, '0'
   mov bl, al
   
   ;taking second input
   int 21h
   sub al, '0'
   mov bh, al
   
   ;taking third input
   int 21h
   sub al, '0'
   mov cl, al
   
   ;adding 1st nd 2nd
   add bl, bh
   add bl, '0'
   
   ;subtractice 3rd from 2nd
   sub bh, cl
   add bh, '0'
   
   ;instruction for output
   mov ah, 2h
   
   ;for new line 
   mov dl, 10
   int 21h
   mov dl, 13
   int 21h
   
   ;showing add result
   mov dl, bl
   int 21h
   
   ;for new line
   mov dl, 10
   int 21h
   mov dl, 13
   int 21h
   
   ;showing sub result
   mov dl, bh
   int 21h
ret