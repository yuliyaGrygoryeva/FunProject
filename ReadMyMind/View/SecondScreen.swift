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
    
    //var myList = viewModel.createTable()
    
    @State var isPopupPresented = false
    @State var isDisplayResult = false
    
    var body: some View {
        VStack{
            List(viewModel.createTable(), id: \.self) {row in
            HStack {
                ForEach(row, id: \.self) { item in
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8).fill(Color.white)
                            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3)
                        
             //               Text("\(item.index)\(Image(systemName: $image)) ")
                          //  .cornerRadius(8)
                            
                        }
                                        }
                  //  number += 1
            }
        }
            .padding(.bottom, 3)
        }
  //          NavigationLink (isActive: $isDisplayResult, destination: ThirdScreen(result: image))
        Button {
            isDisplayResult.toggle()
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                isPopupPresented.toggle()
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    isPopupPresented = false
//                }
//            }
        } label: {
            ZStack{
                
            Rectangle().fill(.ultraThinMaterial)
                    .cornerRadius(5)
            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2)
            
            Text("Read my mind")
            }.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
               
        }.frame(width: UIScreen.main.bounds.width - 40, height: 55)
                .sheet(isPresented: $isDisplayResult) {
                    ThirdScreen(result: "moon")
                }
        }
      
//        .popup(isPresented: isPopupPresented) {
//            VStack{
//                Image(systemName: "moon")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 40.0, height: 40.0)
//                    .imageScale(.large)
//            }
//        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
