//
//  GameType.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 3.07.2023.
//

import Foundation

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
