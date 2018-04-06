import Foundation

import UIKit
import PlaygroundSupport

@objc (PartsViewController)
public class PartsViewController: UIViewController {
        
    //Variables
    var tappedComponent = 0
    
    //Popover func
    public func showPopover(for sender: Int) {
        // Put the view that'll be shown as a popover in a variable
        let popover = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "idPop") as! PopViewController
        
        // set the two control properties of the popover view
        popover.selectedVideoTitle = newParts[sender].name
        popover.message = newParts[sender].description
        popover.partImage = newParts[sender].image
        popover.modalPresentationStyle = UIModalPresentationStyle.popover
        
        popover.popoverPresentationController?.backgroundColor = #colorLiteral(red: 0.1599155366, green: 0.1683007777, blue: 0.2113953829, alpha: 1)
        popover.popoverPresentationController?.delegate = self
        popover.popoverPresentationController?.sourceView = self.view
        popover.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: self.view.frame.width/1.5, height: self.view.frame.height/4)
        popover.popoverPresentationController?.permittedArrowDirections = .any
        popover.preferredContentSize = CGSize(width: 300, height: 300)

        
        self.present(popover, animated: true, completion: nil)
    }

    //Action
    @IBAction func selectedPart(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
            showPopover(for: sender.tag)
            print("\(sender.tag)")
        case 1:
            print("\(sender.tag)")
            showPopover(for: sender.tag)
        case 2:
            print("\(sender.tag)")
            showPopover(for: sender.tag)
        case 3:
            print("\(sender.tag)")
            showPopover(for: sender.tag)
        default:
            print("\(sender.tag)")
            showPopover(for: sender.tag)
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setGradientBackground(lowerColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),upperColor:#colorLiteral(red: 0.05094706267, green: 0.05415663868, blue: 0.06809280068, alpha: 1))

    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    public func instantiateFromStoryboard() -> PartsViewController {
        let bundle = Bundle(for: PartsViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: "PartsViewController") as! PartsViewController
    }
    
}

extension PartsViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
