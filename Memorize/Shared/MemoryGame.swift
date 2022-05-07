//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Viraj Lakshitha Bandara on 2022-05-07.
//

import Foundation

struct MemoryGame<CardContent> {
    // private access modifier only affect to setter only
    private(set) var cards: Array<Card>
    
    // "underscore" means, optional key for the input of type Card
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
