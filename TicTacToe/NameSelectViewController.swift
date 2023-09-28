//
//  NameSelectViewController.swift
//  TicTacToe
//
//  Created by Zeke on 2023-09-27.
//

import UIKit

class NameSelectViewController: UIViewController {

    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create players with choosen name in destination
        let player1Name: String = player1TextField.text ?? "Player 1"
        let player2Name: String = player2TextField.text ?? "Player 2"
        
        let gameView = segue.destination as! GameViewController
        
        gameView.player1 = Player(name: player1Name, mark: "X")
        gameView.player2 = Player(name: player2Name, mark: "O")
    }

}
