//
//  ViewController.swift
//  TicTacToe
//
//  Created by Zeke on 2023-09-23.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet var boardCells: [UIButton]!
    
    let boardUtil = BoardUtil()
    
    // Controlls if the game is against a bot or not
    var isAgainstBot: Bool = false
    
    // Define the players with temporary names
    var player1: Player = Player(name: "temp1", mark: "X")
    var player2: Player = Player(name: "temp2", mark: "O")
    
    // TODO: remove this
    var currentPlayer: Player = Player(name: "temp", mark: "temp")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Started app")
        
        currentPlayer = player1
        turnLabel.text = "\(currentPlayer.name)'s Turn"
        
        // Reset the cells
        boardUtil.resetCells(boardCells)
    }
    
    @IBAction func cellTapped(_ sender: UIButton) {
        if(isAgainstBot && currentPlayer.name == "Bot") { return }
        
        let lastPlayer = currentPlayer
        
        // Add the mark
        addMark(sender)
        if(checkForWinOrDraw(lastPlayer)) { return }
        
        // Create the bots turn
        if(isAgainstBot) { addBotMark() }
    }
    
    func addMark(_ sender: UIButton) {
        // Only continue if board is empty
        if(sender.title(for: .normal) != nil) { return }
        
        // Change button title and font
        if(currentPlayer.mark == "X") {
            sender.setTitleColor(UIColor.red, for: .normal)
        } else {
            sender.setTitleColor(UIColor.green, for: .normal)
        }
        sender.setTitle(currentPlayer.mark, for: .normal)
        
        // Switch turn
        switchTurn()
    }
    
    func addBotMark() {
        if(currentPlayer.name == "Player") { return }
        
        var tilePlaced = false
        
        // Place a mark on random empty cell
        while(!tilePlaced) {
            let cellIndex = Int.random(in: 0...8)
            let cell = boardCells[cellIndex]
            
            if(cell.title(for: .normal) == nil) {
                cell.setTitleColor(UIColor.green, for: .normal)
                cell.setTitle(currentPlayer.mark, for: .normal)
                tilePlaced = true;
            }
        }
        
        // Check if it resulted in a win or draw
        if(checkForWinOrDraw(currentPlayer)) { return }
        
        // Switch the turn
        switchTurn()
    }
    
    func checkForWinOrDraw(_ player: Player) -> Bool {
        // Check if current player won
        if(boardUtil.hasPlayerWon(boardCells, player.mark)) {
            turnLabel.text = "\(player.name) won!"
            createResetSheet()
            return true
        }
        
        // Check if board is full
        if(boardUtil.isBoardFull(boardCells)) {
            turnLabel.text = "Board is full, it's a draw!"
            createResetSheet()
            return true
        }
        
        return false
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

