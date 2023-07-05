//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 3.07.2023.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var game: GameService
    @State private var gameType: GameType = .undermined
    @AppStorage("yourName") private var  yourName: String = ""
    @State private var opponentName: String = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    @State private var changeName = false
    @State private var newName = ""
    
    
    
    
    
    init(yourName: String){
        self.yourName = yourName
    }
    
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
                    TextField("Opponent Name", text: $opponentName)
                    
                case .bot:
                    EmptyView()
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
                    game.setupGame(gameType: gameType, player1Name: yourName, player2Name: opponentName)
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undermined ||
                    gameType == .single && opponentName.isEmpty
                    
                )
                Image("LaunchScreen")
                Text("Your name is \(yourName)")
                Button("Chane my name") {
                    changeName.toggle()
                }
                .buttonStyle(.bordered)
            }
            Spacer()
            
            
        }
        .padding()
        .navigationTitle("X's and O's")
        .fullScreenCover(isPresented: $startGame){
            GameView()
        }
        .alert("Change Name", isPresented: $changeName, actions: {
            TextField("New Name", text: $newName)
            Button("OK", role: .destructive){
                yourName = newName
                exit(-1)
            }
            
            Button("Cancel", role: .cancel){}
            
        }, message: {
            Text("Tapping on the OK button will quit the application so you can relaunc to use your changed name")
        })
        .inNavigationStack()
            
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(yourName: "Sample")
            .environmentObject(GameService())
    }
}
