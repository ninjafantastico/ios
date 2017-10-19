//
//  Player.swift
//  TicTacToe
//
//  Created by sunil on 10/18/17.
//  Copyright © 2017 sunlee. All rights reserved.
//

import UIKit

struct Player {
    enum ActivePlayerColor {
        case blue
        case red
    }
    
    static func fetchColor(forEnumColor color: ActivePlayerColor) -> UIColor {
        if color == .blue {
            return UIColor.blue
        }
        return UIColor.red
    }
    
//    func fetchColor(forEnumColorString color: String) -> UIColor {
//        if color.lowercased() == "blue" {
//            return UIColor.blue
//        }
//        return UIColor.red
//    }
    
    static func fetchColorNumeric(forEnumColor color: ActivePlayerColor) -> Int {
        if color == .blue {
            return 1
        }
        return 2
    }
    
    
    static func fetchColorString(forEnumColor color: ActivePlayerColor) -> String {
        if color == .blue {
            return "Blue"
        }
        return "Red"
    }

}
