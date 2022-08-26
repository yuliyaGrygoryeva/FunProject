//
//  ThirdScreen.swift
//  ReadMyMind
//
//  Created by Yuliya  on 8/20/22.
//

import SwiftUI

struct ThirdScreen: View {
    var result: String
  //  @ObservedObject var readMyMindViewModel: ReadMyMindViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .mint, .orange], startPoint: .top, endPoint: .bottom).opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack{
                Text(Image(systemName: result))
                Image("guessCorrect")
                
            }
        }
    }
}
//
//struct ThirdScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ThirdScreen(result: <#String#>, readMyMindViewModel: <#ReadMyMindViewModel#>)
//    }
//}
