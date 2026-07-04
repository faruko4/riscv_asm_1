.section .data 
.balign 4 
message_1 : .ascii "I  am learning Riscv-Asm\n"
message_func_1:
.equ message_1_len , message_func_1 - message_1 

message_2 : .ascii "I will master it anyhow !\n"
message_func_2:
.equ message_2_len , message_func_2 - message_2 

.section .text 
.balign 4 
.global _start 
_start: 
   #print message 1 
   li a0 , 1 
   la a1 , message_1 
   li a2 , message_1_len 
   li a7 , 64 
   ecall 

   #print message 2 
   li a0 , 1 
   la a1 , message_2 
   li a2 , message_2_len 
   li a7 , 64 
   ecall 

   li a0 , 0 
   li a7 , 93 
   ecall 
____________________________________________________________________________________________________________________________________
this is another and very usefull code i think 




.section .data 
message:  .ascii "hello world and again \n"
message_final :
     .equ message_len , message_final - message 
.section .text 
.global _start 
_start: 
    call  print_message 
    li a0 , 0 
    li a7 , 93 
    ecall 


    print_message:
        li a0 ,1
        la a1 , message 
        li a2 , message_len 
        li a7 , 64 
        ecall 
        ret
______________________________________________________________________________________________________________________________________

