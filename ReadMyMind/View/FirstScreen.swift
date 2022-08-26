//
//  FirstScreen.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/20/22.
//

import SwiftUI

struct FirstScreen: View {
    
    @State private var isDisplayed = false
    
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var body: some View {
        NavigationView {
        VStack(spacing: 18) {
            NavigationLink(isActive: $isDisplayed, destination: SecondScreen())
            
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 8).fill(Color.white)
                    RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3)
                    Text("Guess the number").font(.title)
                }
               
            }
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 8).fill(Color.white)
                    RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3)
                    Text("Write on a paper a 2 digit number.")
                }.opacity(isFaceUp ? 0 : 1)
                RoundedRectangle(cornerRadius: 8).fill()
                    .opacity(isFaceUp ? 1 : 0)
            }
            .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
            
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 8).fill(Color.white)
                    RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3)
       
                }
                Text("Add digits together. Write this number.")
            }
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 8).fill(Color.white)
                    RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3)
       
                }
              
        Text("Substract the second number from the first one.")
            }
           
            NavigationLink {
                SecondScreen()
            } label: {
                ZStack{
                
            Rectangle().fill(.ultraThinMaterial)
                    .cornerRadius(5)
            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2)
            
            Text("Next")
            }.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        }.frame(width: UIScreen.main.bounds.width - 40, height: 55)
        }.padding()
    }
}
}
struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen(isFaceUp: true)
    }
}
