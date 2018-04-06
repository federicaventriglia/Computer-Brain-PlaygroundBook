//
//  DataSource.swift
//  LearnCPU
//
//  Created by Federica Ventriglia on 21/03/2018.
//  Copyright © 2018 Federica Ventriglia. All rights reserved.
//

import Foundation
import UIKit
public let question1 = ["microwave-oven.png","sofa.png","washing-machine.png","macbook.png"]


public enum BlockType {
    case Conditional
    case Loops
}

public class Question {
    var text: String = ""
    var answers: [String] = []
    var correctAnswer: Int = 0
    
    public init(text:String,answers:[String],correctAnswer:Int){
        self.text = text
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
public class CodeLine {
    var code: String = ""
    var description: String = ""
    public init(code:String,description:String){
        self.code = code
        self.description = description
    }
}
public class InstructionBlock {
    var lines: [CodeLine] = []
    var description: String?
    
    public init(lines:[CodeLine], description: String) {
        self.lines = lines
        self.description = description
    }
}
public class Part {
    var name: String?
    var image: UIImage?
    var description: String?
    
    public init(name: String, image: UIImage , description: String) {
        self.name = name
        self.image = image
        self.description = description
    }
}

//MARK: - Questions
let questions = [Question(text:"Which one of these object does not have a CPU?",answers:["microwave-oven.png","sofa.png","washing-machine.png","macbook.png"],correctAnswer:1),Question(text:"Which one of these instructions moves data from one location to the other?",answers:["MOVE","CMP","BEQ","B"],correctAnswer:0),Question(text:"Does a CPU use data straight from the memeory for its operations?",answers:["Yes, from the RAM Memory","No, it stores it in internal registers.","It doesn't use data at all","No, it's in the ALU."],correctAnswer:1),Question(text:"",answers:["","","",""],correctAnswer:0)]

//  MARK: - Code Blocks
let line1 = CodeLine(code:"CMP R4 #0",description:"Compares the value of the R4 register, where we stored our x variable with the value 0.")
let line2 = CodeLine(code:"BLE else",description:"If the result of the compare instruction isn't true then we jump to the else branch.")
let line3 = CodeLine(code:"MOV R5 #1",description:"If the result of the compare instruction is indeed true then execute the 'if' instruction, assigning #1 to y")
let line4 = CodeLine(code:"B end",description:"Once the if block has been processed we can jump to the end of the program, labeled with 'end'")
let line5 = CodeLine(code:"else :   MOV R5 #2",description:"the 'else' block, puts the value '2' into the y variable, stored in the register R5.")
let line6 = CodeLine(code:"end : MOV R0 R5",description:"Once we're done with the conditional we return, in the R0 register, the value of the 'y' variable, stored in the cpu registers.")
let line7 =  CodeLine(code:"BX LR",description:"Our instruction block has completed its execution and we can now exit.")
public let conditionalBlock = InstructionBlock(lines:[line1,line2,line3,line4,line5,line6,line7],description:"A conditional statement. The old if-then-else")


//MARK: - Components

public let newParts = [Part.init(name: "Registers", image: UIImage(named:"documentation.png")!, description: "Once the CPU gets some data from the memory it stores it in a set of registers, both for data and addresses.\n Different CPUs have different sets of registers and it changes based on the architecture."),Part.init(name: "ALU", image: UIImage(named:"math.png")!, description: "It's the mathematic's brain of the CPU, the only component able to actually tell you 1+1 equals 2. I know right? So smart."),Part.init(name: "Control Unit", image: UIImage(named:"traffic-light-2.png")!, description: "It's basically the mom of the CPU, it has to schedule everything that happens and make sure everyone is fed with the right information do to their job right."),Part.init(name: "Memory", image: UIImage(named:"random-access-memory.png")!, description: "Where all the data the processor needs to use to define operation is stored, it's external to the CPU and it requires a physical action that connects it to the memory cell")]

