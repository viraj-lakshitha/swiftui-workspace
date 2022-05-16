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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) { // add adaptive to manage number of cards per row (this is important in portrait and landscape modes)
                    ForEach(game.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit) // change 2/3 -> resize the card item and fit to the size
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
        GeometryReader(content: { geometry in // Geomatry reader used to responsive size according to CardView
            ZStack (alignment: .center) {
                let flipableCard = RoundedRectangle(cornerRadius: DrawingConstants.corderRadius)
                if card.isFaceUp {
                    flipableCard.fill(.white)
                    flipableCard.stroke(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                        .bold()
                } else if card.isMatched {
                    flipableCard.opacity(0)
                } else {
                    flipableCard.fill(.yellow)
                }
            }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let corderRadius: CGFloat = 15
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
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
