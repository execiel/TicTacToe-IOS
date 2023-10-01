//
//  BoardUtil.swift
//  TicTacToe
//
//  Created by Zeke on 2023-09-25.
//

import Foundation
import UIKit

class BoardUtil {
    private func hasPlayerWon(_ boardCells: [UIButton]!, _ mark: String) -> Bool {
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
        
        return false
    }
    
    // Checks if a mark exists
    private func hasMark(_ cell: UIButton, _ mark: String) -> Bool {
        if(cell.title(for: .normal) == mark) {
            return true
        }
        
        return false
    }
    
    // Checks if board is full
    private func isBoardFull(_ boardCells: [UIButton]!) -> Bool {
        for cell in boardCells {
            if(cell.title(for: .normal) == nil) { return false }
        }
        return true
    }
    
    func resetCells(_ boardCells: [UIButton]!) {
        for cell in boardCells {
            cell.setTitle(nil, for: .normal);
        }
    }
    
    func addMark(_ gameView: GameViewController, _ sender: UIButton) {
        // Only continue if board is empty
        if(sender.title(for: .normal) != nil) { return }
        
        // Change button title and font
        if(gameView.currentPlayer.mark == "X") {
            sender.setTitleColor(UIColor.red, for: .normal)
        } else {
            sender.setTitleColor(UIColor.green, for: .normal)
        }
        sender.setTitle(gameView.currentPlayer.mark, for: .normal)
        
        // Switch turn
        gameView.switchTurn()
    }
    
    func addBotMark(_ gameView: GameViewController) {
        if(gameView.currentPlayer.name == "Player") { return }
        
        var tilePlaced = false
        
        // Place a mark on random empty cell
        while(!tilePlaced) {
            let cellIndex = Int.random(in: 0...8)
            let cell = gameView.boardCells[cellIndex]
            
            if(cell.title(for: .normal) == nil) {
                cell.setTitleColor(UIColor.green, for: .normal)
                cell.setTitle(gameView.currentPlayer.mark, for: .normal)
                tilePlaced = true;
            }
        }
        
        // Check if it resulted in a win or draw
        if(checkForWinOrDraw(gameView, gameView.currentPlayer)) { return }
        
        // Switch the turn
        gameView.switchTurn()
    }
    
    func checkForWinOrDraw(_ gameView: GameViewController, _ player: Player) -> Bool {
        // Check if current player won
        if(hasPlayerWon(gameView.boardCells, player.mark)) {
            gameView.turnLabel.text = "\(player.name) won!"
            gameView.createResetSheet()
            return true
        }
        
        // Check if board is full
        if(isBoardFull(gameView.boardCells)) {
            gameView.turnLabel.text = "Board is full, it's a draw!"
            gameView.createResetSheet()
            return true
        }
        
        return false
    }
    
}
