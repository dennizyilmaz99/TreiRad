import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rulesBtn: UIButton!
    @IBOutlet weak var startGameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func rulesBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "toRulesScreen", sender: self)
    }
    
    @IBAction func startGameBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "toPreGameViewController", sender: self)
    }
}

