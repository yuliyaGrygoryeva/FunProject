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

class ReadMyMindViewModel {
    
  
    
    var goal: String {
        set {
            imagesNames[Int.random(in: 0...9)]
        }
        get {
            imagesNames[Int.random(in: 0...9)]
        }
    }
    
//
//    func generateImagesOrder() {
//        var goal =
//    }
//
}
