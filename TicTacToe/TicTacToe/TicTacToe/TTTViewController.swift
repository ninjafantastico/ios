//
//  TTTViewController.swift
//  TicTacToe
//
//  Created by sunil on 10/18/17.
//  Copyright © 2017 sunlee. All rights reserved.
//

import UIKit

class TTTViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    
    let gameModel = TTTModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Initialize game: start with blue player
        initialize()
    }
    
    func initialize() {
        gameModel.reset()
        displayStartMessage()
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.backgroundColor = UIColor.lightGray
        }
    }
    
    // MARK:- Methods to update views
    func displayMessage(withString message: String, andColor color: UIColor) {
        winnerLabel.text = message
        winnerLabel.textColor = color
        winnerLabel.isHidden = false
    }
    
    func displayStartMessage() {
        displayMessage(withString: "Tap any square to begin..", andColor: Player.fetchColor(forEnumColor: gameModel.getActivePlayerColor()))
    }
    
    func displayWinnerMessage(forWinningColor color: Player.ActivePlayerColor) {
        displayMessage(withString: Player.fetchColorString(forEnumColor: gameModel.getActivePlayerColor()) + " won!!", andColor: Player.fetchColor(forEnumColor: gameModel.getActivePlayerColor()))
    }
    
    func displayDrawMessage() {
        displayMessage(withString: "Draw!! Reset to play again", andColor: UIColor.black)
    }
    
    func displayEndGameMessage() {
        displayMessage(withString: "Game Over! Reset to play again", andColor: UIColor.black)
    }
    
    // MARK:- Control Methods
    func updateButtonColor(forButton button: UIButton) {
        let currentPlayerColor = gameModel.getActivePlayerColor()
        gameModel.updateGameState(forIndex: button.tag - 1, withValue: Player.fetchColorNumeric(forEnumColor: currentPlayerColor))
        button.backgroundColor = Player.fetchColor(forEnumColor: currentPlayerColor)
    }
    
    func updateGameState(forButton button: UIButton) {
        // if move is valid, update square and check for game completion
        if gameModel.isMoveValid(atIndex: button.tag - 1) {
            winnerLabel.isHidden = true
            updateButtonColor(forButton: button)
            if !gameModel.isGameWon() && !gameModel.isGameDrawn() {
                // change active player
                gameModel.switchActivePlayerColor()
            } // end inner if
            else { // if game has either been won or drawn
                if gameModel.isGameWon() {
                    displayWinnerMessage(forWinningColor: gameModel.getActivePlayerColor())
                }
                else { // game has been drawn
                    displayDrawMessage()
                }
                gameModel.endGame() // end game only after completing the checks above
            } // end inner else
        } // end outer if
    }
    
    func playComputerMove() {
        // find best possible move
        let bestPossibleMoveIndex = gameModel.fetchBestPossibleIndexForMove()
        let button : UIButton?
        if bestPossibleMoveIndex != -1 {
            //print("found one best possible move at index \(bestPossibleMoveIndex)")
            button = view.viewWithTag(bestPossibleMoveIndex+1) as? UIButton
        }
        else {
            let indexForNextMove = gameModel.fetchAnyPossibleIndexForMove()
            if indexForNextMove == -1 {
                //print("Ending game prematurely")
                gameModel.endGame()
            }
            button = view.viewWithTag(indexForNextMove) as? UIButton
        }
        updateGameState(forButton: button!)
    }

    // MARK:- Action Methods
    @IBAction func anyButtonTapped(_ sender: UIButton) {
        //print("some button tapped...")
        updateGameState(forButton: sender)
        if !gameModel.isGameWon() && !gameModel.isGameDrawn() {
            playComputerMove()
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        initialize()
    }
}
