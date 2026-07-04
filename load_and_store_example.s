this code taught me 
1 -> for bytes the ofsets can be any , not any rule like must divisible by n or soemthing else 
2 -> for bytes , when i debug this using gdb i will use x/bd instead of x/wd for word 

.section .data 
data_1 : .byte 10 
data_2 : .byte 20 
data_3 : .byte 30 
data_4 : .byte 40
data_5 : .byte 50 
result : .byte 0 
.section .text 
.global _start 
_start: 
    la t0 , data_1 
    la t1 , data_2 
    la t2 , data_3 
    la t3 , data_4 
    la t4 , data_5 
    la t5 , result 
    lb t0 , 0(t0)
    lb t1 , 0(t1)
    lb t2 , 0(t2)
    lb t3 , 0(t3)
    lb t4 , 0(t4)

    sb t0 , 0(t5)
    sb t1 , 1(t5)
    sb t2 , 2(t5)
    sb t3 , 3(t5)
    sb t4 , 4(t5)

    li a0 , 0 
    li a7 , 93 
    ecall 
_________________________________________________________________________________________________________________________________________________________________

