//
//  ContentView.swift
//  Shared
//
//  Created by Viraj Lakshitha Bandara on 2022-05-02.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game : EmojiMemoryGame
    
    var body: some View {
        return VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) { // add adaptive to manage number of cards per row (this is important in portrait and landscape modes)
                    ForEach(game.cards) { card in
                        CardView(card)
                            .aspectRatio(1, contentMode: .fit) // resize the card item and fit to the size
                            .onTapGesture {
                                game.choose(card)
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
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        let flipableCard = RoundedRectangle(cornerRadius: 15)
        ZStack (alignment: .center) {
            if card.isFaceUp {
                flipableCard.fill(.white)
                flipableCard.stroke(lineWidth:3)
                Text(card.content).font(.largeTitle).bold()
            } else if card.isMatched {
                flipableCard.opacity(0)
            } else {
                flipableCard.fill(.yellow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 12")
            .preferredColorScheme(.dark)  // enable dark mode
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
