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
    mutating func choose(_ card: Card) { // mutating, means that this function is going to change the this whole struct
        let currIndex = index(of: card)
        cards[currIndex].isFaceUp.toggle() // this toggle() is same as `currCard.isFaceUp = !currCard.isFaceUp`
    }
    
    func index(of card: Card) -> Int? { // In here "of" is outside varible name and "card" is inside variable name
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2)) // add duplicate record, because need to have even number of same emojis to play game
            cards.append(Card(content: content, id: pairIndex*2+1)) // add custom id, you can change as you want
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
