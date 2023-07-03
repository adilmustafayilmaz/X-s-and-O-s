//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 3.07.2023.
//

import SwiftUI

struct StartView: View {
    
    @State private var gameType: GameType = .undermined
    @State private var  yourName: String = ""
    @State private var opponentName: String = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    
    var body: some View {
        
            
        
        VStack {
            Picker("Select Game" , selection: $gameType){
                Text("Select Game Type").tag(GameType.undermined)
                Text("Challenge your device").tag(GameType.bot)
                Text("Challange a friend").tag(GameType.peer)
                Text("Two Sharing Same Device").tag(GameType.single)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            
            Text(gameType.description)
                .padding()
            
            
            VStack{
                switch gameType {
                case .single:
                    VStack {
                        TextField("Your Name", text: $yourName)
                        TextField("Opponent Name", text: $opponentName)
                    }
                case .bot:
                    TextField("Your Name", text: $yourName)
                case .peer:
                    EmptyView()
                case .undermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            
            if gameType != .peer {
                Button("Start Game"){
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undermined ||
                    gameType == .bot && yourName.isEmpty ||
                    gameType == .single && (yourName.isEmpty || opponentName.isEmpty)
                    
                )
                Image("LaunchScreen")
            }
            Spacer()
            
            
        }
        .padding()
        .navigationTitle("X's and O's")
        .fullScreenCover(isPresented: $startGame){
            GameView()
        }
        .inNavigationStack()
            
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
