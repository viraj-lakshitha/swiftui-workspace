//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Viraj Lakshitha Bandara on 2022-05-07.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    // Inialize as class level params
    private static let emojis: Array<String> = ["😁","😂","😃","😄","😅","😆","😇","😈","😉","😊","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷","😸"]
    
    private static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 5) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
    }
    
    @Published private(set) var model = creatMemoryGame() // @Published -> This will update/publish changes when something changed
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}
