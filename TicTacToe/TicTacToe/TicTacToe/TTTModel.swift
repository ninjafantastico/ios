//
//  TTTModel.swift
//  TicTacToe
//
//  Created by sunil on 10/10/17.
//  Copyright © 2017 sunlee. All rights reserved.
//

import Foundation

class TTTModel {
    // Gamestate to store state for each square
    private var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    // Array to store state for winning combinations
    private let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]
    private var activePlayerColor : Player.ActivePlayerColor?
    
    func getActivePlayerColor() -> Player.ActivePlayerColor {
        if let activePlayerColor = activePlayerColor {
            return activePlayerColor
        }
        return .blue
    }
    
    func fetchGameState(forIndex index: Int) -> Int {
        return gameState[index]
    }
    
    func updateGameState(forIndex index: Int, withValue val: Int) {
        gameState[index] = val
    }

    
    func reset() {
        for i in 0..<gameState.count {
            gameState[i] = 0
        }
        activePlayerColor = .blue
    }
    
    func endGame() {
        for i in 0..<gameState.count {
            gameState[i] = -1
        }
    }
    
    func isMoveValid(atIndex index: Int) -> Bool {
        return gameState[index] == 0
    }

    func isGameDrawn() -> Bool {
        // check for draw
        if (!isGameWon ()) {
            var totalMovesPlayed = 0
            for i in 1...gameState.count {
                if gameState[i-1] != 0 && gameState[i-1] != -1 {
                    totalMovesPlayed += 1
                }
            }
            return (totalMovesPlayed == 9)
        }
        return false
    }
    
    func isGameWon () -> Bool {
        // check winning for any player
        for winningsCombination in winningCombinations {
            //print("testing combination", combination)
            if gameState[winningsCombination[0]] != 0 && gameState[winningsCombination[0]] == gameState[winningsCombination[1]] && gameState[winningsCombination[1]] == gameState[winningsCombination[2]] {
                return true
            }
        }
        return false
    }
    
    func switchActivePlayerColor() {
        activePlayerColor = (activePlayerColor == .blue) ? .red : .blue
    }
    
    func fetchBestPossibleIndexForMove() -> Int {
        /*
            the goal is to find the best possible move to block, without making it imppssible to win
            Hence the computer will only look for a block possibility, leaving other options for the user to score a win
        */
        for winningCombination in winningCombinations {
            // check possible winning combinations against current game state
            if gameState[winningCombination[0]] == 1 && gameState[winningCombination[0]] == gameState[winningCombination[1]] && gameState[winningCombination[2]] != 2 {
                return winningCombination[2]
            }
            else if gameState[winningCombination[1]] == 1 && gameState[winningCombination[1]] == gameState[winningCombination[2]] && gameState[winningCombination[0]] != 2  {
                return winningCombination[0]
            }
            else if gameState[winningCombination[2]] == 1 && gameState[winningCombination[2]] == gameState[winningCombination[0]] && gameState[winningCombination[1]] != 2  {
                return winningCombination[1]
            }
        }
        return -1
    }
    
    func fetchAnyPossibleIndexForMove() -> Int {
        var emptySquares : [Int] = [Int]()
        for i in 1...gameState.count {
            if gameState[i-1] == 0 {
                emptySquares.append(i)
            }
        }
        if emptySquares.isEmpty {
            //print("Game has reached Error state ...!!")
            return -1
        }
        //print("found empty squares...")
        //print(emptySquares)
        // return any random empty space
        let randomSquare = arc4random_uniform(UInt32(emptySquares.count - 1))
        return emptySquares[Int(randomSquare)]
    }
    
}
