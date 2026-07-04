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
.section .data 
value_1 : .hword 10  
value_2 : .hword 20 
value_3 : .hword 30 
value_4 : .hword 40 
value_5 : .hword 50 
result : .hword 0, 0 , 0 , 0 , 0 # this prevent buffer overflow  
.section .text 
.global _start
_start: 
    la t0 , value_1 
    la t1 , value_2 
    la t2 , value_3 
    la t3 , value_4 
    la t4 , value_5 

    la t5 , result 

    lhu t0 , 0(t0)
    lhu t1 , 0(t1)
    lhu t2 , 0(t2)
    lhu t3 , 0(t3)
    lhu t4 , 0(t4)

    sh t0 , 0(t5)
    sh t1 , 2(t5)
    sh t2 , 4(t5)
    sh t3 , 6(t5)
    sh t4 , 8(t5)

    li a0 , 0 
    li a7 , 93 
    ecall 
___________________________________________________________________________________________________________
doing the code again and again gives the mastery 
.section .data
value_1 : .word 10
value_2 : .word 20
value_3 : .word 30
value_4 : .word 40
value_5 : .word 50
result :  .word 0 , 0 , 0 , 0 , 0
.section .text
.global _start
_start:
   la t0 , value_1
   la t1 , value_2
   la t2 , value_3
   la t3 , value_4
   la t4 , value_5
   la t5 , result

   lw t0 , 0(t0)
   addi a0 , t0 , 0

   lw t1 , 0(t1)
   addi a1 , t1 , 0

   lw t2 , 0(t2)
   addi a2 , t2 , 0

   lw t3 , 0(t3)
   addi a3 , t3 , 0

   lw t4 , 0(t4)
   addi a4 , t4 , 0

   sw a0 , 0(t5)
   sw a1 , 4(t5)
   sw a2 , 8(t5)
   sw a3 , 12(t5)
   sw a4 , 16(t5)

   li a0 , 0
   li a7 , 93
   ecall 
__________________________________________________________________________________________________________

