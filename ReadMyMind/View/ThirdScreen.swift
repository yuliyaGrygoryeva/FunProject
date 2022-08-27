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
//                Button {
//                    FirstScreen()
//                } label: {
//                    ZStack{
//
//                        Rectangle().fill(.ultraThinMaterial)
//                            .cornerRadius(5)
//                        RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2)
//
//
//                    }.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
//
//                }.frame(width: UIScreen.main.bounds.width - 100, height: 55)
//
            }.padding()
        }.onDisappear {
            FirstScreen()
        }
    }
}
