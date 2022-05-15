//
//  ContentView.swift
//  Shared
//
//  Created by Viraj Lakshitha Bandara on 2022-05-02.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        return VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) { // add adaptive to manage number of cards per row (this is important in portrait and landscape modes)
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(1, contentMode: .fit) // resize the card item and fit to the size
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(.yellow)
                .padding(5)
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        let flipableCard = RoundedRectangle(cornerRadius: 15)
        ZStack (alignment: .center) {
            if card.isFaceUp {
                flipableCard.fill(.white)
                flipableCard.stroke(lineWidth:3)
                Text(card.content).font(.largeTitle).bold()
            } else {
                flipableCard.fill(.yellow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .previewDevice("iPhone 12")
            .preferredColorScheme(.dark)  // enable dark mode
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
