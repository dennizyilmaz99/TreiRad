import UIKit

class preGameViewController: UIViewController {
    
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet weak var startGameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1TextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        player2TextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        startGameBtn.isEnabled = false
        startGameBtn.alpha = 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playerX = player1TextField.text ?? "Ingen text"
        let playerO = player2TextField.text ?? "Ingen text"
        let inGameViewController = segue.destination as! inGameViewController
        inGameViewController.playerX = playerX
        inGameViewController.playerO = playerO
    }
    
    @IBAction func startGameBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "toInGameScreen", sender: self)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
           
        if let text1 = player1TextField.text, !text1.isEmpty, text1.count >= 3,
           let text2 = player2TextField.text, !text2.isEmpty, text2.count >= 3 {
               startGameBtn.isEnabled = true
               startGameBtn.alpha = 1.0
           } else {
               startGameBtn.isEnabled = false
               startGameBtn.alpha = 0.5
           }
       }
}
