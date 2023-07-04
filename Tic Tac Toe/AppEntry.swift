//
//  Tic_Tac_ToeApp.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 3.07.2023.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
