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
    daddi R2, R0, 8; <-index
    daddi R3, R0, 16; <-index

    daddi R10, R0, 240; <- end-clause

for:
    l.d F1, v1(R1)
    l.d F3, v3(R1)
    l.d F2, v2(R1)

    l.d F11, v1(R2)
    l.d F13, v3(R2)
    l.d F12, v2(R2)

    l.d F21, v1(R3)
    l.d F23, v3(R3)
    l.d F22, v2(R3)
    

    sub.d F10, F1, F2
    sub.d F20, F11, F12
    sub.d F30, F21, F22
    
    
    mul.d F9, F3, F3
    mul.d F19, F13, F13
    mul.d F29, F23, F23

    l.d F4, v4(R1)
    l.d F14, v4(R2)
    l.d F24, v4(R3)

    mul.d F7, F1, F3
    mul.d F17, F11, F13
    mul.d F27, F21, F23

    mul.d F6, F10, F9
    mul.d F16, F20, F19
    mul.d F26, F30, F29

    mul.d F8, F2, F3
    mul.d F18, F12, F13
    mul.d F28, F22, F23  

    mul.d F4, F4, F2
    mul.d F14, F14, F12
    mul.d F24, F24, F22

    mul.d F9, F6, F2
    mul.d F19, F16, F12
    mul.d F29, F26, F22

    sub.d F5, F7, F8
    sub.d F15, F17, F18
    sub.d F25, F27, F28

    add.d F7, F9, F4
    add.d F17, F19, F14
    add.d F27, F29, F24

    s.d F5, v5(R1)
    s.d F15,v5(R2)
    s.d F25,v5(R3)
    
    s.d F6, v6(R1)
    s.d F16,v6(R2)
    s.d F26,v6(R3)

    s.d F7, v7(R1)
    s.d F17,v7(R2)
    s.d F27,v7(R3)
    
    daddi R1, R1, 24
    daddi R2, R2, 24

    bne R1, R10, for
        daddi R3, R3, 24


end:

halt