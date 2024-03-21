org 100h
   lea si, str ;storing the offset of string array
                ;starting address of array
   
   mov ah, 2h ;instruction for output
   mov dl, [si] ;moving the fist content of array to output register
   int 21h ;interrupt for showing output
   
   inc si  ;locating next index by increamint the source index
   mov dl, [si]  ;again moving 2nd element
   int 21h    ;showing output
   
   inc si
   mov dl, [si]
   int 21h
   
   inc si
   mov dl, [si]
   int 21h
   
   inc si
   mov dl, [si]
   int 21h
   
   
ret
str db 'Hello', 0 ; declaring string array