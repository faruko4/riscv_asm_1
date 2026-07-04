o I have lost my pervious note and  codes on riscv asm debugging now i am going to make a same new one 
so this is the  code that i have to debug 

.section .data 
number_1: .word 10 
number_2: .word 30 
result_1: .word 0 
result_2: .word 0 
.section .text 
.global _start 
_start: 
    addi sp , sp , -32
    la t0 , number_1 
    lw t0 , 0(t0)

    la t1 , number_2  
    lw t1 , 0(t1)

    la t2 , result_1 
    la t3 , result_2 

    add a0 , t0 , t1 
    mul a1 , t0 , t1 
    sw a0 , 0(t2)
    sw a1 , 0(t3)
    sw a0 , 0(sp)
    sw a1 , 4(sp)
    sw t0 , 8(sp)
    sw t1 , 12(sp)

    li t0 , 100 
    li t1 , 200
    add a0 , t0 , t1 

    lw a0 ,0(sp)
    lw a1 ,4(sp)
    lw t0 , 8(sp)
    lw t1 , 12(sp)

    addi sp , sp , 32 

    li a0 , 0 
    li a7 , 93 
    ecall 




i used  -> addi sp , sp , -32 
at the very first top of the code to define the stack , so i am in gdb and before execuiting this line i have found the stack 
memory address as 0x7f189bb557e0 .....and also after execuiting it i have now 0x7f189bb557c0 
0x7f189bb557e0  - 0x7f189bb557c0 is  what in decimal ? 
ans : 32 
so i have successfully allocated the stack with 32 byte alignment 

so after si on the sp i have now 0x7f189bb557c0 ......in the programme i have stored many things and all those are stored with offsets 
started form this sp  address 
(gdb) x/32gd 0x7fa5727627e0
0x7fa5727627e0: 1       140348566678223
1 is the first argument here ....->

(gdb) x/s 140348566678223
0x7fa572762acf: "./hello.elf"
(gdb) 

after a lot of step execution i have found the first address of t0 0x12000 
this is not random or garbage ...this is well aligned divisible by 4 
and the value of t0 defined in .section .data is in this valid address ...now 0x12000 holds 10
same to t1 
the valid address of t1 is 0x12004 which will hold  30 
the diffirence of 0x12000 - 0x12004 is 4 byte 
all done by the pc .......new pc = old pc + 4 

same to t2   , it will hold the address of result_1 which is 0x12008 
same to t3    , it will hold the address of result_2 which is 1200c 
so then i do the addition of  t0  and t1 
and then i do multiplication 
here i use the mul keyword , and this takes lower bits always 
so if i multiply 0x00001 * 0x00001 the full bit will be ->  0x00000_00001 
so here the lower bit is 0x00001 will be the result 
addi a0 , t0 , t1 
mul a1 , t0 , t1 
those results will be saved in result_1 and result_2 in order 

and also i have stored  them in sp  with offsets 
so to verify that the sp has the values or not i  have to use the 
command  with x/wd $sp + n .....n is the offsets that will be 
incriment
here n = multiply of 4 
so here is nothing to understand in this code 
so the main purpose is this code is to allocate the stack , add something and then put those result into stack and  then overwrite those those registers through diffirent value and then again load those 
value  form the stack to make sure that they are successfully in the stack and after all i have to deallocate them 
 
another most important thing is the ofsets numbers ....why i used only multiply of 4 here? this is the main thing to learn  from this code 

in general i use .align n ...here n = 2 to the pow n and then all those divisible number by it 
example :  
   .align 2  means 2 ^ 2 = 4 ...and  then all those alignment numbers will be those numbers which are divisible by 4 
   .align 3 means 2 ^ 3 = 8 ...and  then all those alignment numbers will be those which are divisible by 8 



but in some case  i dont use .align n then how i use alignment numbers or offsets....by default riscv registers are 32 bit means 4 byte 
so here simply i will use multiple of 4 ....as i used in this code to store value in the stack ....0 , 4 , 8 , 12 , 16 etc 
o


