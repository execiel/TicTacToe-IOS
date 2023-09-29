//
//  MenuViewController.swift
//  TicTacToe
//
//  Created by Zeke on 2023-09-27.
//

import UIKit

class MenuViewController: UIViewController {
    
    var onePlayerTapped = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onOnePlayerTapped(_ sender: Any) { onePlayerTapped = true; }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(!onePlayerTapped) { return }
        
        let gameView = segue.destination as! GameViewController
        
        gameView.isAgainstBot = true
        
        gameView.player1 = Player(name: "Player", mark: "X")
        gameView.player2 = Player(name: "Bot", mark: "O")
        
        onePlayerTapped = false
    }
     
}
