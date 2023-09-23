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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Started app")
        currentTurn = "X";
    }
    
    @IBAction func cellTapped(_ sender: UIButton) {
        print("Button tapped")
        
        var lastTurn = currentTurn
        
        // Add the mark
        addMark(sender);
        
        // Check if current player won
        if(hasPlayerWon(lastTurn)) {
            turnLabel.text = "\(lastTurn) won!"
            return
        }
        
        // Check if board is full
        if(isBoardFull()) {
            turnLabel.text = "Board is full, it's a draw!"
            return
        }
        
    }
    
    func hasPlayerWon(_ mark: String) -> Bool {
        // Horizontal conditions
        if(hasMark(boardCells[0], mark) &&
           hasMark(boardCells[1], mark) &&
           hasMark(boardCells[2], mark) ) {
            return true
        }
        
        if(hasMark(boardCells[3], mark) &&
           hasMark(boardCells[4], mark) &&
           hasMark(boardCells[5], mark) ) {
            return true
        }
        
        if(hasMark(boardCells[6], mark) &&
           hasMark(boardCells[7], mark) &&
           hasMark(boardCells[8], mark) ) {
            return true
        }
        
        // Vertical conditions
        if(hasMark(boardCells[0], mark) &&
           hasMark(boardCells[3], mark) &&
           hasMark(boardCells[6], mark) ) {
            return true
        }
        
        if(hasMark(boardCells[1], mark) &&
           hasMark(boardCells[4], mark) &&
           hasMark(boardCells[7], mark) ) {
            return true
        }
        
        if(hasMark(boardCells[2], mark) &&
           hasMark(boardCells[5], mark) &&
           hasMark(boardCells[8], mark) ) {
            return true
        }
        
        // Diagonal contitions
        if(hasMark(boardCells[0], mark) &&
           hasMark(boardCells[4], mark) &&
           hasMark(boardCells[8], mark) ) {
            return true
        }
        
        if(hasMark(boardCells[2], mark) &&
           hasMark(boardCells[4], mark) &&
           hasMark(boardCells[6], mark) ) {
            return true
        }
        
        return false;
    }
    
    func hasMark(_ cell: UIButton, _ mark: String) -> Bool {
        if(cell.title(for: .normal) == mark) {
            return true
        }
        
        return false
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
        sender.setTitleColor(UIColor.red, for: .normal)
        sender.setTitle(currentTurn, for: .normal)
        
        // Switch turn
        currentTurn = currentTurn == PLAYER1_MARK ? PLAYER2_MARK : PLAYER1_MARK
        turnLabel.text = "\(currentTurn)'s Turn"
    }
    
}

