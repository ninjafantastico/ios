//
//  ViewController.swift
//  TicTacToe
//
//  Created by sunil on 9/10/17.
//  Copyright © 2017 sunlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    
//    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
//    let winningsCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]
    

//    
//    var activePlayerColor : ?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        // Initialize game: start with blue player
//        initializeGame()
//    }
//    
//    func initializeGame() {
//        for i in 1...gameState.count {
//            gameState[i-1] = 0
//        }
//        activePlayerColor = .blue
//        displayMessage(withString: "Tap any square to begin..", andColor: fetchColor(forEnumColor: activePlayerColor!))
//        for i in 1...9 {
//            let button = view.viewWithTag(i) as! UIButton
//            button.backgroundColor = UIColor.lightGray
//        }
//    }
//    
//    func displayMessage(withString message: String, andColor color: UIColor) {
//        winnerLabel.text = message
//        winnerLabel.textColor = color
//        winnerLabel.isHidden = false
//    }
//    
//    func announceWinner(forWinningColorString color: String) {
//        displayMessage(withString: color + " won!!", andColor: fetchColor(forEnumColorString: color))
//    }
//    
//    func announceDraw() {
//        displayMessage(withString: "It's a draw!! Reset to play again", andColor: UIColor.black)
//    }
//    
//    func displayEndGameMessage() {
//        displayMessage(withString: "Game Over! Tap Reset to play again", andColor: UIColor.black)
//    }
//    
//    func switchActivePlayerColor() {
//        if activePlayerColor == Color.blue {
//            activePlayerColor = Color.red
//        }
//        else {
//            activePlayerColor = Color.blue
//        }
//    }
//    
//    func updateButtonColor(forButton button: UIButton) {
//        if let color = activePlayerColor {
//            gameState[button.tag - 1] = fetchColorNumeric(forEnumColor: color)
//            button.backgroundColor = fetchColor(forEnumColor: color)
//        }
//    }
//    
//    func endGame() {
//        for i in 1...gameState.count {
//            gameState[i-1] = -1
//        }
//    }
//    
//    func fetchColor(forEnumColor color: Color) -> UIColor {
//        if color == .blue {
//            return UIColor.blue
//        }
//        return UIColor.red
//    }
//    
//    func fetchColor(forEnumColorString color: String) -> UIColor {
//        if color.lowercased() == "blue" {
//            return UIColor.blue
//        }
//        return UIColor.red
//    }
//    
//    func fetchColorNumeric(forEnumColor color: Color) -> Int {
//        if color == .blue {
//            return 1
//        }
//        return 2
//    }
//    
//    
//    func fetchColorString(forEnumColor color: Color) -> String {
//        if color == .blue {
//            return "Blue"
//        }
//        return "Red"
//    }
//    
//    func isGameDrawn() -> Bool {
//        // check for draw
//        var totalMovesPlayed = 0
//        for i in 1...gameState.count {
//            if gameState[i-1] != 0 && gameState[i-1] != -1 {
//                totalMovesPlayed += 1
//            }
//        }
//        if totalMovesPlayed == 9 {
//            return true
//        }
//        return false
//    } 
//    
//    func isGameWon () -> Bool {
//        // check winning
//        for combination in winningsCombinations {
//            //print("testing combination", combination)
//            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
//                return true
//            }
//        }
//        return false
//    }
//    
//    func checkAndUpdateGameState(forButton button: UIButton) {
//        winnerLabel.isHidden = true
//        if gameState[button.tag - 1] == 0 {
//            updateButtonColor(forButton: button)
//            if !isGameWon() && !isGameDrawn() {
//                // change player
//                switchActivePlayerColor()
//            }
//            else {
//                if isGameWon() {
//                    announceWinner(forWinningColorString: fetchColorString(forEnumColor: activePlayerColor!))
//                }
//                else {
//                    announceDraw()
//                }
//                endGame()
//            }
//        }
//        else if gameState[button.tag - 1] == -1 {
//            displayEndGameMessage()
//        }
//
//    }
//    
//    func fetchNextPossibleIndexForMove() -> Int {
//        for combination in winningsCombinations {
//            //print("testing combination", combination)
//            if gameState[combination[0]] == 1 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[2]] != 2 {
//                return combination[2]
//            }
//            else if gameState[combination[1]] == 1 && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 2  {
//                return combination[0]
//            }
//            else if gameState[combination[2]] == 1 && gameState[combination[2]] == gameState[combination[0]] && gameState[combination[1]] != 2  {
//                return combination[1]
//            }
//        }
//        return -1
//    }
//    
//    func playComputerMove() {
//        // find best possible move
//        let bestPossibleMoveIndex = fetchNextPossibleIndexForMove()
//        if bestPossibleMoveIndex != -1 {
//            print("found a best possible move at index \(bestPossibleMoveIndex)")
//            let button = view.viewWithTag(bestPossibleMoveIndex+1) as! UIButton
//            checkAndUpdateGameState(forButton: button)
//        }
//        else {
//            print("couldn't find possible moves")
//            // find all empty spaces
//            var emptySquares : [Int] = [Int]()
//            for i in 1...gameState.count {
//                if gameState[i-1] == 0 {
//                    emptySquares.append(i)
//                }
//            }
//            if emptySquares.isEmpty {
//                return
//            }
//            else {
//                print("found empty squares...")
//                print(emptySquares)
//                // identify and use random empty space
//                let randomSquare = arc4random_uniform(UInt32(emptySquares.count - 1))
//                let button = view.viewWithTag(emptySquares[Int(randomSquare)]) as! UIButton
//                checkAndUpdateGameState(forButton: button)
//            }
//
//        }
//}
//
//    @IBAction func anyButtonTapped(_ sender: UIButton) {
//        //print("some button tapped...")
//        checkAndUpdateGameState(forButton: sender)
//        if !isGameWon() && !isGameDrawn() {
//            playComputerMove()
//        }
//    }
//    
//    @IBAction func resetButtonTapped(_ sender: UIButton) {
//        initializeGame()
//    }
    
        
}

