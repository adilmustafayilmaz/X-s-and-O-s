//
//  Tic_Tac_ToeApp.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 3.07.2023.
//

import SwiftUI

@main
struct AppEntry: App {
    
    @AppStorage("yourName") var yourName = ""
    
    @StateObject var game = GameService()
    
    
    var body: some Scene {
        WindowGroup {
            if yourName.isEmpty {
                YourNameView()
            } else {
                StartView(yourName: yourName)
                .environmentObject(game)
                
            }
        }
    }
}
