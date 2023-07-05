//
//  YourNameView.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 4.07.2023.
//

import SwiftUI

struct YourNameView: View {
    
    @AppStorage("yourName") var yourName = ""
    @State private var userName = ""
    var body: some View {
        VStack {
            Text("This is the name that will be associated with this device.")
            TextField("Your name" , text: $userName)
                .textFieldStyle(.roundedBorder)
            Button("Set") {
                yourName = userName
            }
            .buttonStyle(.borderedProminent)
            .disabled(userName.isEmpty)
            Image("LaunchScreen")
            Spacer()
            
        }
        .padding()
        .navigationTitle("X's and O's")
        .inNavigationStack()
    }
}

struct YourNameView_Previews: PreviewProvider {
    static var previews: some View {
        YourNameView()
    }
}
