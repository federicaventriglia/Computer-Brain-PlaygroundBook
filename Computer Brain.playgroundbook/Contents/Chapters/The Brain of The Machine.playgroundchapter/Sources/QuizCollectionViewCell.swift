import UIKit
@objc(QuizCollectionViewCell)
public class QuizCollectionViewCell:UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLbl: UILabel!
    
    public func config(answerText:String,answerImage: String) {
        self.layer.cornerRadius = 15
        self.imageView.image = UIImage(named:answerImage)
        self.answerLbl.text = answerText
    }
    public func vibrate(){
        let animation = CABasicAnimation(keyPath: "transform")
        animation.duration = 0.1
        animation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        animation.fromValue = NSValue(caTransform3D:CATransform3DMakeRotation(
            -CGFloat.pi * 0.01, 0, 0, 1))
        animation.toValue = NSValue(caTransform3D:CATransform3DMakeRotation(
            CGFloat.pi * 0.01, 0, 0, 1))
        animation.autoreverses = true
        animation.repeatCount = 4
        layer.add(animation, forKey: nil)
        
    }
}
