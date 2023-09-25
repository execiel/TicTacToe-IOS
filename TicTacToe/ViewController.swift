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
    
    let boardUtil = BoardUtil()
    
    // Define the players
    let player1 = Player(name: "Vincent", mark: "X")
    let player2 = Player(name: "William", mark: "O")
    
    // TODO: remove this
    var currentPlayer: Player = Player(name: "temp", mark: "temp")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Started app")
        
        currentPlayer = player1
        turnLabel.text = "\(currentPlayer.name)'s Turn"
    }
    
    @IBAction func cellTapped(_ sender: UIButton) {
        print("Button tapped")
        
        let lastPlayer = currentPlayer
        
        // Add the mark
        addMark(sender)
        
        // Check if current player won
        if(boardUtil.hasPlayerWon(boardCells, lastPlayer.mark)) {
            turnLabel.text = "\(lastPlayer.name) won!"
            createResetSheet()
            return
        }
        
        // Check if board is full
        if(boardUtil.isBoardFull(boardCells)) {
            turnLabel.text = "Board is full, it's a draw!"
            createResetSheet()
            return
        }
        
    }
    
    func addMark(_ sender: UIButton) {
        // Only continue if board is empty
        if(sender.title(for: .normal) != nil) { return }
        
        // Change button title and font
        sender.setTitleColor(UIColor.red, for: .normal)
        sender.setTitle(currentPlayer.mark, for: .normal)
        
        switchTurn()
    }
    
    // Create actionsheet asking if players want to continue
    func createResetSheet() {
        let actionSheet = UIAlertController(title: "Play Again?", message: nil, preferredStyle: .actionSheet)
        
        // Reset game if yes
        actionSheet.addAction(UIAlertAction(title: "Yes!", style: .default, handler: { action in
            self.reset()
        }))
        
        // Quit game if no
        actionSheet.addAction(UIAlertAction(title: "No.", style: .default, handler: { action in
            exit(0)
        }))
        
        present(actionSheet, animated: true)
    }
    
    func reset() {
        boardUtil.resetCells(boardCells)
        switchTurn()
    }
    
    func switchTurn() {
        currentPlayer = currentPlayer.mark == player1.mark ? player2 : player1
        turnLabel.text = "\(currentPlayer.name)'s Turn"
    }
    
}

