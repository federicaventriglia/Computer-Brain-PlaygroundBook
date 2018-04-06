//#-hidden-code
import UIKit
//#-end-hidden-code

//: [Previous](@previous)
/*:
 
 ## Assembly Language
Each program was initially written by a human in a human-friendly programming language like Swift. Of course those languages take up a lot of unnecessary space and contain stuff the CPU doesn't really need to execute that's why they're compiled and stored into bits of 0's and 1's.
 
 Assembly Languages make it possible to avoid the automated process of compiling thanks to a set of low level instructions that the CPU is able to fetch and execute.

 It's important to do to understand how everything that looks so simple for us actually takes up a lot of building up to it.
 As shown in the following examples, assembly statements are structured in the following way:
 
    `1 label: instruction`
 #### Conditionals
Let's start by learning how to represent in assembly the “if-then-else” construct of Swift (and other high-level languages). It's all about moving bits from one register to the other and comparing values of binary data.
Let us consider a Swift code fragment containing a conditional, such as this:
 ```
 var x,y;
 ...
 if(x>0) {
     y=1
   } else {
     y=2
   }
  return y
 ```
Let's assume we're going to store the variables in the R4 and R5 registers, you can use the live view to see what the code will look like.
Tap `Run My Code` to show the Assembly code, if you tap on an instruction line you'll see the explaination of what it does.
 
[Next](@next)
*/
//#-hidden-code
setup()
//#-end-hidden-code

