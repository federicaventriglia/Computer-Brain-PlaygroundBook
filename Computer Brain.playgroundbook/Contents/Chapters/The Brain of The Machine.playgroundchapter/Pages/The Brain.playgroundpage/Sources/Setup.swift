import PlaygroundSupport
import UIKit

public var othervc = PartsViewController()
public func showCPU() {
    
    PlaygroundPage.current.liveView = othervc.instantiateFromStoryboard()
     PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["Of course every 'brain' is different, and that's the same for a CPU. Every block you see is not only way more complicated than how I showed you but it's also connected to every other part of a machine through a complex bus."], solution: nil)
}


