import PlaygroundSupport
import UIKit

public var myVC = QuizViewController()

public func startQuiz() {
    PlaygroundPage.current.liveView = myVC.instantiateFromStoryboard()
    
    PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["1. It might be the most comfortable thing for you to enjoy Netflix but it most definitely does not have a brain.. just yet!","2. This instruction basically picks up data from one location and through the cpu bus transports it into another location which could be either a register or a memory address","3. The CPU doesn't direcly operate on the main Disk of a computer, it has a limited number of locations where it can store for a limited amount of time the data it needs to finish an operation."], solution: "1. Sofa \n 2. MOVE \n 3. It stores it in internal registers.")
}

