//
//  CardModifier.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/25/22.
//

import SwiftUI

struct CardModifierFirstScreen: AnimatableModifier {
    
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 8).fill(Color.white)
                RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: 8).fill()
            .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
}

extension View {
    func displayCard(isFaceUp: Bool) -> some View {
        self.modifier(CardModifierFirstScreen(isFaceUp: isFaceUp))
    }
}
