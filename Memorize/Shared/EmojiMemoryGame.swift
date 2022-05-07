//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Viraj Lakshitha Bandara on 2022-05-07.
//

import SwiftUI

class EmojiMemoryGame {
    // Inialize as class level params
    static let emojis: Array<String> = ["😁","😂","😃","😄","😅","😆","😇","😈","😉","😊","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷","😸"]
    
    static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 5) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
    }
    
    private(set) var model: MemoryGame<String> = creatMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
