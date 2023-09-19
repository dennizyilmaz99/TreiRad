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
    
    @IBAction func startGameBtn(_ sender: UIButton) {
        
              print(player1TextField.text ?? "IngenText")
              print(player2TextField.text ?? "IngenText")
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
