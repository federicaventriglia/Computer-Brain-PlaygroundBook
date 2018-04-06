import UIKit

@objc (PopViewController)
class PopViewController: UIViewController {
    
    var selectedCell : Part?

    @IBOutlet weak var istructionName: UILabel!
    @IBOutlet weak var codeDescription: UILabel!
    @IBOutlet weak var assetImage: UIImageView!
    
    var selectedVideoTitle: String!
    var message: String!
    var partImage: UIImage!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's backgroundColor to a light mint green color
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        // Set the Label's text property
        istructionName.text = selectedVideoTitle
        codeDescription.text = message
        assetImage.image = partImage
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
