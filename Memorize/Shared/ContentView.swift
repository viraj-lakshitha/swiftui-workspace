//
//  ContentView.swift
//  Shared
//
//  Created by Viraj Lakshitha Bandara on 2022-05-02.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["😁","😂","😃","😄","😅","😆","😇","😈","😉","😊","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷","😸"]
    @State var emojiCount: Int = 20
    
    var body: some View {
        return VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) { // add adaptive to manage number of cards per row (this is important in portrait and landscape modes)
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(1, contentMode: .fit) // resize the card item and fit to the size
                    })
                }
                .foregroundColor(.yellow)
                .padding(5)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true // enable state manage to perform onTapGuesture
    
    var body: some View {
        let flipableCard = RoundedRectangle(cornerRadius: 15)
        ZStack (alignment: .center) {
            if isFaceUp {
                flipableCard.fill(.white)
                flipableCard.stroke(lineWidth:3)
                Text(content).font(.largeTitle).bold()
            } else {
                flipableCard.fill(.yellow)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
            .preferredColorScheme(.dark)  // enable dark mode
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
