include 'emu8086.inc';including header for using loop and print function
org 100h
    mov cx, 5 ;count register for outerloop
     
    outer_loop:  ;outer loop body start
        mov bx, cx   ;reserving the value of count register for outerloop
        mov cx, 5    ;initializing count register again for inner loop
        
        inner_loop:   ;inner loop body start
            print "Hello "  ;print Hello
        loop inner_loop    ;loop 5 times as cx initialize by 5 before innerloop
        
        print 10    ;printing new line
        print 13    ;for carrage return
        mov cx, bx  ;restoring the value of count register for outerloop
    loop outer_loop  ;loop 5 times as cx intialize before outerloop
ret 
