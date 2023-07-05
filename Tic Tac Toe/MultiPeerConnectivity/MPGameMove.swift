//
//  MPGameMove.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 5.07.2023.
//

import Foundation

struct MPgameMove: Codable {
    enum Action: Int, Codable {
        case start, move, reset, end
        
    }
    
    let action: Action
    let playerName: String?
    let index: Int?
    
    
    func data() -> Data? {
        try? JSONEncoder().encode(self)
    }
}
