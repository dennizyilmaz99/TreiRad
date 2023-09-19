import UIKit

class inGameViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var NOUGHT = "O"
        var CROSS = "X"
        
        var board = [[UIButton]]()
        var currentTurn = Turn.Cross
        
        var noughtsScore = 0
        var crossesScore = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            initBoard()
        }
        
        func initBoard() {
            board = [
                [a1, a2, a3],
                [b1, b2, b3],
                [c1, c2, c3]
            ]
        }
        
        @IBAction func boardTap(_ sender: UIButton) {
            addToBoard(sender)
            
            if checkForVictory(CROSS) {
                crossesScore += 1
                resultAlert(title: "X vann!")
            }
            if checkForVictory(NOUGHT) {
                noughtsScore += 1
                resultAlert(title: "O vann!")
            }
            
            if fullBoard() {
                resultAlert(title: "Oavgjort")
            }
        }
        
        func checkForVictory(_ s: String) -> Bool {
        
            for i in 0..<3 {
                if thisSymbol(board[i][0], s) && thisSymbol(board[i][1], s) && thisSymbol(board[i][2], s) {
                    return true
                }
                if thisSymbol(board[0][i], s) && thisSymbol(board[1][i], s) && thisSymbol(board[2][i], s) {
                    return true
                }
            }
            
            if thisSymbol(board[0][0], s) && thisSymbol(board[1][1], s) && thisSymbol(board[2][2], s) {
                return true
            }
            if thisSymbol(board[0][2], s) && thisSymbol(board[1][1], s) && thisSymbol(board[2][0], s) {
                return true
            }
            
            return false
        }
        
        func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
            return button.title(for: .normal) == symbol
        }
        
        func resultAlert(title: String) {
            let message = "\nX: " + String(crossesScore) + "\n\nO: " + String(noughtsScore)
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Starta om", style: .default, handler: { (_) in self.resetBoard()
            }))
            ac.addAction(UIAlertAction(title: "Gå hem", style: .default, handler: { (_) in
                if let navigationController = self.navigationController {
                    navigationController.popToRootViewController(animated: true)
                }
            }))
            self.present(ac, animated: true)
        }
        
        func resetBoard() {
            for row in board {
                for button in row {
                    button.setTitle(nil, for: .normal)
                    button.isEnabled = true
                }
            }
            
            if currentTurn == .Nought {
                currentTurn = .Cross
                turnLabel.text = CROSS
            } else {
                currentTurn = .Nought
                turnLabel.text = NOUGHT
            }
            
            currentTurn = Turn.Cross
            turnLabel.text = CROSS
        }
        
        func fullBoard() -> Bool {
            for row in board {
                for button in row {
                    if button.title(for: .normal) == nil {
                        return false
                    }
                }
            }
            return true
        }
        
        func addToBoard(_ sender: UIButton) {
            if sender.title(for: .normal) == nil {
                sender.setTitle(currentTurn == .Nought ? NOUGHT : CROSS, for: .normal)
                sender.isEnabled = false
                currentTurn = (currentTurn == .Nought) ? .Cross : .Nought
                turnLabel.text = (currentTurn == .Nought) ? NOUGHT : CROSS
            }
        }
    }

