startting form chepter 4 (Assembly language) 

10 reason to learn riscv asm 
1 -> easy to learn 
2 -> easy to learn
3 -> easy to learn 
4 -> easy to learn 
5 -> easy to learn 
6 -> easy to learn 
7 -> easy to learn 
8 -> easy to learn 
9 -> easy to learn 
10 -> easy to learn
______________________________________________________________________
before learning riscv asm i  must learn this 
1 -> a complete knowledge of how a cpu does works 
2 -> what is a control unit 
3 -> what is alu 
4 -> what is signed and unsigned .....(advance vew) 
5 -> what is ones compliment ?
6 -> what is 2's compliment ? 
7 -> basics of floating point 
8 -> all workflow of ram , cache , stack and heap 
9 -> all about general purpose registers , what are they 
10 -> what is programm counter or pc ?
11 -> what is stack pointer ? why ?
12 -> what is global pointer ? why ?
13 -> what is thread pointer ? why ?
14 -> what is hardwared zero ? and why we need this 
15 -> basics of abi
16 -> all basics shift operations 
-> how to diff  between memory and registers in real life 
 __________________________________________________________
I can run an old version of x86 code in present x86 ....this is for business , this is for legacy maintainence ,and also this saves a lot of time ...

what is a volatile vs a non-volatile memory 
volatile memory is a temporary memory like ram ....when the computer  shuts down , all data is gone 
non-volatile memory is a persistent data storage , dosent care about the computer is off or on ...but the data or memory will persist
_____________________________________________________________________________________
signed vs unsigned in depth 


some common pattern for signed and unsigned in  diffirent system 


4 bit system 

unsigned -> 0 to (2 to the pow 4) -1 ; 


signed: 
  max neg value  range -> 0 to (2 to the pow 4) / 2 ;
  max pos value range -> 0 to  {(2 to the pow 4) / 2} -1 ; 




8 bit system : 

unsigned -> 0 to  (2 to the pow 8) -1 ; 

signed -> 
   max neg value -> 0 to (2 to the pow 8) / 2 ; 
   max pos value -> 0 to {(2 to the pow 8) / 2} - 1 ; 




| Bits   | Signed (negative allowed)        | Unsigned (positive only) |
| ------ | -------------------------------- | ------------------------ |
| 8-bit  | -128 to +127                     | 0 to 255                 |
| 16-bit | -32,768 to +32,767               | 0 to 65,535              |
| 32-bit | -2 billion to +2 billion         | 0 to 4,294,967,295       |



_______________________________________
10000001   this is  binary number and what is this representing .....it depends on its signed or unsigned 

if its unsigned then it will be 
(1×128) + (0×64) + (0×32) + (0×16) + (0×8) + (0×4) + (0×2) + (1×1)  = 128 + 1 = 129
so if 10000001 is unsigned then the value will be 129
____________________________________________________________
0101010010 this is a binary ....and now i will find the signed value ...unlike unsigned signed contains both pos and neg ....but what about this binary ? is this 
neg or pos  ? in binary 0 is pos and 1 is neg...so here 0101010010 the msb is 0 it means this is positive

before mastering the 2's compliment i have to master the way to add 2 binaries 
0 + 1 = 1 
0 + 0 = 0 
1 + 0 = 1 
1 + 1 = 0 (carry 1)
1 + 1 + 1 = 1 (acrry 1) 
__________________________________
10101 is the 5 bit binary  what is the decimal of it  in signed + 2's compliment way 

here msb = 1 means its represents neg 
so first flip the value as 01010 
and then add 1 at lsb 
and then it will be 01011 
and the value will be -11 not 11 because the msb was 1 ...and 1 is neg so the main result will be 11  
____________________________________
now i will write a intentionnal worng way of sign magnitude 

another example :::::::
so the binary is 0101 
what is the signed value of this according to 2's compliment ?
here msb  is 0 means its positive 
now flip it as 1010 
now according to 2's compliment add 1 at last as 1011 
and the decimal of the 1011 is 11  
and that is + 11 not -11 because at the very first msb was positive
__________________this way is 100% worng 
fix : look at the binary first ....its 0101 .....msb = 0 means its positive and i dont need to do flipping or adding 1 at last .....because of the msb is 0 (pos)
i can directly convert it to decimal.....so the decimal of 0101 is = 5
______________________________________________________________
another example ::::::::
here comes the carry logic 
so the binary  is now 1010
so the msb is = 1 ...its negetive 
so first flip it as 0101 
add 1 at lsb according to 2's compliment 
and that becomes 0110....because 1 + 1 = 0 ....carry 1 ..and then 1 + 0 = 1 ...and then the whole binary become 0110 ....
and so the decimal value of the binary is 6 

as msb was neg so the result will be -6 insted of 6

__________________________________________________________________________________________________________________________________________________________________
lets talk about ones compliment again  before jump into 2's compliment 

another same example ::::::::::::::::::::::::

1's compliment 
the binary is 1010 
msb = 1 ....so 1 is negetive 
flip them all as 0101 
and then conver this to decimal ...no need to add 1 at lsb ..it will happens if it was 2's  compliment 
but as this is ones compliment ...adding 1 at last is not applicable 
so the decimal value is now -5 



2's compliment 
the binary is 1010 
msb is 1 means its neg
so filp it as 0101 
and then add 1 at lsb 
so it will  be 0110 .......here carry wrks because 1 + 1 = 0 . carry 1 ..and then 0 + 1 = 1 
so the decimal value of 0110 is -6 according to 2's compliment
______________________________________________________________________________________________________________________
what is memory alignment ? 
memory alignment is  simply a rules that is compitable for memory address for example : i am working on a 4 bit system ....so when i work with a data and with the memory address the address must be aligned for this 4 bit system .....how ? the address must be  devisible by 4 ....for example the address can be 0x2000 ,  0x0004, or 0x0008 .........those are all divisible by 4 ...if there any address exists that is not divisible by 4 , it will be misaligned 
---------------------------------------------------------
simply how does a c programme translate into native machine code ?
c programme -> complier -> assembly -> assembler -> native machine code




_____________________________________
what is stack in riscv asm ?
all about this line ->  addi sp, sp, -16 
addi -> add immediately a constant value 
sp -> stack pointer 
sp -> used for 2 time , 
----explain every single line of this code as simple as possible
lets write a c programme and then generate assembly according to it 

int main(){
    int x = 10 ; 
    int res = func(x) ; 
    return res + 1  ;
}
now a  asm code has been generated  accordint to this c code down bellow  
.text
.align 2
main:
addi sp,sp,-16
li a0,10
sw ra,12(sp)
jal func
lw ra,12(sp)
addi a0,a0,1
addi sp,sp,16
ret

_______________________
.text is for the text section , needed in every riscv asm programme 
what is memory alignment in riscv asm ?

syntax : .align n 

in riscv asm align 2 for example : 
align 2 means (2 to the pow 2) =  4 and then all those divisible numbers of 4 are the alignment offset for  .align 2 

align 3 means (2 to the pow 3) =  8 and then all those divisible numbers of 8 are the alignment offset for .align 3 


simply this only s
and that is a fixed rule 
main -> form here main code started execuituing 
addi sp , sp , -16 -> riscv asm dosent have any direct instruction for subtructing ...so if i add a neg value then it will automiticially sub it ...
here we are making an empty space in the stack  by adding a neg value and that is -16 ...and we must be deallocate(pop) it after using this 
li a0, 10 -> load immidiate 10 to a0 , and we have planed to use this value to the  function 
sw ra , 12(sp) -> sw means store word , ra means return address , 12(sp) is a offset where sp is the stack pointer and its the base address and ra is the source
address 
i  dont need to  lear about  any of jal and ret  because I havent learnt the basic syntax yet ..so its far more complex now 
jal func -> jal  stands for jump and link ...before jumping to anywhere cpu saved the previous val/addr so that after doing some of the function the cpu can exactly know where to return the value , and that is called linking  


load -> mem to reg 
store -> reg to mem 
what is the diffirence between register and memory according to load and  store ?
*memory is the ram 
*and register is the temp storage that is extremely fast for accessing data and to do math stufs 

I dont need to understand all because the  motherfucker who wrote this book ,never written this book for me ... i only understood about addi sp , sp ,16 
it means its deallocating the stack after using it ...and then  using ret for return 

_________________________The switch analogy of  bits__________________________

simply bit means switch and  switch means off and on 
 
if the bit is 1 and the posible combination of bits is 2 to the pow 1 = 2 = {1 , 0} ; 
if the bit is 2 and the posible combination of bits is 2 to the pow 2 = 4 = {10 , 01 , 11 , 00} ; 
and so on 



there are 32 general purpose registes but for register encoding we use  5 bit for each register 
because if we look closely we can see (2 to the pow 5 ) = 32 and so , there  are  32  possible combination here 
and this is well because riscv is by default 32 bit 

________________________________sign magnitude_____________________________________

so what is  sign magnitude ? 

the binary ->  sign -> magnitude -> value
0011       -> +1    -> 3         -> +3
 
msb = 1 =  neg 
msb = 0 = pos 


what is the problem is sign magnitude ? 
the biggest problem is addition and subtruction 
1 -> check the both 2 operand 
2 -> check the sign , if they are diffrient and then check magnitude 
3 -> sub form bigger to little 
4 -> chose the bigger  ones sign and then put the main value 


this looks simple but for hardware this cycle need extra cpu time , electricity , more instruction and memory space 
which is bad 


another problem in sign magnitude is the neg zero 
 
example : 
there will be a 4  bit value for example 0000 
and the msb is 0 and its the sign (pos) and then the right most 3 bits are 000
this is working perfectly if the msb is  pos 
and the value will be +0 ; 

but what if the msb was  neg ? 
example : 


the  binary is 1000 and here msb =1 means neg and  this the sign(+) ; 
and then magnitude is 000  , and the value is -0 
is neg zero exists ......zero is zero , this the biggest logical problem  

____________________________________sign extend________________________________
what is sign extend 
problem -> the computer always want to reads data as a fixed size or chunk , what if  i want to take a small number and put that 
into a bigger chunk ? 
solusion -> sign extend 

for example -8 in binary is  11111011 this is by default  8 bit
but what if i want to put it into a bigger chuck for say 16 bit 

its a little bit diffirent form zero extend , zero extend is good for unsigned numbers but what  for signed which contains both neg and  pos ? 
the main problem is  to work with the neg values
so according to sign extend if the msb is 1 then extend the bits with 1  with the desired chunk 
--> the 8 bit binary is 11111011  
--> the 16 bit binary is 11111111 11111011 

if msb is 0 and then use the zero extend method 
the 8 bit binary is = 01111011 
after sign extend(zero extend here actually ) -> 00000000 01111011


what is a elf file ...? 
-> elf stands for execuitable and linkable format
#include<stdio.h>
int main(void){
    return func(10) ;
}

when i compile this file  using gcc file.c -o file 
and then it will create a compiled file .. file.o is an object file which contains all the functions , lebels , and some metadata and those are furnished with a format 
called the elf 

int main(){
    return func(10) ;
}
main: 
  li a0 ,  10 
  jal func 
  ret 

what are labels in riscv asm ?

labels are markers , that start with a name and ended with a suffix ":" 
for example 
message: 
    .ascii "hello world\n" 
here message is a label starts with : 


in c -> 
int x = 10 
int sum10(){
   return x + 10 ;
}

in asm -> 
x: 
 .word 10 
sum10: 
 lw  t0 , x 
 addi a0 , t0 , 10 
 ret

expl -> x and sum10 is a label here started as a marker and ended  with  the prefix ":" 
before addding something i have to load first ....i have to use lw (load word) because the value in x as a word , 
so lw t0 , x
and then the main  value will go through a0 and  the t0 holds the value 10 temporaryly 
addi a0 , t0 , 10 -> it means a0 = t0 + t0 
key point here : I have to remember always that addi takes an immediate value at last instead of an register 
worng way -> addi a0 , t1 , t2 
right way -> addi a0 , t1 , 10 
and then using ret keyword to return as we returned in the c code 

what is .word ? 
.word refers to 4 byte  means 4 * 8  = 32 bit 


before anything else lets just see some of the common intiger to binary pattern 
Here are the binary forms for all those integers:

- **8** → `1000`  -> 2 to the pow 3 
- **16** → `10000` -> 2 to the pow 4 
- **32** → `100000` -> 2 to the pow 5 
- **64** → `1000000` -> 2 to the pow 6 
- **128** → `10000000` -> 2 to the pow 7 
- **256** → `100000000` -> 2 to the pow 8 
- **512** → `1000000000` -> 2 to the pow 9  
- **1024** → `10000000000` -> 2 to the pow 10
- **2048** → `100000000000` -> 2 to the pow 11 
- **4096** → `1000000000000` -> 2 to the pow 12 
- **8192** → `10000000000000` -> 2 to the po2 13 

As i can see, they are all powers of 2, so each binary representation is a `1` followed by a number of zeros equal to the power of 2 


another example : -> 
x: 
 .byte 130 
lb a0 , x 



the binary of 130 is 10000010
here msb is = 1 means negetive 
according to 2's compliment i have to flip first like 01111101 
and  then add 1 at last like 1 + 1 = 0 , carry 1 
then the final binary will be 01111110 
and then the decimal of the binary is now  -126
and so the lb will read the value form the memory to reg  -126 to a0 
its fully correct 

$serious qustion -> In the top of the lebel i used .byte 130 , My  desired value is 130 and to work it with but as i used lb means load byte , and by default it treats as signed , if i want to use unsigned then i explicitly have  to use lbu  

so as i used lb the binary value is now 10000010 , so this is 8 bit and then for  32 bit system the cpu will use sign extend or zero extend 
here i used lb so signed extend , .....so the  32  bit value will be 11111111 11111111 11111111 10000010 , 
now like previous rule , flip and add zero and we got the new value -126 , which i not our desired value 

personal intuition to use the same value as desired  can be worng -> 

to use the desired value only i have to use in unsigned way (lbu instead of lb) ; 
so the value in lebel is x: .byte 130 ; 
and then the  binary is 10000010 , here sign extend will not work , instead zero extend will work perfectly 
so the 32 bit value will be 00000000 00000000 00000000 10000010  after extention with zero .....zero is pos because unsigned  only take pos
so the value become 130 , no flipping or adding needed  becasuse i explicitly told this is unsigned 
key point : in riscv asm if i decalred a value in the  top of the level and want to use the same value as desired i explicity use some of the 
spesefic unsigned registers , ...here not lb , its lbu ......so done 

next target is to understand this code line by line ...and if i understand when to use load and when to store , then i will be successful 
section .data
x: .word 10

section .text
update_x:
    la t1, x
    sw a0, (t1)
    ret

section .data
y: .word 12

section .text
update_y:
    la t1, y
    sw a0, (t1)
    ret

all i need to know is the memory layout 
-> data segment  -> where the veriables and data are declared to use now or later in the programe
-> text segment  -> where functions , codes  are included  
-> stack segment -> used for local veriable and fucntion calls , return addresses , fucntion paramiters it always moves to the downword to the free space  
-> heap segment ->  to arrage data dynamicially  , it moves to the upword to the free spaces 


simple and basic diagram about stack and heap 


____________________________________________
                                           |       the stack goes downword  
  The stack                                |
                                           |  
   in c arr[2]                             |
                                           |
                                           |
                                           |
                                           |
___________________________________________|
                                           |
                                           |
   free space                              |
                                           |
                                           |
                                           |
___________________________________________|
                                           |
   heap (malloc , new())                   |          the heap goes upword to the free space 
                                           |
                                           |
                                           |
                                           |
___________________________________________|

an simple c code example 
 
file : raw.c 

int val  = 10 ; 
static int val = 100 ; 
char buff[2] ;
const  char *message = "hello world" ; 
int main(void){
    char buff[2] = {1 , 2} ; 
    int *size = (int *)malloc(sizeof(int) * 2) ; 
}
explanation for raw.c 


int val = 10 ; this is a global veriable is like the .data section for riscv asm 
static int val = 100  ; this is a static veriable , means the veriable  with the allocated memory will persist till the programme end 
char buff[2]  ; is this like the .bss section in riscv asm , that indicate a memory space that will use later but it is uninitialized first 
const char *message = "hello world" ; this is like .rodata in riscv asm that are read only, cannot be modified or changed

int main(void){
    char buff[2] = {1 , 2} ; this is pure stack 
    
    int *size = (int *)malloc(sizeof(int) * 2) ; this is heap 
}


i am learning about when to use load and when to store 

so the simple  example is :

.section .data 
number1 : .word 10 
number2 : .word 20 
result : .word 0 

.section .text 
.global _start 
_start:
  la t0 , number1 
  lw t0 , 0(t0) 

  la t1 , number2 
  lw t1 , 0(t1)

  add a0 , t0 , t1 

  la t2 , result 
  sw a0 ,0(t2) 


  li a0 , 0 
  li a7 , 93 
  ecall 

the code will never execuite ....seg fault will happens deeply ...i dont want to execuite this code ...insted i just want to understand what is load , store , la , li , lw and much about offset 


key  point : pesudo code in high level language like  c  and rust only use for understandings not for execuiting
but in  riscv there are a lot of pesudo instruction that can be execuited directly through machine code , unlike high level language 



what is a real address ? 
ans : real address = base address + offset 
example : 
li t6 , 0x140 
lw t0 , 0(t6) # base = 0x140 , off = 0 ......real address = 0x140 + 0 = 0x140  
lw t1 , 4(t6) # base = 0x140 , off = 4 ......real address = 0x140 + 4 = 0x144 
lw t2 , 8(t6) # base = 0x140 , off = 8 ......real address = 0x140 + 8 = 0x148 

what is the fucking concept behind offset ? how offset works in  riscv asm ? 
for lb -> ofset can be anything like 1 , 2 , 3 , 4 , 5 , 64 ,322 etc anything 
for lh -> (half word) -> offset must be divisible by 2 and will start form 0 
for lw -> (load word) -> offset must be divisible by 4 and will start from 0 , or it will misaligned 



---> what is sign extend ? 
how it  works -> 
if the msb of sign bit is = 0  then it is pos and then fill and extend all bits with 0 
if the msb of sign bit is = 1  then it is neg and then fill and extend all bits with 1 

4 bit to 8 bit extention 

4 bit -> 0101 
here msb is = 0 means pos  so the 8 bit result will be 00000101 

4 bit -> 1010 
here msb is = 1 means neg so the 8 bit result will be 11111010 

this is called the sign extend 

----> what is zero extention ? 
main rule -> always fill heigher bits with zero at left 

4 bit to 8 bit extention 

4 bit -> 0110 
8 bit -> 00000110  ,vales are same as before .this extention method cant chnage the value 
......another simple diagram that will help me a lot 
High Address
┌─────────────┐
│   Stack     │  ← grows DOWN (sp decreases)
│   ↓         │
├─────────────┤
│   Heap      │  ← grows UP (malloc/brk)
│   ↑         │
├─────────────┤
│   .bss      │  ← uninitialized global
├─────────────┤
│   .data     │  ← initialized global
├─────────────┤
│   .text     │  ← code (read-only, executable)
└─────────────┘
Low Address


_____________________________________the cpu instruction cycle________________________________
cpu does everything in 3 step -> fetch->decode->execute

fetch -> First of all  pc has set before this fetch cycle ...for example in the pc : load 100 ..........the pc cannt do anything alone ..so first of all the pc 
just  send thi data to MAR(the memory address register)  and this holds the actual memory addesss of the register..and then it goes to MDR ....memory data register and this actually holds the real value ...so the value = 100 here  .....and then form mdr , the full instructions are send to IR(instruction register) to fetch 
finally and then update the pc one step forward and this happens pararally with this fetch process to continue the  next fetch process sooo 
the new pc = old_pc + 1 and now its ready to do deocode 

decode ->  what  actually happens here ? CU(control unit) does everything here .....it first of all sees only the IR(instruction Registers)...and  then find opeocde and operands ...for example : IR = ADD 100 ...here opcode = ADD and operand = 100 
opcde -> what to do ? ADDITION,  SUBTRUCTION , MULTIPLICATION or DIVISION ? 
operand ->  whare to do it with ? EXMple :  do addition with 500 so 500 is the operand 

EXAMPLE : addi a0, t0 , t1 
here addi is the opcode and a0 , t0 , t1 is the operand 

and this is step(decode) it  just prepare finnaly to execute next 


execute -> everything has been prepared in the fetch and decode step...so here just execuite it in machine code directly .ALU(Arithmetic logic unit) done everthing
here 
after  execuiting , the fetch startes again form where the pc has  been set before....for now its now_pc = old_pc + 1 ...so it will start fetch , decode and executeform old_pc +1 



_____________________________________________intiger registers in riscv assembly____________________________________
temporary regitsers -> t0 to t6 ->  7 ->caller 
saved registers -> s0 to s11 -> 12 -> callee 
argument registers -> a0  to a7 ->  8 -> caller 
special registers -> sp ,ra ,  gp , zero , tp 
     sp -> stack pointer 
     ra -> return address 
     gp -> global pointer 
     zero(x0) -> hardwared zero 
     tp -> thread pointer 

now the main qustion  : what is caller and what is callee ?  
 

for example : 

main:     ------> here main is the caller  
   li t0 , 10 
   li t1 , 20 
   call sum 
sum :     ------> here sum is the calle 
    add a0 , t1 , t2 
    ret



caller -> who  calls 
callee -> who is called by the caller 

lets dive more deep in caller and callee as much as i can 

file : learn_callier_callee.s 

main:  

   li t0 , 10  
   addi sp ,sp , -16 
   sw t0 , 0(sp)


   call func1
   lw t0 , 0(sp) 
   addi a0 , t0 , 20 
   addi sp , sp , 16 


main point of vew : i have to rememebr always that temporary and argumental registers are  always caller-saved  registers ...so i have to save them manually or 
might lost the value after calling another  fucntions ....so to make  this t0 or a0 persit till the last of the  programme i just have to save the value before 
calling the another function ...so i saved this in the stack 

I am struggling learning  those simple concepts according to the riscv analogy 

file : main.s 

main: 
   li s0 , 100 
   call func_1 
func_1: 
   addi , sp , sp , -16 
   sw s0 ,0(sp)

   li s0 , 200  
   addi a0 , s0 , 122 

   lw s0 , 0(sp)

   addi sp , sp , 16 
   ret 

task : I will find all about calle and caller form  here 

who is caller here ?-> main: (who calls !) ;
who is callee here ?-> func_1: (who is called !) ; 

here in : i dont know 
        :func_1 : all those registers  have to be saved is the full reponsibilites for calee   



_____________________
what is directives in assembly ? 

.sectio .data 
number1 : .word 10 ...here .word  representing the value 10 as an 32  bit sized value to  the assembler ...and .word is a directives ....i  have to remember 
that , in riscv asm directives are started form  "." this  dot .....like .word  , .bytes  , .org ,etc 

_____________________________________________pesudo instructions__________________________________________
the  magic of pesudo instructions: Pesudo instructions are those which are not mentioned in  the official isa but can be execuited by the cpu ....what actually 
happens when i use a  pesudo instruction , is the cpu  just take a similier native instructions that does the same as the pesudo code 
for example : 
    mv dst , src    ->addi dst , src , 0 
    nop             ->addi 0 , 0 , 0 

so the main  thing is a pesudo code can be taken but the cpu only execuite the similer native instruction into machine code 


_________________________________________________
so   what is the  diffirence 

