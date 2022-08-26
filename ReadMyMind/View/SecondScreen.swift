//
//  SecondScreen.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/20/22.
//

import SwiftUI

var numbers = [["10", "11", "12"],[],[],[],[],[],[],[],[]]

let imagesNames = ["moon", "tropicalstorm", "graduationcap", "umbrella", "scissors", "paintbrush.pointed", "briefcase", "key", "crown", "leaf"]
//
//func generateImages() -> [String] {
//
//    array.shuffle()
//    array.insert(goalImage, at: 8)
//    return array
//}

struct Card: Hashable {
    var index: Int
    var image: String
}

//static let goalImage: String  = ""

func createTable() -> [[Card]] {
    var table: [[Card]] = []
    let goal = Int.random(in: 0..<10)
    let goalImage = imagesNames[goal]
    
    var number = 1
    var position: Int
    
    
    for line in 1...10 {
        var array = imagesNames
        var cardArray: [Card] = []
        
        array.remove(at: goal)
        array.shuffle()
        if line == 1 {
            position = 8
            array.insert(goalImage, at: position)
        } else if line == 2 {
            position = 7
            array.insert(goalImage, at: position)
        } else if line == 3 {
            position = 6
            array.insert(goalImage, at: position)
        } else if line == 4 {
            position = 5
            array.insert(goalImage, at: position)
        } else if line == 5 {
            position = 4
            array.insert(goalImage, at: position)
        } else if line == 6 {
            position = 3
            array.insert(goalImage, at: position)
        } else if line == 7 {
            position = 2
            array.insert(goalImage, at: position)
        } else if line == 8 {
            position = 1
            array.insert(goalImage, at: position)
        } else if line == 9 {
            position = 0
            array.insert(goalImage, at: position)
            position = 8
            array.remove(at: position)
            array.insert(goalImage, at: position)
        } else if line == 10 {
            position = 8
            array.insert(goalImage, at: position)
        }
        
        for index in 0...9 {
            let card = Card(index: number, image: array[index])
            number += 1
            cardArray.append(card)
        }
        
        table.append(cardArray)
    }
    return table
}
class CardImage: ObservableObject {
    @Published var image = ""
}

struct SecondScreen: View {
    @EnvironmentObject var image: CardImage
    var myList = createTable()
    var number = 0
    mutating func increaseNumber() {
        number += 1
    }
    @State var isPopupPresented = false
    @State var isDisplayResult = false
    var body: some View {
        VStack{
        List(myList, id: \.self) {row in
            HStack {
                ForEach(row, id: \.self) { item in
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8).fill(Color.white)
                            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3)
                        
                            Text("\(item.index)\(Image(systemName: $image)) ")
                          //  .cornerRadius(8)
                            
                        }
                                        }
                  //  number += 1
            }
        }
            .padding(.bottom, 3)
        }
            NavigationLink (isActive: $isDisplayResult, destination: ThirdScreen(result: image))
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
              
        }
        .popup(isPresented: isPopupPresented) {
            VStack{
                Image(systemName: "moon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40.0, height: 40.0)
                    .imageScale(.large)
            }
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
