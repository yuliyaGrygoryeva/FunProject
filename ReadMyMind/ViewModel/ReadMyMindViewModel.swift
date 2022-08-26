//
//  ReadMyMindViewModel.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/20/22.
//

import Foundation

struct ReadMyMindModel {
    var cards: [String]
}

class ReadMyMindViewModel: ObservableObject {
//    var goal: String {
//        set {
//            imagesNames[Int.random(in: 0...9)]
//        }
//        get {
//            imagesNames[Int.random(in: 0...9)]
//        }
//    }
    
//    var numbers = [["10", "11", "12"],[],[],[],[],[],[],[],[]]

    let imagesNames = ["moon", "tropicalstorm", "graduationcap", "umbrella", "scissors", "paintbrush.pointed", "briefcase", "key", "crown", "leaf"]
    //
    //func generateImages() -> [String] {
    //
    //    array.shuffle()
    //    array.insert(goalImage, at: 8)
    //    return array
    //}

    //static let goalImage: String  = ""
  
    var number = 0
    func increaseNumber() {
        number += 1
    }
//    @Published var myList = {
//        self.createTable()
//    }
   // var myList = createTable()
    
    
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
    

    
    
//
//    func generateImagesOrder() {
//        var goal =
//    }
//
}
class CardImage: ObservableObject {
    @Published var image = ""
}
