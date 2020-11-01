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
    daddi R10, R0, 240; <- end-clause

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
  
  
   
    
    sub.d F5, F10, F11  ;v1[i]*v3[i] - v2[i]*v3[i]
    mul.d F6, F12, F13  ;(v1[i]-v2[i])*v3^2[i]
    mul.d F4, F4, F2    ;v4[i]*v2[i]  


    s.d F5, v5(R1)      
    mul.d F8, F11, F5   ;(v2[i]*v3[i])*v5[i]  
    s.d F6, v6(R1)
    add.d F7, F8, F4    ;(v2[i]*v3[i])*v5[i]  + v4[i]*v2[i]
    s.d F7, v7(R1)

    
    mul.d F26, F22, F24
    mul.d F27, F23, F24
    mul.d F28, F24, F24
    sub.d F29, F22, F23
    
    sub.d F5, F17, F18
    mul.d F6, F19, F20
    mul.d F4, F21, F2
    s.d F5, v5(R2)
    mul.d F8, F18, F5
    s.d F6, v6(R2)
    add.d F7, F8, F4
    s.d F7, v7(R2)

  
    sub.d F5, F26, F27
    mul.d F6, F28, F29
    mul.d F4, F25, F23
    s.d F5, v5(R3)
    mul.d F8, F27, F5
    s.d F6, v6(R3)
    add.d F7, F8, F4
    s.d F7, v7(R3)

    bne R1, R10, for
        daddi R1, R1, 24

halt