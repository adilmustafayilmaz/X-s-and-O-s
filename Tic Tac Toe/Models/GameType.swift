//
//  GameType.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 3.07.2023.
//

import SwiftUI

enum GameType{
    case single, bot, peer, undermined
    
    
    var description: String{
        switch self {
        case .single:
            return "Share your iPhone/iPad and play against friend"
        case .bot:
            return "Play agin this iPhone/iPad"
        case .peer:
            return "Invite someone near you who has this app running to play"
        case .undermined:
            return ""
        }
    }
}


enum GamePiece: String {
    case x, o
    var image: Image {
        Image(self.rawValue)
    }
}


struct Player {
    let gamePiece: GamePiece
    var name: String
    var moves: [Int] = []
    var isCurrent = false
    
    var isWinner: Bool {
        for moves in Move.winningMoves{
            if moves.allSatisfy(self.moves.contains){
                return true
            }
        }
        return false
    }
}

enum Move {
    static var all = [1,2,3,4,5,6,7,8,9]

    static var winningMoves = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,2,9],
        [3,5,7]
    ]
}
