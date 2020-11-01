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
    daddi R2, R0, 240; <- end-clause

for:
    l.d F1, v1(R1)
    l.d F2, v2(R1)
    l.d F3, v3(R1)
    sub.d F10, F1, F2
    l.d F4, v4(R1)
    mul.d F5, F10, F3
    mul.d F4, F4, F2


    mul.d F6, F5, F3
    mul.d F8, F6, F2
    add.d F7, F8, F4
    s.d F5, v5(R1)
    s.d F6, v6(R1)
    s.d F7, v7(R1)
    daddi R1, R1, 8
    
    l.d F1, v1(R1)
    l.d F2, v2(R1)
    l.d F3, v3(R1)
    sub.d F10, F1, F2
    l.d F4, v4(R1)
    mul.d F5, F10, F3
    mul.d F6, F5, F3
    mul.d F4, F4, F2
    mul.d F8, F6, F2
    add.d F7, F8, F4
    s.d F5, v5(R1)
    s.d F6, v6(R1)
    s.d F7, v7(R1)
    daddi R1, R1, 8
    
    l.d F1, v1(R1)
    l.d F2, v2(R1)
    l.d F3, v3(R1)
    sub.d F10, F1, F2
    l.d F4, v4(R1)
    mul.d F5, F10, F3
    mul.d F6, F5, F3
    mul.d F4, F4, F2
    mul.d F8, F6, F2

    add.d F7, F8, F4
    s.d F5, v5(R1)
    s.d F6, v6(R1)
    s.d F7, v7(R1)
    
    bne R1, R2, for
    daddi R1, R1, 8

halt