include "emu8086.inc"
org 100h
    mov ah, 1h
    int 21h
    sub al, '0'
    mov n, al
    printn
    
    mov bh, 1
    
    outer_loop:
        cmp bh, n
        ja exit_outer
        
                mov ch, 0
                mov cl, bh
                    inner_loop:
                        print "*"
                    loop inner_loop
                inc bh
                inc bh
                printn
   jmp outer_loop
   exit_outer:
   
   sub bh, 4
   outer_loop2:
        cmp bh, 1
        jl exit_outer2
            mov ch, 0
            mov cl, bh
                inner_loop2:
                    print "*"
                loop inner_loop2
            dec bh
            dec bh
            printn
   jmp outer_loop2
   
   exit_outer2:
            
        
ret 

n db ?

