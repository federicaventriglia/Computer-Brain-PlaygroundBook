import UIKit

@objc (QuizViewController)
public class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizCollectionView: UICollectionView!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var correctView: CustomView!
    
    public var currentQuestionIndex = 0
    public var currentQuestionAnswers: [String] = ["microwave-oven.png","sofa.png","washing-machine.png","macbook.png"]
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's backgroundColor to a light mint green color
        setGradientBackground(lowerColor: #colorLiteral(red: 0.1960784314, green: 0.4784313725, blue: 0.8470588235, alpha: 1),upperColor:#colorLiteral(red: 0.2078431373, green: 0.4274509804, blue: 0.7058823529, alpha: 1))
        // Do any additional setup after loading the view.
        
        setNewQuestion(for: currentQuestionIndex)
        self.quizCollectionView.reloadData()
        self.resultLbl.alpha = 0.0
        self.correctView.alpha = 0.0
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
    func setQuestion(for number: Int){
        switch number {
        case 1:
            self.questionLbl.text = "Which one of these things doesn't necessarily have a CPU?"
        default:
            self.questionLbl.text = ""
        }
    }
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func instantiateFromStoryboard() -> QuizViewController {
        let bundle = Bundle(for: QuizViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
    }
    
    public func setNewQuestion(for index: Int) {
        self.questionLbl.text = questions[index].text
        self.currentQuestionAnswers = questions[index].answers
        self.quizCollectionView.reloadData()
    }
    
    
    public func correctAnswer(){
        UIView.animate(withDuration: 0.5) {
            self.correctView.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.3725490196, blue: 0.631372549, alpha: 1)
            self.correctView.alpha = 1.0
            self.resultLbl.alpha = 1.0
            self.resultLbl.text = "Well congrats, that was the right answer"
        }
    }
    
    public func dismissAnswered(){
        UIView.animate(withDuration: 2.5) {
            self.correctView.alpha = 0.0
            self.resultLbl.alpha = 0.0
        }
    }
    
}
extension QuizViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UIPopoverPresentationControllerDelegate{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "questionCell", for: indexPath) as! QuizCollectionViewCell
        if currentQuestionIndex == 0 {
            cell.config(answerText:"",answerImage: currentQuestionAnswers[indexPath.row])
        } else {
            cell.config(answerText:currentQuestionAnswers[indexPath.row],answerImage:"")
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == questions[currentQuestionIndex].correctAnswer {
            correctAnswer()
            currentQuestionIndex += 1
            setNewQuestion(for: currentQuestionIndex)
            dismissAnswered()
            if currentQuestionIndex > 2 {
                currentQuestionIndex -= 1
                let popover = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WinningViewController") as! WinningViewController
                self.present(popover, animated: true, completion: nil)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                if let cell = collectionView.cellForItem(at: indexPath) as? QuizCollectionViewCell {
                    cell.vibrate()
                }
            }
        }
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    
}

