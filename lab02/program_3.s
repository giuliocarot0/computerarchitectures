.data
    a: .byte  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30  
    b: .byte  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  res: .space 30

.text

main:
    daddi R1, R0, 0
    daddi R2, R0, 30

    for:
        lb R3, b(R1)
        lb R5, a(R1)
        while:
            slt R4, R3, R0
            bnez R4, endwhile
            beqz R3, endwhile
            andi R10, R3, 1
            beqz R10, update
                daddu R6, R6, R5 
            update:
                dsll R5, R5, 1
                dsrl R3, R3, 1
            j while    
        endwhile:
            sb R3, b(R1)
            sb R5, a(R1)
            sb R6, res(R1)
            daddi R1, R1, 1
            daddi R6, R0, 0
            
            bne R1, R2, for 

    halt













isOdd:
    