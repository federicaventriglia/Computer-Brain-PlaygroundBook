
import PlaygroundSupport
import UIKit

public var myVC = CodingViewController()

public func setup() {
    PlaygroundPage.current.liveView = myVC.instantiateFromStoryboard()
    PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["Did you know a CPU stores the data it needs in registers, every CPU has a different set and number of registers.","An arm register has 10 different registers named R1,R2,... that's where the CPU stores the data and addresses it needs from the memory before doing any action."], solution: nil)
}


