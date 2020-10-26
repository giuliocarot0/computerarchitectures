.data
    v1: .double  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 
    v2: .double  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 
    v4: .double  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25
    
    v3: .space 200    
    v5: .space 200

.text


main:
    daddi R10, R0, 0   ;index   
    daddi R11, R0, 200 ;exit-condition
    
    do: 
            l.d F1, v1(R10) 
            l.d F2, v2(R10)
            mul.d F3, F1, F2
            l.d F4, v4(R10)
            mul.d F5, F3, F4
            s.d F3, v3(R10)
            s.d F5, v5(R10)
            daddi R10, R10, 8
    while:
            bne R10, R11, do

halt

