//
//  BoardUtil.swift
//  TicTacToe
//
//  Created by Zeke on 2023-09-25.
//

import Foundation
import UIKit

class BoardUtil {
    func hasPlayerWon(_ boardCells: [UIButton]!, _ mark: String) -> Bool {
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
    
    // Checks if board is full
    func isBoardFull(_ boardCells: [UIButton]!) -> Bool {
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
    
    // Checks if a mark exists
    private func hasMark(_ cell: UIButton, _ mark: String) -> Bool {
        if(cell.title(for: .normal) == mark) {
            return true
        }
        
        return false
    }
}
