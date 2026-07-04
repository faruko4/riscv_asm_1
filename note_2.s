Learning form the pdf cpu.land 
aside = ak pashe 
qustion: 
add eax , 512  
and this is looks like 05 00 02 00 00 
but how does it converted into this ? 
the book said : 05 is the add opcode and 0x200 is for 512 



how does the fetch and execute cycle works ? 
-> read the instruction and the memory form the current instriction pointer and  then executing start form here and move the instruction pointer so  that it can start  again .......It means after executing the current instruction the pc get updated like the pc(pointer) moves forward  to immediately so that it can execute
the next one in order 

chugging -> moving slowly but in correct  order 
naive  -> very simple looking  
psyching-myself-out -> overthinking ,cognative overload 
sequentially -> in correct order 
leap -> means 
peripheral -> external 
manifest -> clear  , express 
procedure -> way , process 
delegate -> protinidhi in bangla 

___________
User mode has not given full control over the system for security reason but it need to use i/o and need to intaract with the kernel and the os  and so the kernel does it 

System-calls ->  system call is the way to connect the user space to the kernel so that it can do any operation 
in c when i use fork() , read() , write() , open()  , under the hood they all use systemcalls 
the interup number of linux is 0x80 
