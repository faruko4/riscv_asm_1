So in this file i will note  down everything about basic memory management and memory alignment 

what is the diffirence between .align n vs .p2align vs .balign 

so what is .align n ? 
-> n -> 2 to the pow n 
if .align 2 
    it means 2 to the pow 2 = 4 and then all the divisible numbers by 4 will be well align memory address 
if .align 3 
    it means 2 to the pow 3 = 8 and then all the divisible numbers by 8 will be wlll aligned memory address 

so what is .p2align ? 
-> from the name we can assume that  power of 2 ...and this is as same as .align 2  
but more explicity  , more readable and more recommanded..
pro tip -> p3align or pnalign dosent exists 

what is .balign n ? 
this might be the best overall ...very readable and easy to calculate 

n = simply the bytes directly that i want the memory to align  with 
.balign 2
means 2 byte alignment ...means the address will be divisible by 2 with 0 reminder 



ok so i see sometimes i dont use any explicit alignment method like this ..i didnt use any .align or .balign 
but in this case how can do anything 

me : riscv base registers are 32 bits 
qwen : "RISC-V Base Instructions are 32-bit (4-byte aligned). But with C-extension, instructions can be 16-bit (2-byte aligned). Always check if C-extension is enabled" 
so in riscv all the instructions are 32 bits means 4 byte so i can use 4 as the offsets of memory byte by default 
if i use .byte -> sb , a0 , 0(sp) .........sb a1 , 1(sp).....offsets -> anything 
if i use .hword -> sh  , a0 , 0(sp) ... sh a1 , 2(sp) ......ofsets -> multiple of 2 
if i use .word -> sw a0 , 0(sp) ....sw a1 , 4(sp) .......ofsets -> multiple of 4 

so the thing is when i use .balign 4 what happens actually ?
for example -----
.section .data
.balign 4
greeting:
    .ascii "Hello, World!\0" 


how .balign 4 actually affecting the programme ? 
so  here the size of the string with null terminator is 14 bytes 
I thought earlier that, this makeing the address of hello world's each charecter divisible by 4 ....but this is worng 
because .balign only affect to the first charecters memory address like it directly made 'H' -> 1200  but then e -> 1201 and l -> 1202 ...simply increase 1 byte percharecter 
so this is the fact .....this is only affects on the first charecter
