//
//  ViewController.swift
//  TicTacToe
//
//  Created by Zeke on 2023-09-23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet var boardCells: [UIButton]!
    // The players marks
    let PLAYER1_MARK = "X";
    let PLAYER2_MARK = "O";
    
    var currentTurn: String = "";
    var board = [UIButton]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Started app")
        currentTurn = "X";
    }
    
    @IBAction func cellTapped(_ sender: UIButton) {
        print("Button tapped")
        
        // Add the mark
        addMark(sender);
        
        // Check if board is full
        if(isBoardFull()) {
            turnLabel.text = "Board is full, it's a draw!"
        }
    }
    
    // Checks if board is full
    func isBoardFull() -> Bool {
        for cell in boardCells {
            if(cell.title(for: .normal) == nil) { return false }
        }
        return true
    }
    
    func addMark(_ sender: UIButton) {
        print(currentTurn)
        
        // Only continue if board is empty
        if(sender.title(for: .normal) != nil) { return }
        
        // Change button title and font
        sender.setTitle(currentTurn, for: .normal)
        
        // Disables animations
        // sender.isEnabled = false
        
        // Switch turn
        currentTurn = currentTurn == PLAYER1_MARK ? PLAYER2_MARK : PLAYER1_MARK
        turnLabel.text = "\(currentTurn)'s Turn"
    }
    
}

