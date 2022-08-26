//
//  SecondScreen.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/20/22.
//

import SwiftUI

struct SecondScreen: View {
    @EnvironmentObject var image: CardImage
    @ObservedObject var viewModel = ReadMyMindViewModel()
    
    @State var isDisplayResult = false
    
    var body: some View {
        VStack{
            List(viewModel.createTable(), id: \.self) {row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8).fill(Color.mint).opacity(100)
                                RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                                
                                Text("\(item.index)\(Image(systemName: item.image)) ")
                            }
                        }
                    }
                }
                .padding(.bottom, 3)
            }
            Button {
                isDisplayResult.toggle()
            } label: {
                ZStack{
                    
                    Rectangle().fill(.ultraThinMaterial)
                        .cornerRadius(5)
                    RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2)
                    
                    Text("Read my mind")
                }.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                
            }.frame(width: UIScreen.main.bounds.width - 100, height: 55)
            
                .sheet(isPresented: $isDisplayResult) {
                    ThirdScreen(result: "moon")
                }
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
