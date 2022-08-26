//
//  ThirdScreen.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/20/22.
//

import SwiftUI

struct ThirdScreen: View {
    var result: String
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .mint, .white], startPoint: .top, endPoint: .bottom).opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack{
                Image(systemName: result)
                    .resizable()
                    .scaledToFit()
                Image("guessCorrect")
                    .resizable()
                    .scaledToFit()
                
            }.padding()
        }
    }
}
