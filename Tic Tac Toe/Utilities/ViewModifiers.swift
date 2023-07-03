//
//  ViewModifiers.swift
//  Tic Tac Toe
//
//  Created by Adil Mustafa Yılmaz on 3.07.2023.
//

import SwiftUI

struct NavStackContainer: ViewModifier{
    func body(content: Content) -> some View {
        
        if #available(iOS 16, *){
            NavigationStack{
                content
            }
        }else {
            NavigationView {
                content
            }
            .navigationViewStyle(.stack)
        }
        
    }
}


extension View {
    public func inNavigationStack() -> some View {
        return self.modifier(NavStackContainer())
    }
}
