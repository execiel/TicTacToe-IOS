//
//  ViewController.swift
//  TicTacToe
//
//  Created by Zeke on 2023-09-23.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    let PLAYER1_MARK = "X";
    let PLAYER2_MARK = "O";
    
    var currentTurn: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentTurn = "X";
        print("Started app")
    }

    @IBAction func cellTapped(_ sender: UIButton) {
        print("Button tapped")
        addMark(sender);
    }
    
    func addMark(_ sender: UIButton) {
        print(currentTurn)
        
        // Only continue if board is empty
        if(sender.title(for: .normal) != nil) { return }
        
        // Change button title and font
        sender.setTitle(currentTurn, for: .normal)
        sender.isEnabled = false
        
        // Switch turn
        currentTurn = currentTurn == PLAYER1_MARK ? PLAYER2_MARK : PLAYER1_MARK
        turnLabel.text = "\(currentTurn)'s Turn"
        
    }
    
}

