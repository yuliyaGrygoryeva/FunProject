//
//  FirstScreen.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/20/22.
//

import SwiftUI

struct FirstScreen: View {
    
    @State private var isDisplayed = false
    
    var body: some View {
        NavigationView {
            TabView {
                VStack(spacing: 50){
                    Text("Guess the number").font(.title)
                    Image("readMind")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                .background(RadialGradient(gradient: Gradient(colors: [Color.cyan, Color.white]), center: .center, startRadius: 5, endRadius: 300))
                VStack{
                    Text("Imagine a 2 digit number.")
                        .font(.title)
                }
                .padding()
                VStack(spacing: 30){
                    Text("Substract from that number second and first digits").font(.title)
                    Text("Example: 32 - 2 - 3 = 27").font(.title)
                    Text("Remember that number").font(.title)
                    NavigationLink(destination: {
                        SecondScreen()
                    }, label: {
                        ZStack{
                            Rectangle().fill(.ultraThinMaterial)
                                .cornerRadius(5)
                            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2)
                            
                            Text("Next")
                        }.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                  //  }.frame(width: UIScreen.main.bounds.width - 40, height: 55)
                    })
                        
                }
            }
            .tabViewStyle(.page)
            .background(RadialGradient(gradient: Gradient(colors: [Color.white, Color.mint]), center: .center, startRadius: 5, endRadius: 500))
        }
    }
}
struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
