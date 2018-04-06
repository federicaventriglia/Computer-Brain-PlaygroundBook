import UIKit

@objc(CodingViewController)
public class CodingViewController: UIViewController {
    
    @IBOutlet weak public var myTableView: UITableView!
    public var codeLines = conditionalBlock.lines
    
    public override var prefersStatusBarHidden: Bool {
        return true
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(lowerColor: #colorLiteral(red: 0.9921568627, green: 0.4549019608, blue: 0.4235294118, alpha: 1),upperColor:#colorLiteral(red: 1, green: 0.5647058824, blue: 0.4078431373, alpha: 1))
        // Do any additional setup after loading the view.
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
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    public  func instantiateFromStoryboard() -> CodingViewController {
        let bundle = Bundle(for: CodingViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: "CodingViewController") as! CodingViewController
    }
    
//    public func setCode(for type: BlockType) {
//        switch type {
//        case .Conditional:
//            codeLines = conditionalBlock.lines
//        case .Loops:
//            codeLines = loopBlock.lines.code
//        default:
//            codeLines = conditionalBlock.lines
//        }
//        self.myTableView.reloadData()
//    }
}

extension CodingViewController: UITableViewDelegate, UITableViewDataSource,UIPopoverPresentationControllerDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return codeLines.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "codeCell", for: indexPath)
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: cell.contentView.frame.size.height - width, width:  cell.contentView.frame.size.width, height: cell.contentView.frame.size.height)
        
        border.borderWidth = width
        cell.contentView.layer.addSublayer(border)
        cell.contentView.layer.masksToBounds = true
        cell.contentView.clipsToBounds = true
        
        cell.detailTextLabel?.text = codeLines[indexPath.row].code
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped:\(indexPath.row)")
        // Put the selected cell's sourceview and sourcerrect oroperty value in separate variables
        let selectedCellSourceView = tableView.cellForRow(at: indexPath)
        let selectedCellSourceRect = CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height)
        
        // Put the view that'll be shown as a popover in a variable
        let popover = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "idPop") as! PopViewController
        
        // set the two control properties of the popover view
        popover.selectedVideoTitle = codeLines[indexPath.row].code
        popover.message = codeLines[indexPath.row].description
        popover.modalPresentationStyle = UIModalPresentationStyle.popover
        
        popover.popoverPresentationController?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        popover.popoverPresentationController?.delegate = self
        popover.popoverPresentationController?.sourceView = selectedCellSourceView
        popover.popoverPresentationController?.sourceRect = selectedCellSourceRect
        popover.popoverPresentationController?.permittedArrowDirections = .any
        popover.preferredContentSize = selectedCellSourceRect.size
        
        self.present(popover, animated: true, completion: nil)
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

}
