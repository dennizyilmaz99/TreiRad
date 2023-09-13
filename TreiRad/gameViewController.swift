//
//  gameViewController.swift
//  TreiRad
//
//  Created by dator on 2023-09-11.
//

import UIKit

class gameViewController: UIViewController {

    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet weak var startGameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    @IBAction func startGameBtn(_ sender: UIButton) {
        print(player1TextField?.text ?? "Ingen text")
        print(player2TextField?.text ?? "Ingen text")
    }

    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
