.data
    v1: .double 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
    v2: .double 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
    v3: .double 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
    v4: .double 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29

    v5: .space 240
    v6: .space 240
    v7: .space 240
    
.text

main:
    daddi R1, R0, 0; <-index
    daddi R10, R0, 216; <- end-clause

for:
    l.d F1, v1(R1)
    l.d F3, v3(R1)
    l.d F2, v2(R1)
    l.d F4, v4(R1)

    daddi R2, R1, 8

    l.d F14, v1(R2)
    l.d F15, v3(R2)
    l.d F16, v2(R2)
    l.d F21, v4(R2)

    daddi R3, R1, 16

    l.d F22, v1(R3)
    l.d F23, v2(R3)
    l.d F24, v3(R3)
    l.d F25, v4(R3)

    mul.d F10, F1, F3 ;v1[i]*v3[i]
    mul.d F11, F2, F3 ;v2[i]*v3[i] 
    mul.d F12, F3, F3 ;v3[i]*v3[i]
    sub.d F13, F1, F2 ;v1[i]-v2[i]

    mul.d F17, F14, F16 ;v1[i+1]*v3[i+1]
    mul.d F18, F15, F16 ;v2[i+1]*v3[i+1] 
    mul.d F19, F16, F16 ;v3[i+1]*v3[i+1]
    sub.d F20, F14, F15 ;v1[i+1]-v2[i+1]
  
    mul.d F26, F22, F24
    mul.d F27, F23, F24
    mul.d F28, F24, F24
    sub.d F29, F22, F23
    
    sub.d F5, F10, F11  ;v1[i]*v3[i] - v2[i]*v3[i]
    mul.d F6, F12, F13  ;(v1[i]-v2[i])*v3^2[i]
    mul.d F4, F4, F2    ;v4[i]*v2[i]

        sub.d F8, F17, F18
        mul.d F30, F19, F20
        mul.d F21, F21, F15

            sub.d F9, F26, F27
            mul.d F31, F28, F29
            mul.d F25, F25, F23
          
    mul.d F7, F11, F5   ;(v2[i]*v3[i])*v5[i] 
    s.d F5, v5(R1) 
    s.d F6, v6(R1)

        mul.d F10, F18, F8
        s.d F8, v5(R2)

    add.d F7, F7, F4    ;(v2[i]*v3[i])*v5[i]  + v4[i]*v2[i]
   
        s.d F30, v6(R2)
        add.d F10, F10, F21

    
            mul.d F11, F27, F9
            s.d F9, v5(R3)
            s.d F31, v6(R3)

    s.d F7, v7(R1)
    
        s.d F10, v7(R2)

            add.d F11, F11, F25
            s.d F11, v7(R3)



    bne R1, R10, for
        daddi R1, R1, 24

halt