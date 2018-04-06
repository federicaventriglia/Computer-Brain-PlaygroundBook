
import Foundation

import UIKit

@objc (WinningViewController)
class WinningViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(lowerColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),upperColor:#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        // Do any additional setup after loading the view.
        
        UIView.animate(withDuration: 2.0, animations: {() -> Void in
            self.imageView?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 2.0, animations: {() -> Void in
                self.imageView?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
    }


func setGradientBackground(lowerColor: UIColor, upperColor: UIColor) {

    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.view.bounds
    gradientLayer.colors = [lowerColor.cgColor, upperColor.cgColor]
    gradientLayer.locations = [0.5, 1.0]
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)

    let sublayersCount = view.layer.sublayers?.count ?? 0
    view.layer.insertSublayer(gradientLayer, at: 0)

    view.layer.layoutSublayers()

}


public override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

}
