Everything will be fine if i master only load and sotre 
all about load and sore.....this only thing will cover almost 70% of all riscv asm  

______________________________________________so the code is -> 


load -> memory to register 
store -> register to memory 
lb rd , offset(src) 
for load -> dst first 
sb rs2 , offset(src) 
for store -> src first 


b -> byte -> 8 bit -> 1 byte 
h -> half-word -> 16 bit -> 2 byte 
w -> word -> 32 bit -> 4 byte 
d -> double-word-> 64 bit -> 8 byte 


reminder -> word always for 32 bit system , and double word is for 64 bit system ...but if i use word in a 64 bit system it will be still 32 bit even the architecture is 64 bit 

.section .data
number : .word 10

.section .text
.global _start
_start:

 la t0 , number
 lw t0 , 0(t0)

 addi t2 , t0 , 1

 la t3 , number
 sw t2 , 0(t3)

 li a0 , 0
 li a7 , 93
 ecall

Qustion -> We are loading number for 2 times ...la t0 , number ...... la t3 , number .........before storing the updated value we just loded this again but why ..? why again ? insted of loading the address of number again cannot we use the t0 register where we loded the  address of number beofre ? ......

answer : here is the main twist .....in riscv asm....a register  cannot hold value and memory address of it at the same time 

for example :
la t0 , address # t0 has now the address
#do some stuff 
lw t0 , 0(a0)   # t0 has now the value but the previous holded address  is distroyed 

now i will write a bad code where i use the same register for both holding the value and memory address 
example :

.section .data
number : .byte 10

.section .text
.global _start
_start:

 la t0 , number       # t0 = address

 addi t2 , t0 , 1     # t2 = 10 + 1 = 11

 sb t2 , 0(t0)        # store 11 back to the address in t0

 li a0 , 0
 li a7 , 93
 ecall


fix : insted of using the same register for both mem addr and value is worng for long term project , insted i should  use diffirent register one for memory address and another for holding real value 


32 bit riscv asm has 5 regsiter to load form the memory
lw -> load word 
lb ->load byte 
lbu -> load byte unsigned 
lh -> load half word 
lhu -> load half-word unsigned 


_______________________________________________
syntax of lw instruction -> lw rd , imm(rs1)  # where rd is the dst and rs1 is the source reg 



deep qustion : when to use li and when to use la 
lets fix this by 2 example . one for li  and another for la 
.section .data
my_number:  .word 0x1234ABCD
result:     .word 0x00000000

.section .text
.global _start

_start:
    la t6, my_number
    lw t0, 0(t6)

    la t6, result
    sw t0, 0(t6)

    li a7, 10
    ecall

fix : see this code in the .data section where we have  already given a value or address , we will load that value or address using la
an if there was  no value or address then we will use li and use a custom address that are not given in the .data section like t0 , 0x122

for example :

.section .data
result:     .word 0x00000000

.section .text
.global _start

_start:
    li t6, 0x140      #for operation we need atleat 2 addr or value for this type of code...
                      # but one has given and  another is not ...so we have to define  this address explicitly 
                      # for this i must use li t6 , 0x140 
    lw t0, 0(t6)
    
    la t5, result
    sw t0, 0(t5)
    
    li t6, 0x200
    sw t0, 0(t6)
    
    li a7, 10
    ecall

_________________________________________________
intentional mistake to learn : never store a garbage value or address back the main memory 
.section .data 
result_1 : .word 0x1000 
result_2 : .word 0x1004 


li t0 , 0x2000  # load the address 0x2000 imm 
lw t1 , 0(t0)   # load the word from t0.....word = 0 + 2000 = 2000 
lw t2 , 4(t0)   # load the word from t0.....word = 4 + 2000 = 2004 
lw t3 , 8(t0)   # load the word form t0.....word = 8 + 2000 = 2008 
add a0 , t1 , t2 
add a1 , t2 , t3 

la t5 , result_1 
la t6 , result_2 

sw t5 , 0(a0)
sw t6 , 0(a1)


li a0 ,  0 
li a7 , 93 
ecall 


expl : no value has been added here ...addition res contain the garbage value , load and storing also contains the garbage value

fix : I have to chnage my mind , that the way i have coded before 

intentional worng  code (raw pesudo...no need for correct syntax ....need the correct theme)

addr = 0x1000 
la t0 , addr 
li t1 , 10 
sw t0 , 0(t1)

fix : if i use la ..i must have to load the word or the bytes first to store any value in it  
the correct code :  

addr = 0x1000 
la t0 , addr 
lw t0 , 0(t0)
li t1 , 10 
sw t0 , 0(t1)



__________________________________________________________________________
.section .data
result_1 : .word 0x1000
result_2 : .word 0x1004

array : .word 10 , 20 , 30 , 40

.section .text
.global _start
_start:
  la t0 , array
  lw t1 , 0(t0)
  lw t2 , 4(t0)
  lw t3 , 8(t0)
  lw t4 , 12(t0)

  add a0 , t1 ,  t2
  add a1 , t3 , t4

  la t5 , result_1
  lw t5 ,0(t5)

  la t6 , result_2
  lw t6 , 0(t6)

  sw a0 , 0(t5)
  sw a1 , 0(t6)

  li a0 , 0
  li a7 , 93
  ecall
____________________________________________________________
.section .data 
result_1 : .word 0x1000 
result_2 : .word 0x1004 
result_3 : .word 0x0008 
data : .word 10 , 20 , 30 , 40 

.section .text 
.global _start 
_start: 
  la t0 , data 
  lw t1 , 0(t0)
  lw t2 , 4(t0)
  lw t3 , 8(t0)
  lw t4 , 12(t0)

  add a0 , t1 , t2 
  add a1 , t2 , t3 
  add a2 , t3 , t4 

  la t5 , result_1 
  lw t5 , 0(t5)
  la t6 , result_2 
  lw t6 , 0(t6)

  #t7 is not exists so what the fuck i will do now ? 
  # now  i will use a0-a6
  la  a3 , result_3 
  lw a3 , 0(a3)

  sw a0 , 0(t5)
  sw a1 , 0(t6)
  sw a2 , 0(a3)

  li a0 , 0 
  li a7 , 93 
  ecall 


qustion ->
is this valid in asm to write -> 
lh t0 , 6(t6)
lb t1 , 7(t6)

why for load-half-word allowing 6 as a offset ? 
for bytes the offset can be any value because 1 bytes are always in everything ..and the simple analogy is that 1 can devided all numbers .................so every size of system contains 1 bytes so i can use any number for offset for lb  



lh means half word --> half word size os 16 bit , 2 byte ....
offsetting rules for half word -> i only can use those number as offset which is divisible by 2 


-> what is lbu ?
-> load byte unsigned 
key point : it uses the zero extend to fill the rest of the register 

-> what is lhu ? 
-> load half-word unsigned 
load -> read form memory 
half-word -> 2 byte , 16 bit 
unsigned :  zero extend

what happent to register after using lhu ?
upper 16 bit fill up with Zero and lowser 16 bit  loaded form the memory 

critical qustion -> is lwu and ldu exists like lbu and lhu  ? 
answer -> "unsigned value and zero extend only need where the loaded data or value is smaller then the actual register"  
in risc32 system all register  are 32 bit by default .....so when i use bytes and half-words i will use zero extend and can use unsigned value if need .....but risc32 == word and risc32 < double-word ...but the unsigne method only works for when the loaded data is smaller then the register ..............soooooooooooooooooooooooooooooooooooooooooooooooooo
so that is the main reason why ldu and lwu dont exists because they are meanningless 


